import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kbgapp/services/database.dart';
import 'package:kbgapp/sharedCode/missingInformations.dart';
import 'package:kbgapp/sharedCode/textInpuDecorations.dart';

class GroupLesson extends StatefulWidget {
  @override
  _GroupLessonState createState() => _GroupLessonState();
}

class _GroupLessonState extends State<GroupLesson> {

  DatabaseService _databaseService = new DatabaseService();

  final _formKey = GlobalKey<FormState>();

  final _focus1 = FocusNode();
  final _focus2 = FocusNode();
  final _focus3 = FocusNode();

  // personal information of second student
  String _name;
  String _surname;
  int _age;
  double _weight;
  bool _authorise = false;

  DateTime _lessonDate = new DateTime.now();

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

  void _selectedSession() {
    if (_morningSession) {
      setState(() {
        _session = "Morning Session";
      });
    } else {
      _session = "Afternoon Session";
    }
  }

  void _incrementSixHours() {
    setState(() {
      _sixHoursStack++;
    });
  }

  void _decreaseSixHours() {
    if (_sixHoursStack != 0) {
      setState(() {
        _sixHoursStack--;
      });
    }
  }

  int _sixHoursPrice() {
    return _sixHours = 1600 * _sixHoursStack;
  }

  void _incrementEightHours() {
    setState(() {
      _eightHoursStack++;
    });
  }

  void _decreaseEightHours() {
    if (_eightHoursStack != 0) {
      setState(() {
        _eightHoursStack--;
      });
    }
  }

  int _eightHoursPrice() {
    return _eightHours = 2100 * _eightHoursStack;
  }

  void _incrementHour() {
    setState(() {
      _hourStack++;
    });
  }

  void _decreaseHour() {
    if (_hourStack != 0) {
      setState(() {
        _hourStack--;
      });
    }
  }

  int _hourPrice() {
    return _hour = 300 * _hourStack;
  }

  int _totalPrice() {
    return _totalLessonPrice = _eightHours + _hour + _sixHours;
  }

  int _totalHours() {
    return _totalHour = 1 * _hourStack + 6 * _sixHoursStack + 8 * _eightHoursStack;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text("Group Lesson"),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Add second student",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            onPressed: (){
              _secondStudent(context);
            },
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "Please how many hours you want to puchose.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                ),
              ),

              Text(
                "You can only take lessons up to 3 hours for 1 day. Other hours will be done in the next day. "
                    "This is done because learning more than 3 hours a day would be too hard for your body.",
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
                    Text("8 Hours package: 2100 TL"),

                    new FlatButton( // decrease _eightHoursStack by 1
                      onPressed: () {
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
                      onPressed: () {
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
                    Text("6 Hours package: 1600 TL"),

                    new FlatButton( // decrease _sixHoursStack by 1
                      onPressed: () {
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
                      onPressed: () {
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
                    Text("1 Hour package: 300 TL"),

                    new FlatButton( // decrease _hourStack by 1
                      onPressed: () {
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
                      onPressed: () {
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
                "Total price: $_totalLessonPrice",
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
                onChanged: (value) {
                  if (value) {
                    setState(() {
                      _morningSession = true;
                      _selectedSession();
                    });
                  } else if (value == false) {
                    setState(() {
                      _morningSession = false;
                      _selectedSession();
                    });
                  } else {
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

              SizedBox(height: 10.0,),

              RaisedButton(
                child: Text("Lesson Date"),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: _lessonDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2021),
                  ).then((date) {
                    setState(() {
                      _lessonDate = date;
                    });
                  });
                },
              ),

              SizedBox(height: 10.0,),

              RaisedButton(
                onPressed: () {
                  if(_totalHour == 0){
                    noLesson(context);
                  } else if(_name == null || _surname == null || _weight == null || _age == null){
                    noSecondStudent(context);
                  } else if(_morningSession == null){
                    noSession(context);
                  } else{
                    setState(() {
                      _databaseService.groupLessonData(_totalHour, _hour, _sixHours, _eightHours, _session, _totalLessonPrice, _lessonDate, _name, _surname, _age, _weight, _authorise);
                      Navigator.of(context).pop(false);
                    });
                  }
                },
                child: Text("Make an Appointment"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _secondStudent(BuildContext context){
    showCupertinoModalPopup(context: context, builder: (context){
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Material(
          child: Container(
            color: Colors.brown[100],
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 45.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text("Please write the second student's personal information"),

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
                      decoration: textInputDecoration.copyWith(labelText: "Enter your surname"),
                      validator: (val) => val.isEmpty ? 'Please enter a surname' : null,
                      onChanged: (val) => setState(() => _surname = val),
                      focusNode: _focus1,
                      textInputAction: TextInputAction.next,
                      autofocus: true,
                      onFieldSubmitted: (v){
                        FocusScope.of(context).requestFocus(_focus2);
                      },
                    ),
                    SizedBox(height: 10.0),

                    TextFormField(
                      decoration: textInputDecoration.copyWith(labelText: "Enter your age"),
                      validator: (val) => val.isEmpty ? 'Please enter an age' : null,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.number,
                      onChanged: (val) => setState(() => _age = int.parse(val)),
                      focusNode: _focus2,
                      textInputAction: TextInputAction.next,
                      autofocus: true,
                      onFieldSubmitted: (v){
                        FocusScope.of(context).requestFocus(_focus3);
                      },
                    ),
                    SizedBox(height: 10.0),

                    TextFormField(
                      decoration: textInputDecoration.copyWith(labelText: "Enter your weight"),
                      validator: (val) => val.isEmpty ? 'Please enter a weight' : null,
                      onChanged: (val) => setState(() => _weight = double.parse(val)),
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.number,
                      focusNode: _focus3,

                    ),
                    SizedBox(height: 10.0),

                    RaisedButton(
                      color: Colors.brown[400],
                      child: Text(
                        'Close and Save Information',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: (){
                        Navigator.of(context).pop(false);
                      },
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
}
