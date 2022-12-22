import 'package:html/dom.dart' as dom;

String getText(dom.Element element) {
  return element.text.trim();
}

String getAttributeValue(dom.Element element, String attribute) {
  for (var aKey in element.attributes.keys) {
    if ((aKey is String) && (aKey == attribute)) {
      return element.attributes[aKey]!.trim();
    }
    if ((aKey is dom.AttributeName) && (aKey.name == attribute)) {
      return element.attributes[aKey]!.trim();
    }
  }
  return '';
}
