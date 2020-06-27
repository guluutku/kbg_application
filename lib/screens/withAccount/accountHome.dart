import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kbgapp/screens/withAccount/lessons/lessonsHome.dart';
import 'file:///C:/Users/gunul/AndroidStudioProjects/kbg_app-master/lib/screens/withAccount/profile/profile.dart';
import 'package:kbgapp/screens/withAccount/rental/rentalPage.dart';
import 'package:kbgapp/services/authentication.dart';
import 'package:kbgapp/services/database.dart';
import 'package:kbgapp/sharedCode/logout.dart';
import 'package:kbgapp/sharedCode/textInpuDecoration.dart';

class AccountHome extends StatefulWidget {
  @override
  _AccountHomeState createState() => _AccountHomeState();
}

class _AccountHomeState extends State<AccountHome> {

  TextEditingController _value = new TextEditingController();

  String email;
  String name;
  int age = 0;
  double weight = 0.0;

  DatabaseService _databaseService = new DatabaseService();

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {

    void _settingSheetPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: Column(
            children: <Widget>[
              logout,
            ],
          ),
        );
      });
    }

    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.settings),
            label: Text("settings"),
            onPressed: () => _settingSheetPanel(),
          ),

          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Profile"),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile())
              );
            },
          )
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
