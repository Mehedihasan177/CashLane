import 'package:http/http.dart' as http;
import 'package:sharedpreference/constents/constant.dart';
import 'package:sharedpreference/notifications/notificationsResponseModel.dart';

class NotificationController{


  static Future<http.Response> requestThenResponsePrint(AllNotificationsOfUser information) async {

    String domain = apiDomainRoot;
    var url = '$domain/api/user/notification';
    Map data1 = {
      'title': "${information.title}",
    };

    var response = await http.post(Uri.parse(url), body: data1,
        headers: {
          "Accept": "application/json",
        }
    );
    return response;
  }

}