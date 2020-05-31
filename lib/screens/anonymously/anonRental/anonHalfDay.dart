import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:kbgapp/screens/sharedScreens/halfDayRental.dart';
import 'package:kbgapp/screens/sharedScreens/information.dart';
import 'package:kbgapp/screens/sharedScreens/startDate.dart';

import 'package:kbgapp/services/database.dart';
import 'package:kbgapp/sharedCode/textInpuDecoration.dart';
import '../anonHome.dart';

class AnonHalfDayRental extends StatefulWidget {
  @override
  _AnonHalfDayRentalState createState() => _AnonHalfDayRentalState();
}

class _AnonHalfDayRentalState extends State<AnonHalfDayRental> {

  int _selectedPage = 0;
  final _pageOptions = [
    HalfDayRental(),
    StartDate(),
    Information(),
  ];

  DatabaseService _databaseService = new DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],

      appBar: AppBar(
        title: Text('Half Day Rental'),
        actions: <Widget>[
          RaisedButton(
            child: Text("Done"),
            onPressed: () {
              rentConfirmation(context);
            },
          )
        ],
      ),
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        backgroundColor: Colors.blue[600],

        onTap: (int index){
          setState(() {
            _selectedPage = index;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Equipments"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text("Date"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Information"),
          ),
        ],
      ),
    );
  }

  void rentConfirmation(BuildContext context){
    var alertDialog = AlertDialog(
      title: Text(
        "CONFIRMATION",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text(
         "asaddasda"
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Confirm & Continue"),
          onPressed: (){

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AnonymousHomePage()),
            );
          },
        ),
      ],
      backgroundColor: Colors.pink,
    );

    showDialog(
        context: context,
        builder: (BuildContext context){
          return alertDialog;
        }
    );
  }

}