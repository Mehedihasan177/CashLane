import 'package:http/http.dart' as http;
import 'package:sharedpreference/constents/constant.dart';
import 'package:sharedpreference/model/reg_requst_model.dart';
class RegistrationController{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(RegReqModel information) async {
    // It starts showing the progressbar
    // ProgressDialog pr = ProgressDialog(context);
    // pr = ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: true, showLogs: true);
    // await pr.show();


    // This string will contain the ResponseResult
    //String printedRes = "";
    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/register';

    Map data1 = {
      'name': "${information.name}",
      'email': "${information.email}",
      'password': "${information.password}",
      'username': "${information.username}",
    };

    // Here we are getting the response
    var response = await http.post(Uri.parse(url), body: data1,
        headers: {
          "Accept": "application/json",
        }
    );

    // After geting the response we need to split all the json formatted data. Otherwise
    // BasicFunctions.showAlertDialog(context, "${response.statusCode}", "${response.body}");
    return response;
  }

}