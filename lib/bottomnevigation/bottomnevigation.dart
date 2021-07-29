import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../activity.dart';
import '../currency.dart';
import '../homepage.dart';
import '../Transaction/transactionHistoryScreen.dart';

class BottomNevigation extends StatefulWidget {


  @override
  _BottomNevigationState createState() => _BottomNevigationState();
}

class _BottomNevigationState extends State<BottomNevigation> {
  int _indexPage = 0;
  final pageOption = [
    HomePage(),
    Notifications(),
    Currency(),
    Activity(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageOption[_indexPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.only(top: 6),
              child: Icon(
                Icons.home,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.only(bottom: 6),
              child: Icon(
                Icons.credit_card,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.only(bottom: 6),
              child: Icon(
                Icons.attach_money,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(

              child: Icon(
                Icons.timer_rounded,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            label: '',
          ),
        ],
        onTap: (int index) {
          setState(() {
            _indexPage = index;
          });
        },
      ),
    );
  }
}
