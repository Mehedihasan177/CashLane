import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharedpreference/cashOut/cashoutPageScreen.dart';
import 'addMoneyScreen.dart';
import 'package:sharedpreference/Transaction/transactionHistoryScreen.dart';



class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 60),
                alignment: Alignment.topLeft,
                child: Text(
                  "Banking",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 200,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      r"$18.00",
                      style: TextStyle(fontSize: 40),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.4,
                    //color: Color(0xF60D72),
                    child: ElevatedButton(
                      child: Text(
                        "Add Cash",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Get.to(AddMoneyScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xfff9A825),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                    decoration: BoxDecoration(
                        //color: Color(0xF60D72),
                        borderRadius: BorderRadius.circular(18)),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.4,
                    //color: Color(0xF60D72),
                    child: ElevatedButton(
                      child: Text(
                        "Cash Out",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      onPressed: () {
                        Get.to(CashOutPage());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                    decoration: BoxDecoration(
                        //color: Color(0xF60D72),
                        borderRadius: BorderRadius.circular(18)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "041 215 663",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Routing",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Text(
                          "88 .... ....",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Account",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage("images/imageone.jpg"),
                      height: 40,
                      width: 40,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton(
                      onPressed: () {
                        Get.to(Notifications());
                      },
                      child: Text(
                        "Deposit and transfer",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage("images/imagetwo.jpg"),
                      height: 40,
                      width: 40,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton(
                      onPressed: () {
                        //Get.to(BankingScreen());
                      },
                      child: Text(
                        "Bitcoin",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage("images/imagethree.jpg"),
                      height: 40,
                      width: 40,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton(
                      onPressed: () {

                      },
                      child: Text(
                        "Limits",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage("images/imagefour.jpg"),
                      height: 40,
                      width: 40,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton(
                      onPressed: () {

                      },
                      child: Text(
                        "Linked Links",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
