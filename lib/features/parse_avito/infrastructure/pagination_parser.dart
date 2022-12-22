import 'package:html/dom.dart' as dom;

abstract class IPaginationParser {
  Future<int> pagesCount(dom.Document document);
}

class MockPaginationParser implements IPaginationParser {
  @override
  Future<int> pagesCount(dom.Document document) async {
    return 1;
  }
}

class PaginationParser implements IPaginationParser {
  @override
  Future<int> pagesCount(dom.Document document) async {
    final pagesContainer =
        document.querySelector('div[data-marker="pagination-button"]');

    int max = 0;
    for (var span in pagesContainer!.children) {
      var label = span.innerHtml;
      var page = int.tryParse(label);
      if (page != null) {
        max = (page > max) ? page : max;
      }
    }

    return max;
  }
}
