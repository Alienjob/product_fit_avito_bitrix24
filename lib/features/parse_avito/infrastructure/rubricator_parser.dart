import 'package:html/dom.dart' as dom;
import 'package:product_fit_avito_bitrix/features/parse_avito/infrastructure/dom_helpers.dart';

abstract class IRubricatorParser {
  Future<String> currentSection(dom.Document pageDocument);
}

class RubricatorParser implements IRubricatorParser {
  @override
  Future<String> currentSection(dom.Document pageDocument) async {
    final rubricatorContainer =
        pageDocument.querySelector('div[data-marker="rubricator"]')!;
    final current =
        rubricatorContainer.querySelector(r'a[data-marker$="/current"]')!;
    String id = getAttributeValue(current.parent!.parent!, 'data-marker');
    String title = getText(current);

    return '$id<$title>';
  }
}

class MockRubricatorParser implements IRubricatorParser {
  @override
  Future<String> currentSection(dom.Document pageDocument) async {
    return 'category[1000026]<Птицы>';
  }
}
