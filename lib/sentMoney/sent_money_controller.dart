import 'package:http/http.dart' as http;
import 'package:sharedpreference/constents/constant.dart';
class SendMoneyController{

  static Future<http.Response> requestThenResponsePrint(String username, String amount, String token) async {
  
    String domain = apiDomainRoot;
  
    var url = '$domain/api/user/money';

    Map data1 = {
      'username': "${username}",
      'amount': "${amount}",
          };
    var response = await http.post(Uri.parse(url), body: data1,
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );
    return response;
  }

}