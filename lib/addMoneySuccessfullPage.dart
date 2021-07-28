import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreference/apiManager/sent_money_api_manager.dart';

import 'apiManager/api_manager_transaction_history.dart';
import 'model/sentMoneySuccessfullDocument.dart';
import 'model/transactionHistory_response_model.dart';


class AddMoneySuccessfullPage extends StatefulWidget {
  

  @override
  _AddMoneySuccessfullPageState createState() => _AddMoneySuccessfullPageState();
}

class _AddMoneySuccessfullPageState extends State<AddMoneySuccessfullPage> {
  String tToken;
  
  
  List<Data> datalist = [];
  _getSentMoneyHistory() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString("token");
    setState(() {
      tToken = obtainedToken;
    });

    print(tToken);
    API_Manager_sent().getsentData(tToken).then((response) {
      setState(() {
        // print(response);
        Map<String, dynamic> decoded = json.decode("${response.body}");
        Iterable list = decoded['data'];
        print(decoded['data']);
        datalist = list.map((model) => Data.fromJson(model)).toList();
        print(tToken);
        print(datalist);
      });
    });
  }

  @override
  void initState() {
    _getSentMoneyHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Text("data", style: TextStyle(fontSize: 30),),
              Container(
              height: 500,
              color: Colors.red,
              child: ListView.builder(
                itemCount: datalist.length,
                itemBuilder: (BuildContext context, int index) {
                               return Text(
                                  datalist[index].type,
                                  style: TextStyle(fontSize: 12),
                                );
                }
              )
              ),
            ],
          ),
        )
    );
}
}