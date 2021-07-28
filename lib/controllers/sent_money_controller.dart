import 'package:http/http.dart' as http;
import 'package:sharedpreference/constents/constant.dart';
import 'package:sharedpreference/model/sentMoneyModel.dart';
class SentMoneyController{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(SentMoneyModel sentMoneyController) async {

    String domain = apiDomainRoot;

    var url = '$domain/api/user/money';

    Map login = {
      'amount': "${sentMoneyController.amount}",
    };
    var response = await http.post(Uri.parse(url), body: login,
        headers: {
          "Accept": "application/json",
        }
    );

    return response;
  }

}