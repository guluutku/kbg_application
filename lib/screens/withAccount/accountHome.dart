import 'package:flutter/material.dart';
import 'package:kbgapp/screens/entryPage.dart';

import 'package:kbgapp/screens/withAccount/lessons/lessonsHome.dart';
import 'package:kbgapp/screens/withAccount/rental/rentalPage.dart';
import 'package:kbgapp/services/authentication.dart';
import 'profile/profile.dart';

class AccountHome extends StatefulWidget {
  @override
  _AccountHomeState createState() => _AccountHomeState();
}

class _AccountHomeState extends State<AccountHome> {

  AuthService _authService = new AuthService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        leading: new Container(),
        title: Text("Welcome"),
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
          FlatButton.icon(
            icon: Icon(Icons.close),
            label: Text("Log Out"),
            onPressed: () async{
              await _authService.logOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EntryPage())
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[
              Image.asset("assets/images/accountHome.JPG"),
              Text(
                    " You can rent our equipments or get lessons "
                    "\n "
                    "from our professional teachers. ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              RaisedButton(
                child: Text("Take Lesson"),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LessonHome())
                  );
                },
              ),

              RaisedButton(
                child: Text("Rent Equipments"),
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
