
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreference/addMoneySuccessfullPage.dart';
import 'package:sharedpreference/bankingscreen.dart';
import 'package:sharedpreference/controllers/sent_money_controller.dart';
import 'package:sharedpreference/homepage.dart';
import 'package:sharedpreference/model/sentMoneyModel.dart';
import 'package:sharedpreference/model/sentMoneyModelResponse.dart';

import 'dropdown.dart';
import 'model/sentMoneySuccessfullDocument.dart';


class AddMoneyScreen extends StatefulWidget {
  

  @override
  _AddMoneyScreenState createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9A825),
      body: Stack(
        children: [
          rectangleShap(),
          Column(
            children: [
              Designposition(),
            ],
          ),
        ],
      ),
    );
  }
}

class Designposition extends StatefulWidget {
  

  @override
  _DesignpositionState createState() => _DesignpositionState();
}

class _DesignpositionState extends State<Designposition> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  operation(String btntext) {
    setState(() {
      if (btntext == "X") {
        double equationFontSize = 48.0;
        double resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if (equation == "0") {
          equation = btntext;
        } else {
          equation = equation + btntext;
        }
      }
    });
  }

  Widget button(String btntext) {
    return Expanded(
        child: RawMaterialButton(
      //padding: EdgeInsets.all(10),
      child: Text(
        "$btntext",
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
      onPressed: () {
        operation(btntext);
      },
    ));
  }

  NewObject value = items.first;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.999,
      //padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 35, left: 15),
            height: MediaQuery.of(context).size.height * 0.12,
            alignment: Alignment.center,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.document_scanner,
                    color: Colors.white,
                    size: 25,
                  ),
                  onPressed: () {
                    // do something
                  },
                ),
                SizedBox(
                  width: 265,
                ),
                IconButton(
                  icon: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(100)),
                    child: Icon(
                      Icons.person_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  onPressed: () {
                    //Get.to(ChangedPassword());
                  },
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            height: MediaQuery.of(context).size.height * 0.3,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 5,
                  width: 60,
                  color: Colors.black.withOpacity(0.4),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.only(top: 60),
                  child: Text(
                    "$equation",

                    style: TextStyle(fontSize: 40),

                  ),
                ),
                Text(
                  "Cash balance",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            height: 40,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.red.withOpacity(0.8),
            ),
            child: DropdownButton<NewObject>(
              value: value, // currently selected item
              items: items
                  .map((item) => DropdownMenuItem<NewObject>(
                        child: Row(
                          children: [
                            const SizedBox(width: 8),
                            Text(
                              item.title,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ],
                        ),
                        value: item,
                      ))
                  .toList(),
              onChanged: (value) => setState(() {
                this.value = value;
              }),
            ),
          ),
          SizedBox(
            height: 55,
          ),
          Row(
            children: [
              button("1"),
              SizedBox(
                width: 19,
              ),
              button("2"),
              SizedBox(
                width: 19,
              ),
              button("3"),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              button("4"),
              SizedBox(
                width: 19,
              ),
              button("5"),
              SizedBox(
                width: 19,
              ),
              button("6"),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              button("7"),
              SizedBox(
                width: 19,
              ),
              button("8"),
              SizedBox(
                width: 19,
              ),
              button("9"),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              button("."),
              SizedBox(
                width: 19,
              ),
              button("0"),
              SizedBox(
                width: 19,
              ),
              button("X"),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.5,
              //color: Color(0xF60D72),
              child: ElevatedButton(
                child: Text(
                  "Send Money",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () async{
                  // String finalToken;
                  // double amount = double.parse(equation);
                  // print(amount);
                  // var jsonData = null;
                  // SharedPreferences sharedPreferences =
                  // await SharedPreferences.getInstance();
                  // SentMoneyModel myInfo = new SentMoneyModel(
                  //     amount: amount.toString());
                  // await SentMoneyController.requestThenResponsePrint(myInfo)
                  //     .then((value) async {
                  //   print(value.statusCode);
                  //   print(value.body);
                  //   final Map parsed = json.decode(value.body);
                  //
                  //   final sentmoneyobject = SentMoneyModelResponse.fromJson(parsed);
                  //   print(sentmoneyobject.amount);
                  //   var obtainedToken = sharedPreferences.getString("token");
                  //   setState(() {
                  //     finalToken = obtainedToken;
                  //   });
                  //
                  //   print(finalToken);
                  //
                  //   if (value.statusCode == 200) {
                  //     amount: amount.toString();
                  //     return Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => HomePage()),
                  //     );
                  //   } else {
                  //     return SentMoneyController.requestThenResponsePrint(jsonData);
                  //   }
                  //
                  // });
                  Get.to(AddMoneySuccessfullPage());
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
          ),
        ],
      ),
    );
  }

  }

class rectangleShap extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.86,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(63),
              topRight: Radius.circular(63),
            ),
            color: Colors.white),
      ),
    );
  }
}
