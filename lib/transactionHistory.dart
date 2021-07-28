import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sharedpreference/model/transactionHistory_response_model.dart';

import 'apiManager/api_manager_transaction_history.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "Transaction History",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                    return Column(
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
                                  datumlist[index].details.toString(),
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
                    );
                  })),
        ],
      ),
    ));
  }
}
