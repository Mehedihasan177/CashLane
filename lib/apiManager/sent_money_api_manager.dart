import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sharedpreference/constents/constant.dart';

class API_Manager_sent {
   Future<http.Response> getsentData(String token) async {
    String domain = apiDomainRoot;
    var url = '$domain/api/user/money';
    print("hello");
print(Uri.parse(url));
    var response = await http.post(Uri.parse(url), headers: {
      "Accept": "application/json",
      'Authorization': 'Bearer $token',
    });
    print(response.body);
    return response;
  }
}
