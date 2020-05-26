import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kbgapp/services/authentication.dart';
import 'package:kbgapp/services/database.dart';
import 'package:kbgapp/sharedCode/textInpuDecoration.dart';

class AccountHome extends StatefulWidget {
  @override
  _AccountHomeState createState() => _AccountHomeState();
}

class _AccountHomeState extends State<AccountHome> {

  TextEditingController _value = new TextEditingController();

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
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text("logout"),
                onPressed: () async{
                  await _authService.signOut();
                },
              ),
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
        ],
      ),

      body: Center(
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
