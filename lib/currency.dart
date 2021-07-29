import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharedpreference/bankingscreen.dart';
import 'package:sharedpreference/changePassword.dart';

import 'dropdownforCurrenceyPage.dart';

class Currency extends StatefulWidget {
  

  @override
  _CurrencyState createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
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
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.92,
        //padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, left: 15),
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
                      Get.to(ChangedPassword());
                    },
                  )
                ],
              ),
            ),
            Container(
              //padding: EdgeInsets.only(top: 60),
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
                  Container(
                    padding: EdgeInsets.only(top: 10),
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
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
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
              height: 10,
            ),
            Row(
              children: [
                button("1"),
                SizedBox(
                  width: 14,
                ),
                button("2"),
                SizedBox(
                  width: 14,
                ),
                button("3"),
              ],
            ),
            SizedBox(
              height: 17,
            ),
            Row(
              children: [
                button("4"),
                SizedBox(
                  width: 14,
                ),
                button("5"),
                SizedBox(
                  width: 14,
                ),
                button("6"),
              ],
            ),
            SizedBox(
              height: 17,
            ),
            Row(
              children: [
                button("7"),
                SizedBox(
                  width: 14,
                ),
                button("8"),
                SizedBox(
                  width: 14,
                ),
                button("9"),
              ],
            ),
            SizedBox(
              height: 17,
            ),
            Row(
              children: [
                button("."),
                SizedBox(
                  width: 14,
                ),
                button("0"),
                SizedBox(
                  width: 14,
                ),
                button("X"),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.4,
                    //color: Color(0xF60D72),
                    child: ElevatedButton(
                      child: Text(
                        "Sent Money",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        double amount = double.parse(equation);
                        print(amount);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BankingScreen(text: "$amount"),
                            ));
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
                ],
              ),
            ),
          ],
        ),
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
        height: MediaQuery.of(context).size.height * 0.78,
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
