import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreference/Transaction/api_manager_transaction_history.dart';
import 'package:sharedpreference/Transaction/transactionHistory_response_model.dart';
import 'package:sharedpreference/sentMoney/sentMoneyModelResponse.dart';
import 'package:sharedpreference/sentMoney/sent_money_api_manager.dart';




class AddMoneySuccessfullPage extends StatefulWidget {
  

  @override
  _AddMoneySuccessfullPageState createState() => _AddMoneySuccessfullPageState();
}

class _AddMoneySuccessfullPageState extends State<AddMoneySuccessfullPage> {
  String finalToken;

  List<Datum> datumlist = [];
  _getTransactionHistory() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString("token");
    setState(() {
      finalToken = obtainedToken;
    });

    print(finalToken);
    API_Manager().getData(finalToken).then((response) {
      setState(() {
        // print(response);
        Map<String, dynamic> decoded = json.decode("${response.body}");
        Iterable list = decoded['data'];
        print(decoded['data']);
        datumlist = list.map((model) => Datum.fromJson(model)).toList();
        print(datumlist);
      });
    });
  }

  @override
  void initState() {
    _getTransactionHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    datumlist = datumlist.reversed.toList();
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  "Sent Money History",
                  style:
                  TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  height: MediaQuery.of(context).size.height * 0.82,
                  child: ListView.builder(
                      itemCount: datumlist.length,
                      itemBuilder: (BuildContext context, int index) {
                        bool isGreen = true;
                        String symbol = "+";

                        print("before IF ");
                        print(isGreen);
                        print(datumlist[index].type);
                        if(datumlist[index].type.toLowerCase() == "sender") {
                          isGreen = false;
                          symbol = "-";
                          print("In IF ");
                          print(isGreen);
                          print(datumlist[index].type);
                        }
                        print("after IF ");
                        print(isGreen);
                        print(datumlist[index].type);
                        return Visibility(
                          child: Column(
                          children: [
                            ListTile(
                              title: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      datumlist[index].type.replaceAll("Sender", "Sent").replaceAll("Receiver", "Received"),
                                      style: TextStyle(fontSize: 15, color: isGreen == true ? Colors.green : Colors.red),
                                    ),
                                    Text(
                                      datumlist[index].comment.toString(),
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                              trailing: Column(
                                children: [
                                  Text(
                                    datumlist[index].createdAt.toString().replaceAll(".000Z", ""),
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    symbol + datumlist[index].amount + " USD",
                                    style: TextStyle(fontSize: 16, color: isGreen == true ? Colors.green : Colors.red),
                                  ),
                                ],
                              ),

                            ),
                            Container(
                              height: 3,
                              width: 380,
                              color: Colors.black.withOpacity(0.07),
                            ),
                          ],
                        ),
                          visible: isGreen==false,
                        );
                      })),
            ],
          ),
        ));
  }
}