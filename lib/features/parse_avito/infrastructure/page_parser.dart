import 'package:flutter/services.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import 'package:product_fit_avito_bitrix/features/parse_avito/infrastructure/dom_helpers.dart';

class ElementHtml {
  final String id;
  final dom.Element element;

  ElementHtml(this.id, this.element);
}

abstract class IPageParser {
  Future<List<ElementHtml>> getElements(dom.Document document);
}

class PageParser implements IPageParser {
  @override
  Future<List<ElementHtml>> getElements(dom.Document document) async {
    List<ElementHtml> result = [];
    final itemList = document.querySelectorAll('div[data-marker="item"]');
    for (var item in itemList) {
      result.add(ElementHtml(getAttributeValue(item, 'data-item-id'), item));
    }
    return result;
  }
}

class MockPageParser implements IPageParser {
  @override
  Future<List<ElementHtml>> getElements(dom.Document document) async {
    var avitoElement = await rootBundle.loadString('assets/avito_element.html');
    return [ElementHtml('2506002720', parse(avitoElement).documentElement!)];
  }
}
