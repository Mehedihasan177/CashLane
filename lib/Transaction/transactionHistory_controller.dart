import 'package:http/http.dart' as http;
import 'package:sharedpreference/constents/constant.dart';
class TransactionHistoryController{

  static Future<http.Response> requestThenResponsePrint(String token) async {
  
    String domain = apiDomainRoot;
  
    var url = '$domain/api/user/transaction/history';

    var response = await http.get(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );
    return response;
  }

}