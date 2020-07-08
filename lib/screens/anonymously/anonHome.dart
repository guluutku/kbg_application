import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:kbgapp/services/authentication.dart';
import 'package:kbgapp/sharedCode/logout.dart';
import 'anonLesson/anonyLessonHome.dart';
import 'package:kbgapp/screens/anonymously/anonRental/anonRentalPage.dart';

class AnonymousHomePage extends StatefulWidget {
  @override
  _AnonymousHomePageState createState() => _AnonymousHomePageState();
}

class _AnonymousHomePageState extends State<AnonymousHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.brown[100],

      appBar: AppBar(
        leading: new Container(),
        title: Text('Welcome User'),
        actions: <Widget>[
          logOut(context),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            Text(
              "Please select 'Kite Lessons' to make a appointment for the lessons "
                  "or 'Rent Equipment' to rent our equipments:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LessonsHomePage())
                );
              },
              child: Text('Take Lesson'),
            ),

            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AnonRentalPage())
                );
              },
              child: Text('Rent Equipments'),
            ),
          ],
        ),
      ),
    );
  }
}
