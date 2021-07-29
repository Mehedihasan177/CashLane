import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreference/bottomnevigation/bottomnevigation.dart';
import 'package:sharedpreference/homepage.dart';
import 'Login/login.dart';

Future<void> main() async {
  GestureBinding.instance?.resamplingEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

String finalEmail;
String finalPassword;
  @override
  void initState() {
    // TODO: implement initState
    getValidationData().whenComplete(() async{
      Timer(Duration(seconds: 3), () =>

    Get.to(finalEmail == null && finalPassword == null ? LoginPage() : BottomNevigation()));
    });
    
    super.initState();
  }

  Future getValidationData() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString("email");
    var obtainedPassword = sharedPreferences.getString("password");
    setState(() {
      finalEmail = obtainedEmail;
      finalPassword = obtainedPassword;
    });
    print(finalEmail);
    print(finalPassword);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: 450,
        child: Image(
            image: AssetImage("images/splash.png"),fit: BoxFit.fill,),
      ),
    );
  }
}
