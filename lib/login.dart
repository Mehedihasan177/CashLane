import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreference/constents/constant.dart';
import 'package:sharedpreference/homepage.dart';
import 'package:sharedpreference/registration.dart';

import 'login model/login_model.dart';
import 'login model/login_response.dart';
import 'login_controller.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isloading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    TextEditingController _textEmail = TextEditingController();
    TextEditingController _textPassword = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(0.9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 18),
            child: Text(
              "Sign In",
              style: TextStyle(fontSize: 24, color: Colors.black87),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 18),
            child: Text(
              "Welcome Back!",
              style: TextStyle(fontSize: 17, color: Colors.black87),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.91,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: TextField(
              controller: _textEmail,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black),
              scrollPadding: EdgeInsets.all(10),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                border: InputBorder.none,
                hintText: "Email/phone number",
                prefixIcon: Icon(
                  Icons.supervisor_account_sharp,
                  size: 18,
                  color: Color(0xfff9A825),
                ),
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.91,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: TextField(
              controller: _textPassword,
              obscureText: true,
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.black),
              scrollPadding: EdgeInsets.all(10),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                border: InputBorder.none,
                hintText: "Password",
                prefixIcon: Icon(
                  Icons.lock_outline,
                  size: 18,
                  color: Color(0xfff9A825),
                ),
                suffixIcon: Icon(
                  Icons.remove_red_eye_outlined,
                  size: 18,
                  color: Color(0xfff9A825),
                ),
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.06,
            child: Container(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () {
                  //Get.to(ForgetPassword());
                },
                child: RichText(
                  text: TextSpan(
                    text: "Forget Password? ",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.8), fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.6,
            //color: Color(0xF60D72),
            child: ElevatedButton(
              child: Text(
                "Sign In",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () async {
                var jsonData = null;
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                LoginModel myInfo = new LoginModel(
                    email: _textEmail.text, password: _textPassword.text);
                await LoginController.requestThenResponsePrint(myInfo)
                    .then((value) async {
                  print(value.statusCode);
                  print(value.body);
                  final Map parsed = json.decode(value.body);

                  final loginobject = LoginResponse.fromJson(parsed);
                  print(loginobject.accessToken);
                  sharedPreferences.setString("token", loginobject.accessToken);
                  
                  if (value.statusCode == 200) {
                    sharedPreferences.setString("email", _textEmail.text);
                    sharedPreferences.setString("password", _textPassword.text);
                    return Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                  } else {
                    return LoginController.requestThenResponsePrint(jsonData);
                  }
                  
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xfff9A825),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
              ),
            ),
            decoration: BoxDecoration(
                //color: Color(0xF60D72),
                borderRadius: BorderRadius.circular(18)),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width * 1,
            child: FlatButton(
              onPressed: () async{
                                      LoginModel myInfo = new LoginModel(
                    email: _textEmail.text, password: _textPassword.text);
                await LoginController.requestThenResponsePrint(myInfo)
                    .then((value) async{
                     print(value.statusCode);
                     print(value.body);
                     final Map parsed = json.decode(value.body); 

                     final loginobject = LoginResponse.fromJson(parsed);
                     print(loginobject.accessToken);
                });
              },
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8), fontSize: 15),
                  children: [
                    TextSpan(
                      text: 'Do Registration!',
                      style: TextStyle(color: Colors.black.withOpacity(0.8)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
