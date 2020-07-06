import 'package:flutter/material.dart';

import 'package:kbgapp/screens/withAccount/lessons/lessonsHome.dart';
import 'package:kbgapp/screens/withAccount/rental/rentalPage.dart';
import 'package:kbgapp/sharedCode/logout.dart';
import 'profile/profile.dart';

class AccountHome extends StatefulWidget {
  @override
  _AccountHomeState createState() => _AccountHomeState();
}

class _AccountHomeState extends State<AccountHome> {

  String email;
  String name;
  int age = 0;
  double weight = 0.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Profile"),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile())
              );
            },
          ),

          logout,
        ],
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[
              Text("Choose lesson or rent"),

              RaisedButton(
                child: Text("Lesson"),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LessonHome())
                  );
                },
              ),

              RaisedButton(
                child: Text("Rent"),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RentalPage())
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
