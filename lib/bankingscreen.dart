import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreference/search/searchUserController.dart';
import 'package:sharedpreference/search/searchUserResponseModel.dart';
import 'package:sharedpreference/sentMoney/sentMoneyModelResponse.dart';
import 'package:sharedpreference/sentMoney/sentMoneySuccessfullPage.dart';
import 'package:sharedpreference/sentMoney/sent_money_controller.dart';

import 'dropdownbankingscreen.dart';
import 'model/information.dart';
import 'model/informationlist.dart';

class BankingScreen extends StatefulWidget {
 String text;
 BankingScreen({this.text});

  @override
  _BankingScreenState createState() => _BankingScreenState(text);
}

class _BankingScreenState extends State<BankingScreen> {

  String text;
  _BankingScreenState(this.text);

  TextEditingController usernameC = new TextEditingController();
  TextEditingController noteC = new TextEditingController();



  List<SearchedUserResponse> item = [];
  Bankingscreen value = items.first;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.99,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 47,
                        //padding: EdgeInsets.only(right: 20),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.clear_rounded),
                          color: Color(0xfff9A825),
                          iconSize: 30,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "$text",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 260,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: DropdownButton<Bankingscreen>(
                              value: value, // currently selected item
                              items: items
                                  .map(
                                      (item) => DropdownMenuItem<Bankingscreen>(
                                            child: Row(
                                              children: [
                                                const SizedBox(width: 10),
                                                Text(
                                                  item.title,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.red),
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
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.16,
                        //color: Color(0xF60D72),
                        child: ElevatedButton(
                          child: Text(
                            "Pay",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          onPressed: () {
                            //Get.to(BottomNevigation());

                            requestSearchUser(usernameC.text,noteC.text);
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
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 2,
                  color: Colors.black.withOpacity(0.2),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        "To",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.black),
                          scrollPadding: EdgeInsets.all(10),
                          controller: usernameC,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            border: InputBorder.none,
                            hintText: "Username",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 2,
                  color: Colors.black.withOpacity(0.2),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        "For",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.black),
                          scrollPadding: EdgeInsets.all(10),
                          controller: noteC,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            border: InputBorder.none,
                            hintText: "Note",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    height: 100,
                    //padding: EdgeInsets.only(top: 50),
                    child: ListView.builder(
                        itemCount: item.length,
                        itemBuilder: (context, index) {
                          // final items = item[index];
                          return buildListTile(item[index]);
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildListTile(SearchedUserResponse items) => SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              //width: 250,
              padding: EdgeInsets.only(bottom: 30),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.6),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(items.image.toString()),
                ),
                title: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items.name.toString(),
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                      Text(
                        items.username.toString(),
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  //Get.to(DoctorAppointment());
                  requestSendMoney(items.username, widget.text, finalToken);
                },
              ),
            ),
          ],
        ),
      );
  String finalToken;
  List<SentMoneyModelResponse> sentmoneyList = [];
  Future<void> requestSendMoney(String username, String note, String token) async {

    SendMoneyController.requestThenResponsePrint(username,widget.text,note,token).then((response) {
      setState(() {
        print(response.statusCode);
        print(response.body);

        if(response.statusCode==200){
          Get.to(AddMoneySuccessfullPage());
        }

      });
    });

  }

  Future<void> requestSearchUser(String username, String note) async {

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString("token");
    setState(() {
      finalToken = obtainedToken;
    });

    print(finalToken);
    SearchUserController.requestThenResponsePrint(username,finalToken).then((response) {
      setState(() {
        print(response.statusCode);
        print(response.body);

        if(response.statusCode==200){
          // requestSendMoney(usernameC.text,noteC.text);

          final Map parsed = json.decode(response.body);
          SearchedUserResponse searchedUserResponse = SearchedUserResponse.fromJson(parsed['data']);
          item.clear();
          setState(() {
          item.add(searchedUserResponse);
          });
        }

      });
    });

  }



}
