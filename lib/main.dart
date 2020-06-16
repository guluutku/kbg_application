import 'package:flutter/material.dart';

import 'package:kbgapp/screens/entryPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KBG APPOINTMENT',
      home: SignInState(),
    );
  }
}