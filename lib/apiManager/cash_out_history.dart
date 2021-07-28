import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sharedpreference/constents/constant.dart';

class API_ManagerCashOUt {
  Future<http.Response> getcashoutData(String token) async {
    String domain = apiDomainRoot;
    var url = '$domain/api/user/cashout/history';

    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    });
    print(response.body);
    return response;
  }
}
