import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kbgapp/services/database.dart';
import 'package:kbgapp/sharedCode/missingInformations.dart';
import 'package:kbgapp/sharedCode/textInpuDecorations.dart';

import '../anonHome.dart';

class AnonPrivateLessons extends StatefulWidget {
  @override
  _AnonPrivateLessonsState createState() => _AnonPrivateLessonsState();
}

class _AnonPrivateLessonsState extends State<AnonPrivateLessons> {

  DatabaseService _databaseService = new DatabaseService();

  DateTime _lessonDate = new DateTime.now();

  final _formKey = GlobalKey<FormState>();

  final _focus1 = FocusNode();
  final _focus2 = FocusNode();
  final _focus3 = FocusNode();
  final _focus4 = FocusNode();
  final _focus5 = FocusNode();

  bool _authorise = false;

  String _name;
  String _surname;
  int _age;
  double _weight;
  String _phoneNumber;
  String _email;

  int _sixHours = 0;
  int _eightHours = 0;
  int _hour = 0;

  int _sixHoursStack = 0;
  int _eightHoursStack = 0;
  int _oneHourStack = 0;

  int _totalLessonPrice = 0;
  int _totalHours = 0;

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
      _oneHourStack++;
    });
  }

  void _decreaseHour(){
    if(_oneHourStack != 0){
      setState(() {
        _oneHourStack--;
      });
    }
  }

  int _hourPrice(){
    return _hour = 250 * _oneHourStack;
  }

  int _totalPrice() {
    return _totalLessonPrice = _eightHours + _hour + _sixHours;
  }

  int _totalHour(){
    return _totalHours = 1 * _oneHourStack + 6 * _sixHoursStack + 8 * _eightHoursStack;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text("Private Lesson"),
        actions: <Widget>[
          FlatButton(
            child: Text("Make an appointment"),
            onPressed: () {
              setState(() {
                if(_totalHours == 0){
                  noLesson(context);
                } else if( _session == null){
                  noSession(context);
                } else if (_name == null || _surname == null || _email == null || _phoneNumber == null || _weight == null || _age == null){
                  noInfo(context);
                }else{
                  _lessonConfirmation(context);
                }
              });
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
              children: <Widget>[
                Image.asset(
                  "assets/images/ders.jpg",
                  scale: 7,
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
                      Text("8 Hours package: 1600 TL"),

                      new FlatButton( // decrease _eightHoursStack by 1
                        onPressed: (){
                          _decreaseEightHours();
                          _eightHoursPrice();
                          _totalPrice();
                          _totalHour();
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
                          _totalHour();
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
                      Text("6 Hours package: 1300 TL"),

                      new FlatButton( // decrease _sixHoursStack by 1
                        onPressed: (){
                          _decreaseSixHours();
                          _sixHoursPrice();
                          _totalPrice();
                          _totalHour();
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
                          _totalHour();
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
                      Text("1 Hour package: 250 TL"),

                      new FlatButton( // decrease _hourStack by 1
                        onPressed: (){
                          _decreaseHour();
                          _hourPrice();
                          _totalPrice();
                          _totalHour();
                        },
                        child: new Icon(
                            const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                            color: Colors.black),
                      ),

                      new Text('$_oneHourStack',
                          style: new TextStyle(fontSize: 30.0)),

                      new FlatButton( // increase _hourStack by 1
                        onPressed: (){
                          _incrementHour();
                          _hourPrice();
                          _totalPrice();
                          _totalHour();
                        },
                        child: new Icon(Icons.add, color: Colors.black,),
                      ),
                    ],
                  ),
                ),

                Text(
                  "Total price: $_totalLessonPrice TL",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
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
                  hint: Text(_morningSession == null ? "Sessions" : "$_session"),
                ),

                Text(
                  _lessonDate == null ? "Choose a date" : "$_lessonDate",
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    RaisedButton(
                      child: Text("Date"),
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
                          _personalInfo(context);
                      },
                      child: Text("Give personal information"),
                    ),
                  ],
                )
              ],
          ),
        ),
      ),
    );
  }

  void _personalInfo(BuildContext context){
    showCupertinoModalPopup(context: context, builder: (context){
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Material(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 95.0, horizontal: 10.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                        decoration: textInputDecoration.copyWith(labelText: "Enter your name"),
                        validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                        onChanged: (val) => setState(() => _name = val),
                        textInputAction: TextInputAction.next,
                        autofocus: true,
                        onFieldSubmitted: (v){
                          FocusScope.of(context).requestFocus(_focus1);
                        },
                      ),
                      SizedBox(height: 10.0),

                      TextFormField(
                        focusNode: _focus1,
                        textInputAction: TextInputAction.next,
                        autofocus: true,
                        onFieldSubmitted: (v){
                          FocusScope.of(context).requestFocus(_focus2);
                        },
                        decoration: textInputDecoration.copyWith(labelText: "Enter your surname"),
                        validator: (val) => val.isEmpty ? 'Please enter a surname' : null,
                        onChanged: (val) => setState(() => _surname = val),
                      ),
                      SizedBox(height: 10.0),

                      TextFormField(
                        focusNode: _focus2,
                        textInputAction: TextInputAction.next,
                        autofocus: true,
                        onFieldSubmitted: (v){
                          FocusScope.of(context).requestFocus(_focus3);
                        },
                        decoration: textInputDecoration.copyWith(labelText: "Enter your phone"),
                        validator: (val) => val.isEmpty ? 'Please enter a phone number' : null,
                        onChanged: (val) => setState(() => _phoneNumber = val),
                      ),
                      SizedBox(height: 10.0),

                      TextFormField(
                        focusNode: _focus3,
                        textInputAction: TextInputAction.next,
                        autofocus: true,
                        onFieldSubmitted: (v){
                          FocusScope.of(context).requestFocus(_focus4);
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: textInputDecoration.copyWith(labelText: "Enter your e-mail"),
                        validator: (val) => val.isEmpty ? 'Please enter an e-mail' : null,
                        onChanged: (val) => setState(() => _email = val),
                      ),
                      SizedBox(height: 10.0),

                      TextFormField(
                        focusNode: _focus4,
                        textInputAction: TextInputAction.next,
                        autofocus: true,
                        onFieldSubmitted: (v){
                          FocusScope.of(context).requestFocus(_focus5);
                        },
                        decoration: textInputDecoration.copyWith(labelText: "Enter your age"),
                        validator: (val) => val.isEmpty ? 'Please enter an age' : null,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (val) => setState(() => _age = int.parse(val)),
                        keyboardType: TextInputType.number,
                      ),

                      SizedBox(height: 10.0),
                      TextFormField(
                        focusNode: _focus5,
                        decoration: textInputDecoration.copyWith(labelText: "Enter your weight"),
                        validator: (val) => val.isEmpty ? 'Please enter a weight' : null,
                        onChanged: (val) => setState(() => _weight = double.parse(val)),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly,
                        ],
                      ),

                      SizedBox(height: 10.0),
                      RaisedButton(
                          color: Colors.brown[400],
                          child: Text(
                            'Save and Close',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if(_name == null || _surname == null || _email == null || _phoneNumber == null || _weight == null || _age == null){
                              noInfo(context);
                            } else{
                              Navigator.of(context).pop(false);
                            }
                          }
                      ),
                    ],
                  ),
                ),
              ),
            ),

        ),
      );
    });
  }

  void _lessonConfirmation(BuildContext context){
    var alertDialog = AlertDialog(
      title: Text(
        "CONFIRMATION",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text(
          "Lesson Packages you will buy:\n"
              "$_eightHoursStack Sight Hour Package\n  "
              "$_sixHoursStack  Six Hour Package\n "
              "$_oneHourStack  One Hour Package\n  "
              "$_session\n"
              "Total hour: $_totalHours\n"
              "Total price: $_totalLessonPrice  TL\n"
              "Name and Surname:  $_name $_surname\n"
              "Your Information: \n"
              "Age: $_age\n"
              "Weight: $_weight\n"
              "Phone Number: $_phoneNumber\n"
              "Email: $_email\n"
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Confirm & Continue"),
          onPressed: (){
            _databaseService.anonCustomerDataUpdate(_name, _surname, _email, _age, _weight, _phoneNumber);
            _databaseService.privateLessonData(
                _totalHours,
                _oneHourStack,
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
        builder: (BuildContext context){
          return alertDialog;
        }
    );
  }

}

