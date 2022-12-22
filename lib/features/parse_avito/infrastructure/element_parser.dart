import 'package:product_fit_avito_bitrix/features/parse_avito/domain/element_data.dart';
import 'package:html/dom.dart' as dom;
import 'package:product_fit_avito_bitrix/features/parse_avito/infrastructure/dom_helpers.dart';

abstract class IElementParser {
  Future<ElementData> parse(String id, dom.Element element, String section);
}

class MockElementParser implements IElementParser {
  @override
  Future<ElementData> parse(
      String id, dom.Element element, String section) async {
    return ElementData(
      id: '1',
      url: '1',
      name: '1',
      description: '1',
      price: '1',
      section: '1',
    );
  }
}

class ElementParser implements IElementParser {
  @override
  Future<ElementData> parse(
      String id, dom.Element element, String section) async {
    final sliderLink = element.querySelector('a[itemprop="url"]')!;
    final body = element.querySelector('div[class^="iva-item-body"]')!;

    late dom.Element title;
    late dom.Element price;
    late dom.Element description;

    for (var el in body.children) {
      if (el.className.contains('iva-item-title')) title = el;
      if (el.className.contains('iva-item-price')) price = el;
      if (el.className.contains('iva-item-description')) description = el;
    }

    ElementData data = ElementData(
      id: getAttributeValue(element, 'data-item-id'),
      url: getAttributeValue(sliderLink, 'href'),
      name: getText(title),
      description: getText(description),
      price: getText(price).replaceAll(RegExp(r'[^0-9]'), ''),
      section: section,
    );

    return data;
  }
}
