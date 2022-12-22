import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import 'package:dio/dio.dart';

abstract class IHttpSource {
  Future<dom.Document> getDocument(url);
}

class MockHttpSource implements IHttpSource {
  @override
  Future<dom.Document> getDocument(url) async {
    return parse(await rootBundle.loadString('assets/avito_full_answer.html'));
  }
}

class HttpSource implements IHttpSource {
  @override
  Future<dom.Document> getDocument(url) async {
    //var response = await http.get(Uri.parse(url));
    //return parse(response.body);
    var response = await Dio().get(url);
    return parse(response.data);
  }
}
