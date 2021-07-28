import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sharedpreference/controllers/registraion_controller.dart';
import 'package:sharedpreference/model/reg_requst_model.dart';


class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    TextEditingController _textname = TextEditingController();
    TextEditingController _textusername = TextEditingController();
    TextEditingController _textphonenumber = TextEditingController();
    TextEditingController _textEmail = TextEditingController();
    TextEditingController _textPassword = TextEditingController();
    TextEditingController _textConfirmPassword = TextEditingController();

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(0.9),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 80, right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10),
                child: Text("Registration", style: TextStyle(
                    fontSize: 24,
                    color: Colors.black.withOpacity(0.8)
                ),),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10),
                child: Text("Welcome to Registration!", style: TextStyle(
                    fontSize: 17,
                    color: Colors.black.withOpacity(0.8)
                ),),
              ),
              SizedBox(height: 30,),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.91,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: TextField(
                  controller: _textname,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black),
                  scrollPadding: EdgeInsets.all(10),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    border: InputBorder.none,
                    hintText: "Name",
                    prefixIcon: Icon(
                      Icons.supervisor_account_sharp,
                      size: 24,
                      color: Color(0xfff9A825),
                    ),
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
                            Container(
                height: MediaQuery.of(context).size.height * 0.07,
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
                    hintText: "Email",
                    prefixIcon: Icon(
                      Icons.email,
                      size: 24,
                      color: Color(0xfff9A825),
                    ),
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
                            Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.91,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: TextField(
                  controller: _textPassword,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.black),
                  scrollPadding: EdgeInsets.all(10),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    border: InputBorder.none,
                    hintText: "Password",
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      size: 24,
                      color: Color(0xfff9A825),
                    ),
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.91,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: TextField(
                  controller: _textusername,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black),
                  scrollPadding: EdgeInsets.all(10),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    border: InputBorder.none,
                    hintText: "Username",
                    prefixIcon: Icon(
                      Icons.supervisor_account_sharp,
                      size: 24,
                      color: Color(0xfff9A825),
                    ),
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 10,),
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.07,
              //   width: MediaQuery.of(context).size.width * 0.91,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(18),
              //   ),
              //   child: TextField(
              //     controller: _textphonenumber,
              //     keyboardType: TextInputType.number,
              //     style: TextStyle(color: Colors.black),
              //     scrollPadding: EdgeInsets.all(10),
              //     decoration: InputDecoration(
              //       contentPadding: EdgeInsets.all(20),
              //       border: InputBorder.none,
              //       hintText: "Phone Number",
              //       prefixIcon: Icon(
              //         Icons.supervisor_account_sharp,
              //         size: 24,
              //         color: Color(0xfff9A825)
              //       ),
              //       hintStyle: TextStyle(
              //         fontSize: 18,
              //         color: Colors.black.withOpacity(0.4),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(height: 10,),
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.07,
              //   width: MediaQuery.of(context).size.width * 0.91,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(18),
              //   ),
              //   child: TextField(
              //     keyboardType: TextInputType.text,
              //     style: TextStyle(color: Colors.black),
              //     scrollPadding: EdgeInsets.all(10),
              //     decoration: InputDecoration(
              //       contentPadding: EdgeInsets.all(20),
              //       border: InputBorder.none,
              //       hintText: "Address",
              //       prefixIcon: Icon(
              //         Icons.supervisor_account_sharp,
              //         size: 24,
              //         color: Color(0xfff9A825),
              //       ),
              //       hintStyle: TextStyle(
              //         fontSize: 18,
              //         color: Colors.black.withOpacity(0.4),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(height: 10,),
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.07,
              //   width: MediaQuery.of(context).size.width * 0.91,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(18),
              //   ),
              //   child: TextField(
              //     controller: _textEmail,
              //     keyboardType: TextInputType.emailAddress,
              //     style: TextStyle(color: Colors.black),
              //     scrollPadding: EdgeInsets.all(10),
              //     decoration: InputDecoration(
              //       contentPadding: EdgeInsets.all(20),
              //       border: InputBorder.none,
              //       hintText: "Email",
              //       prefixIcon: Icon(
              //         Icons.email,
              //         size: 24,
              //         color: Color(0xfff9A825),
              //       ),
              //       hintStyle: TextStyle(
              //         fontSize: 18,
              //         color: Colors.black.withOpacity(0.4),
              //       ),
              //     ),
              //   ),
              // ),

              //SizedBox(height: 10,),
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.07,
              //   width: MediaQuery.of(context).size.width * 0.91,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(18),
              //   ),
              //   child: TextField(
              //     controller: _textConfirmPassword,
              //     obscureText: true,
              //     keyboardType: TextInputType.text,
              //     style: TextStyle(color: Colors.black),
              //     scrollPadding: EdgeInsets.all(10),
              //     decoration: InputDecoration(
              //       contentPadding: EdgeInsets.all(20),
              //       border: InputBorder.none,
              //       hintText: "Confirm Password",
              //       prefixIcon: Icon(
              //         Icons.lock_outline,
              //         size: 24,
              //         color: Color(0xfff9A825),
              //       ),
              //       hintStyle: TextStyle(
              //         fontSize: 18,
              //         color: Colors.black.withOpacity(0.4),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: 20,),
              Container(
                height: MediaQuery.of(context).size.height * 0.03,
                width: MediaQuery.of(context).size.width * 0.91,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                      ),
                      child: Icon(
                        Icons.done,size: 20, color: Colors.green,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text("Keep Saving me", style: TextStyle(fontSize: 17),),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.8,
                //color: Color(0xF60D72),
                child: ElevatedButton(
                  child: Text(
                    "Registration",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () async{
                    // print(_textname);
                    // print(_textusername);
                    // print(_textEmail);
                    // print(_textPassword);

                    RegReqModel myInfo = new RegReqModel(name: _textname.text, username: _textusername.text, email: _textEmail.text, password: _textPassword.text);
                    await RegistrationController.requestThenResponsePrint(myInfo).then((value){
                      print(value.statusCode);
                    });

                      

                //       LoginModel myInfo = new LoginModel(
                //     email: _textEmail.text, password: _textPassword.text);
                // await LoginController.requestThenResponsePrint(myInfo)
                //     .then((value) async{
                //      print(value.statusCode);
                //      print(value.body);
                //      final Map parsed = json.decode(value.body); 

                //      final loginobject = LoginResponse.fromJson(parsed);
                //      print(loginobject.accessToken);

                //      await  SendMoneyController.requestThenResponsePrint(_textusername.text, _textname.text, loginobject.accessToken).then((value2){
                //       print(value2.statusCode);
                //       print(value2.body);
                //       });
                // });

                //   LoginModel myInfo = new LoginModel(
                //     email: _textEmail.text, password: _textPassword.text);
                // await LoginController.requestThenResponsePrint(myInfo)
                //     .then((value) async{
                //      print(value.statusCode);
                //      print(value.body);
                //      final Map parsed = json.decode(value.body); 

                //      final loginobject = LoginResponse.fromJson(parsed);
                //      print(loginobject.accessToken);

                //      await  CashoutController.requestThenResponsePrint(_textname.text, loginobject.accessToken).then((value2){
                //       print(value2.statusCode);
                //       print(value2.body);
                //       });
                // });
                   
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF1A150D),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                  ),
                ),
                decoration: BoxDecoration(
                  //color: Color(0xF60D72),
                    borderRadius: BorderRadius.circular(18)),
              ),
              SizedBox(height: 5,),
              Container(
                // height: MediaQuery.of(context).size.height * 0.06,
                // width: MediaQuery.of(context).size.width * 0.91,
                child: FlatButton(
                  onPressed: () {
                    //Get.to(LoginPage());
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Have an account? ",
                      style: TextStyle(color: Colors.black87, fontSize: 20),
                      children: [
                        TextSpan(text: 'Sign In!', style: TextStyle(color: Color(0xfff9A825)),
                        ),
                      ],
                    ),
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

