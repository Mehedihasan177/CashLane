import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';
class ForgetPassword extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(0.9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 18),
            child: Text("Forget Password", style: TextStyle(
                fontSize: 24,
                color: Colors.black87
            ),),
          ),
          SizedBox(height: 20,),
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.91,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black),
              scrollPadding: EdgeInsets.all(10),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                border: InputBorder.none,
                hintText: "Email/phone number",
                prefixIcon: Icon(
                  Icons.email_outlined,
                  size: 18,
                  color: Colors.yellow,
                ),
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black87.withOpacity(0.3),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.91,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.black),
              scrollPadding: EdgeInsets.all(10),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                border: InputBorder.none,
                hintText: "Password",
                prefixIcon: Icon(
                  Icons.lock_sharp,
                  size: 18,
                  color: Colors.yellow,
                ),
                suffixIcon: Icon(
                  Icons.remove_red_eye_outlined,
                  size: 18,
                  color:  Colors.yellow,
                ),
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black87.withOpacity(0.3),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.91,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
              child: TextField(
                obscureText: true,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black),
                scrollPadding: EdgeInsets.all(10),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  border: InputBorder.none,
                  hintText: "Confirm Password",
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    size: 18,
                    color: Colors.yellow,
                  ),
                  suffixIcon: Icon(
                    Icons.remove_red_eye_outlined,
                    size: 18,
                    color:  Colors.yellow,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black87.withOpacity(0.3),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
              child: TextField(
                obscureText: true,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black),
                scrollPadding: EdgeInsets.all(10),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  border: InputBorder.none,
                  hintText: "Varification Code",
                  prefixIcon: Icon(
                    Icons.vpn_key_outlined,
                    size: 18,
                    color: Colors.red,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black87.withOpacity(0.3),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 40,),
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.6,
            //color: Color(0xF60D72),
            child: ElevatedButton(
              child: Text(
                "Next",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Get.to(LoginPage());
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xfffdd835),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
              ),
            ),
            decoration: BoxDecoration(
              //color: Color(0xF60D72),
                borderRadius: BorderRadius.circular(18)),
          ),

        ],
      ),
    );
  }
}

