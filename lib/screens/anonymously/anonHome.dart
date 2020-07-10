import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        title: Text('Welcome'),
        actions: <Widget>[
          LogOut(),
        ],
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[
              Text(
                " Welcome to KBG Appointment. "
                    "\n"
                    " You can rent our equipments or get lessons "
                    "\n "
                    "from our professional teachers. ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              SizedBox(height: 10,),

              Image.asset("assets/images/huseyinAbee.jpg"),

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
      ),
    );
  }
}
