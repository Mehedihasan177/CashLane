import 'package:flutter/material.dart';

class NewObject {
  final String title;

  NewObject(this.title);
}

   final List<NewObject> items = <NewObject>[
    NewObject('USD'),
    NewObject('TAKA'),
    NewObject('AFN'),
    NewObject('EUR'),
  ];