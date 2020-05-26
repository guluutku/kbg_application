import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kbgapp/services/authentication.dart';

import 'anonLesson/anonyLessonHome.dart';
import 'package:kbgapp/screens/anonymously/anonRental/anonRentalPage.dart';

class AnonymousHomePage extends StatefulWidget {
  @override
  _AnonymousHomePageState createState() => _AnonymousHomePageState();
}

class _AnonymousHomePageState extends State<AnonymousHomePage> {

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {

    void _settingSheetPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text("logout"),
                onPressed: () async{
                  /**await _authService.signOut();*/
                },
              ),
            ],
          ),
        );
      });
    }

    return Scaffold(
      backgroundColor: Colors.brown[100],

      appBar: AppBar(
        title: Text('Welcome User'),
        actions: <Widget>[


          FlatButton.icon(
            icon: Icon(Icons.settings),
            label: Text("settings"),
            onPressed: () => _settingSheetPanel(),
          ),
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
