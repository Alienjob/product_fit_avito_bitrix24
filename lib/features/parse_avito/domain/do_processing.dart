import 'package:product_fit_avito_bitrix/features/parse_avito/domain/processing_result.dart';
import 'package:product_fit_avito_bitrix/features/parse_avito/infrastructure/avito_url_maker.dart';
import 'package:product_fit_avito_bitrix/features/parse_avito/infrastructure/bitrix24_api_provider.dart';
import 'package:product_fit_avito_bitrix/features/parse_avito/infrastructure/db_provider.dart';
import 'package:product_fit_avito_bitrix/features/parse_avito/infrastructure/element_parser.dart';
import 'package:product_fit_avito_bitrix/features/parse_avito/infrastructure/http_source.dart';
import 'package:product_fit_avito_bitrix/features/parse_avito/infrastructure/page_parser.dart';
import 'package:product_fit_avito_bitrix/features/parse_avito/infrastructure/pagination_parser.dart';
import 'package:product_fit_avito_bitrix/features/parse_avito/infrastructure/rubricator_parser.dart';

class Processor {
  static Future<ProcessingResult> doProcessing(String url) async {
    //providers
    final IHttpSource httpSource = HttpSource();
    final IPageParser pageParser = PageParser();
    final IPaginationParser paginationParser = PaginationParser();
    final IRubricatorParser rubricatorParser = RubricatorParser();
    final IDBProvider dbProvider = await DBProvider.getInstance();
    final IElementParser elementParser = ElementParser();
    final IBitrixProvider bitrixProvider = BitrixProvider();

    int elementsCount = 0;
    int newElementsCount = 0;
    int sendedElementsCount = 0;
    int parsedElementsCount = 0;

    final initDocument = await httpSource.getDocument(url);

    //paginator
    final pages = await paginationParser.pagesCount(initDocument);

    //rubricator
    final section = await rubricatorParser.currentSection(initDocument);

    // process pages data
    for (var page = 1; page <= pages; page++) {
      final pageUrl = AvitoURLMaker.pageUrl(url, page);
      final pageDocument = await httpSource.getDocument(pageUrl);
      final htmlElements = await pageParser.getElements(pageDocument);
      elementsCount += htmlElements.length;

      // check elements status
      List<ElementHtml> newHtmlElements = [];
      for (var el in htmlElements) {
        final status = await dbProvider.getStatus(el.id);
        if (status != ProcessingStatus.sended) {
          dbProvider.setFinded(el.id, el.element.outerHtml);
          newHtmlElements.add(el);
        }
      }
      newElementsCount += newHtmlElements.length;

      // process elements
      for (var htmlElement in newHtmlElements) {
        // parse
        final dataElement = await elementParser.parse(
            htmlElement.id, htmlElement.element, section);
        await dbProvider.setParsed(htmlElement.id, dataElement);
        parsedElementsCount += 1;

        // send
        final success = await bitrixProvider.send(dataElement);
        if (success) {
          await dbProvider.setSended(htmlElement.id);
          sendedElementsCount += 1;

          if (sendedElementsCount > 4) break;
        }
      }
    }

    return ProcessingResult(
      succesGetURL: true,
      dbConnected: true,
      bitrix24Connected: true,
      step: 4,
      pages: pages,
      elements: elementsCount,
      newElements: newElementsCount,
      parsedElements: parsedElementsCount,
      sendedElements: sendedElementsCount,
    );
  }
}
