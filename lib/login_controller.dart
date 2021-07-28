import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreference/constents/constant.dart';
import 'login model/login_model.dart';
class LoginController{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(LoginModel loginController) async {
    var jsonData = null;
SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // It starts showing the progressbar
    // ProgressDialog pr = ProgressDialog(context);
    // pr = ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: true, showLogs: true);
    // await pr.show();


    // This string will contain the ResponseResult
    //String printedRes = "";
    // This is a a callof global veriable
    
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/login';

    Map login = {
      'email': "${loginController.email}",
      'password': "${loginController.password}",
    };
var body = json.encode(login);
    // Here we are getting the response
    var response = await http.post(Uri.parse(url), body: login,
        headers: {
          "Accept": "application/json",
        }
    );

    // After geting the response we need to split all the json formatted data. Otherwise
    // BasicFunctions.showAlertDialog(context, "${response.statusCode}", "${response.body}");
    return response;
  }

}