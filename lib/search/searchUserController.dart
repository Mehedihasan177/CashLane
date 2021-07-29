import 'package:http/http.dart' as http;
import 'package:sharedpreference/constents/constant.dart';
class SearchUserController{

  static Future<http.Response> requestThenResponsePrint(String username, String token) async {

    String domain = apiDomainRoot;

    var url = '$domain/api/user/search';

    Map data1 = {
      'username': "${username}",
    };
    print(data1);
    var response = await http.post(Uri.parse(url), body: data1,
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );
    return response;
  }

}