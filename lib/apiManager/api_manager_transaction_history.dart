import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sharedpreference/constents/constant.dart';

class API_Manager {
   Future<http.Response> getData(String token) async {
    String domain = apiDomainRoot;
    var url = '$domain/api/user/transaction/history';

    var response = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      'Authorization': 'Bearer $token',
    });
    print(response.body);
    return response;
  }
}
