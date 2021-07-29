import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreference/cashOut/api_manager_cashout_history.dart';

import 'package:sharedpreference/model/cashoutSuccessfullDocumnet.dart';

class SuccessfulCashOut extends StatefulWidget {

  @override
  _SuccessfulCashOutState createState() => _SuccessfulCashOutState();
}

class _SuccessfulCashOutState extends State<SuccessfulCashOut> {
String finalToken;

List<Pending> pending = [];
List<Pending> completed = [];

_getCashoutHistory()async{
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var catchtoken = sharedPreferences.getString("token");
  setState(() {
    finalToken = catchtoken;
  });

  print(finalToken);

  API_ManagerCashOUt().getcashoutData(finalToken).then((value){
    setState(() {
      print(value.body);
      Map<String, dynamic> decoded = json.decode("${value.body}");

      //pending list
      Iterable listPending = decoded['data']['Pending'];
      print(decoded['data']);
      pending = listPending.map((model) => Pending.fromJson(model)).toList();
      print(pending);

      //completed list
      Iterable listCompleted = decoded['data']['Completed'];
      print(decoded['data']);
      completed = listCompleted.map((model) => Pending.fromJson(model)).toList();
      print(completed);

    });
  });
}

@override
  void initState() {
  _getCashoutHistory();
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
                      itemCount: pending.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(
                          pending[index].amount,
                          style: TextStyle(fontSize: 30),
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