import 'package:flutter/material.dart';

import 'package:kbgapp/screens/withAccount/accountHome.dart';
import 'package:kbgapp/services/database.dart';
import 'package:kbgapp/sharedCode/missingInformations.dart';

class PrivateLesson extends StatefulWidget {
  @override
  _PrivateLessonState createState() => _PrivateLessonState();
}

class _PrivateLessonState extends State<PrivateLesson> {

  DatabaseService _databaseService = new DatabaseService();

  DateTime _lessonDate = new DateTime.now();

  bool _authorise = false;

  int _sixHours = 0;
  int _eightHours = 0;
  int _hour = 0;

  int _sixHoursStack = 0;
  int _eightHoursStack = 0;
  int _hourStack = 0;

  int _totalLessonPrice = 0;
  int _totalHour = 0;

  bool _morningSession;
  String _session;

  void _selectedSession(){
    if(_morningSession){
      setState(() {
        _session ="Morning Session";
      });
    } else{
      _session = "Afternoon Session";
    }
  }

  void _incrementSixHours(){
    setState(() {
      _sixHoursStack++;
    });
  }

  void _decreaseSixHours(){
    if(_sixHoursStack != 0){
      setState(() {
        _sixHoursStack--;
      });
    }
  }

  int _sixHoursPrice(){
    return _sixHours = 1300 * _sixHoursStack;
  }

  void _incrementEightHours(){
    setState(() {
      _eightHoursStack++;
    });
  }

  void _decreaseEightHours(){
    if(_eightHoursStack != 0){
      setState(() {
        _eightHoursStack--;
      });
    }
  }

  int _eightHoursPrice(){
    return _eightHours = 1600 * _eightHoursStack;
  }

  void _incrementHour(){
    setState(() {
      _hourStack++;
    });
  }

  void _decreaseHour(){
    if(_hourStack != 0){
      setState(() {
        _hourStack--;
      });
    }
  }

  int _hourPrice(){
    return _hour = 250 * _hourStack;
  }

  int _totalPrice() {
    return _totalLessonPrice = _eightHours + _hour + _sixHours;
  }

  int _totalHours(){
    return _totalHour = 1 * _hourStack + 6 * _sixHoursStack + 8 * _eightHoursStack;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text("Private Lesson"),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/images/privateLes.JPG",
                scale: 25,
              ),
              SizedBox(height: 10,),
              Text(
                " Choose how many hours you want to buy."
                    "\n"
                    " Your body learns how to control a kite and\n ride a board."
                    " That means, if you don't have\n enough time learn everything, you can \n continue another time where you left off.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                ),
              ),

              Card(
                child: Row( // Calculate kite+bar price
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("8 Hours packege: 1600 TL"),

                    new FlatButton( // decrease _eightHoursStack by 1
                      onPressed: (){
                        _decreaseEightHours();
                        _eightHoursPrice();
                        _totalPrice();
                        _totalHours();
                      },
                      child: new Icon(
                          const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                          color: Colors.black),
                    ),

                    new Text('$_eightHoursStack',
                        style: new TextStyle(fontSize: 30.0)),

                    new FlatButton( // increase _eightHoursStack by 1
                      onPressed: (){
                        _incrementEightHours();
                        _eightHoursPrice();
                        _totalPrice();
                        _totalHours();
                      },
                      child: new Icon(Icons.add, color: Colors.black,),
                    ),
                  ],
                ),
              ),

              Card(
                child: Row( // Calculate kite+bar price
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("6 Hours packege: 1300 TL"),

                    new FlatButton( // decrease _sixHoursStack by 1
                      onPressed: (){
                        _decreaseSixHours();
                        _sixHoursPrice();
                        _totalPrice();
                        _totalHours();
                      },
                      child: new Icon(
                          const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                          color: Colors.black),
                    ),

                    new Text('$_sixHoursStack',
                        style: new TextStyle(fontSize: 30.0)),

                    new FlatButton( // increase _sixHoursStack by 1
                      onPressed: (){
                        _incrementSixHours();
                        _sixHoursPrice();
                        _totalPrice();
                        _totalHours();
                      },
                      child: new Icon(Icons.add, color: Colors.black,),
                    ),
                  ],
                ),
              ),

              Card(
                child: Row( // Calculate kite+bar price
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("1 Hour packege: 250 TL"),

                    new FlatButton( // decrease _hourStack by 1
                      onPressed: (){
                        _decreaseHour();
                        _hourPrice();
                        _totalPrice();
                        _totalHours();
                      },
                      child: new Icon(
                          const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                          color: Colors.black),
                    ),

                    new Text('$_hourStack',
                        style: new TextStyle(fontSize: 30.0)),

                    new FlatButton( // increase _hourStack by 1
                      onPressed: (){
                        _incrementHour();
                        _hourPrice();
                        _totalPrice();
                        _totalHours();
                      },
                      child: new Icon(Icons.add, color: Colors.black,),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10,),

              Text(
                "Total price: $_totalLessonPrice TL",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),
              ),

              DropdownButton<bool>(
                items: [
                  DropdownMenuItem<bool>(
                    value: true,
                    child: Center(
                      child: Text("Morning Session"),
                    ),
                  ),
                  DropdownMenuItem<bool>(
                    value: false,
                    child: Center(
                      child: Text("Afternoon Session"),
                    ),
                  ),
                ],

                // ignore: missing_return
                onChanged: (value){
                  if(value){
                    setState(() {
                      _morningSession = true;
                      _selectedSession();
                    });
                  } else if(value == false){
                    setState(() {
                      _morningSession = false;
                      _selectedSession();
                    });
                  } else{
                    return "wrong";
                  }
                },
                hint: Text(_morningSession == null ? "Sessions" : "$_session" ),
              ),

              Text(
                _lessonDate == null ? "Choose a date" :"$_lessonDate",
                style: TextStyle(
                  fontSize: 20
              ),
              ),

              SizedBox(height:  10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Lesson Date"),
                    onPressed: (){
                      showDatePicker(
                        context: context,
                        initialDate: _lessonDate == null ? DateTime.now() : _lessonDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2021),
                      ).then((date)  {
                        setState((){
                          _lessonDate = date;
                        });
                      });
                    },
                  ),
                  SizedBox(width: 16,),
                  RaisedButton(
                    onPressed: (){
                      if(_totalHour == 0){
                        noLesson(context);
                      } else if(_morningSession == null){
                        noSession(context);
                      }else{
                        _lessonConfirmation(context);
                      }
                    },
                    child: Text("Make an Appointment"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _lessonConfirmation(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text(
        "CONFIRMATION",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text(
          "Lesson Packages you will buy:\n"
              "$_eightHoursStack Sight Hour Package\n  "
              "$_sixHoursStack  Six Hour Package\n "
              "$_hourStack  One Hour Package\n  "
              "$_session\n"
              "Total hour: $_totalHour\n"
              "On $_lessonDate\n"
              "Total price: $_totalLessonPrice  TL"
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Confirm & Continue"),
          onPressed: () {
            _databaseService.privateLessonData(
                _totalHour,
                _hourStack,
                _sixHoursStack,
                _eightHoursStack,
                _session,
                _totalLessonPrice,
                _lessonDate,
                _authorise
            );
            Navigator.of(context).pop(false);
          },
        ),
      ],
      backgroundColor: Colors.brown[100],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        }
    );
  }

}
