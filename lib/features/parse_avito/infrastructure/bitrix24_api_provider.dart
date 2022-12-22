// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:product_fit_avito_bitrix/features/parse_avito/domain/element_data.dart';
import 'package:http/http.dart' as http;

abstract class IBitrixProvider {
  Future<bool> send(ElementData data);
}

class MockBitrixProvider implements IBitrixProvider {
  @override
  Future<bool> send(ElementData data) async {
    return true;
  }
}

class BitrixProvider implements IBitrixProvider {
  static const web_hook_secret_url =
      r'https://b24-ov8e39.bitrix24.com/rest/1/4g3c4kzzgs0ixz3h/crm.deal.add.json?';

  @override
  Future<bool> send(ElementData data) async {
    // var uriParsedF = Uri.parse(web_hook_secret_url_fields);
    // var uriF = Uri(
    //   scheme: uriParsedF.scheme,
    //   host: uriParsedF.host,
    //   path: uriParsedF.path,
    // );
    // var responseF = await http.post(
    //   uriF,
    // );

    var uriParsed = Uri.parse(web_hook_secret_url);
    var uri = Uri(
        scheme: uriParsed.scheme,
        host: uriParsed.host,
        path: uriParsed.path,
        queryParameters: {
          'fields[TITLE]': '${data.section}${data.id} ${data.name}',
          'fields[UF_CRM_1671667029701]': data.description,
          'fields[UF_CRM_1671667062196]': data.url,
          'fields[OPPORTUNITY]': data.price,
        });

    var response = await http.post(
      uri,
    );
    if (response.statusCode >= 300) {
      return false;
    }
    Map<String, dynamic> responseMap = jsonDecode(response.body);
    if (responseMap.containsKey('error')) {
      return false;
    } else {
      await Future.delayed(const Duration(seconds: 1));
      return true;
    }

    //! crm deal add possible fields
    // "TITLE": "Regular sale",
    // "TYPE_ID": "GOODS",
    // "STAGE_ID": "NEW",
    // "COMPANY_ID": 3,
    // "CONTACT_ID": 3,
    // "OPENED": "Y",
    // "ASSIGNED_BY_ID": 1,
    // "PROBABILITY": 30,
    // "CURRENCY_ID": "USD",
    // "OPPORTUNITY": 5000,
    // "BEGINDATE": date2str(current),
    // "CLOSEDATE": date2str(nextMonth)

    //! crm lead add possible fields
    //    $queryData = http_build_query(array(
    //  'fields' => array(
    //  "TITLE" => $_REQUEST['first_name'].' '.$_REQUEST['last_name'],
    //  "NAME" => $_REQUEST['first_name'],
    //  "LAST_NAME" => $_REQUEST['last_name'],
    //  "STATUS_ID" => "NEW",
    //  "OPENED" => "Y",
    //  "ASSIGNED_BY_ID" => 1,
    //  "PHONE" => array(array("VALUE" => $_REQUEST['phone'], "VALUE_TYPE" => "WORK" )),
    //  "EMAIL" => array(array("VALUE" => $_REQUEST['email'], "VALUE_TYPE" => "WORK" )),
    //  ),
    //  'params' => array("REGISTER_SONET_EVENT" => "Y")
    //  ));
  }
}
