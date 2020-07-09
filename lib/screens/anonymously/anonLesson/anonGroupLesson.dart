import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kbgapp/screens/anonymously/anonHome.dart';

import 'package:kbgapp/services/database.dart';
import 'package:kbgapp/sharedCode/missingInformations.dart';
import 'package:kbgapp/sharedCode/textInpuDecorations.dart';

class AnonGroupLesson extends StatefulWidget {
  @override
  _AnonGroupLessonState createState() => _AnonGroupLessonState();
}

class _AnonGroupLessonState extends State<AnonGroupLesson> {

  DatabaseService _databaseService = new DatabaseService();

  DateTime _lessonDate = new DateTime.now();

  final _formKey = GlobalKey<FormState>();

  final _focus1 = FocusNode();
  final _focus2 = FocusNode();
  final _focus3 = FocusNode();
  final _focus4 = FocusNode();
  final _focus5 = FocusNode();
  final _focus6 = FocusNode();
  final _focus7 = FocusNode();
  final _focus8 = FocusNode();
  final _focus9 = FocusNode();

  bool _authorise = false;

  // personal information of person who makes appointment
  String _name;
  String _surname;
  int _age;
  double _weight;
  String _phoneNumber;
  String _email;

  // personal information of second student
  String _secondName;
  String _secondSurname;
  int _secondAge;
  double _secondWeight;

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

  void selectedSession(){
    if(_morningSession){
      setState(() {
        _session ="Morning Session";
      });
    } else{
      _session = "Afternoon Session";
    }
  }

  void incrementSixHours(){
    setState(() {
      _sixHoursStack++;
    });
  }

  void decreaseSixHours(){
    if(_sixHoursStack != 0){
      setState(() {
        _sixHoursStack--;
      });
    }
  }

  int sixHoursPrice(){
    return _sixHours = 1600 * _sixHoursStack;
  }

  void incrementEightHours(){
    setState(() {
      _eightHoursStack++;
    });
  }

  void decreaseEightHours(){
    if(_eightHoursStack != 0){
      setState(() {
        _eightHoursStack--;
      });
    }
  }

  int eightHoursPrice(){
    return _eightHours = 2100 * _eightHoursStack;
  }

  void incrementHour(){
    setState(() {
      _oneHourStack++;
    });
  }

  void decreaseHour(){
    if(_oneHourStack != 0){
      setState(() {
        _oneHourStack--;
      });
    }
  }

  int hourPrice(){
    return _hour = 300 * _oneHourStack;
  }

  int totalPrice() {
    return _totalLessonPrice = _eightHours + _hour + _sixHours;
  }

  int totalHours(){
    return _totalHours = 1 * _oneHourStack + 6 * _sixHoursStack + 8 * _eightHoursStack;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text("Group Lesson"),
        actions: <Widget>[
          FlatButton(
            child: Text("Make an appointment"),
            onPressed: () {
              setState(() {
                if(_totalHours == 0){
                  noLesson(context);
                } else if (_name == null || _surname == null || _email == null || _phoneNumber == null || _weight == null || _age == null
                    ||  _secondName == null || _secondSurname == null || _secondAge == null || _secondWeight == null){
                  noInfo(context);
                } else{
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
                "assets/images/groupLesson.jpg",
                scale: 7,
              ),
              Text(
                " Choose how many hours you want to buy."
                    "\n"
                    " Your body learns how to control a kite and\n ride a board."
                    " That means, if you don't have\n enough time to learn everything, you can \n continue another time where you left off.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                ),
              ),

              Card(
                child: Row( // Calculate 8 hour lesson package
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("8 Hours package: 2100 TL"),

                    new FlatButton( // decrease _eightHoursStack by 1
                      onPressed: (){
                        decreaseEightHours();
                        eightHoursPrice();
                        totalPrice();
                        totalHours();
                      },
                      child: new Icon(
                          const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                          color: Colors.black),
                    ),

                    new Text('$_eightHoursStack',
                        style: new TextStyle(fontSize: 30.0)),

                    new FlatButton( // increase _eightHoursStack by 1
                      onPressed: (){
                        incrementEightHours();
                        eightHoursPrice();
                        totalPrice();
                        totalHours();
                      },
                      child: new Icon(Icons.add, color: Colors.black,),
                    ),
                  ],
                ),
              ),

              Card(
                child: Row( // Calculate 6 hour package price
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("6 Hours package: 1600 TL"),

                    new FlatButton( // decrease _sixHoursStack by 1
                      onPressed: (){
                        decreaseSixHours();
                        sixHoursPrice();
                        totalPrice();
                        totalHours();
                      },
                      child: new Icon(
                          const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                          color: Colors.black),
                    ),

                    new Text('$_sixHoursStack',
                        style: new TextStyle(fontSize: 30.0)),

                    new FlatButton( // increase _sixHoursStack by 1
                      onPressed: (){
                        incrementSixHours();
                        sixHoursPrice();
                        totalPrice();
                        totalHours();
                      },
                      child: new Icon(Icons.add, color: Colors.black,),
                    ),
                  ],
                ),
              ),

              Card(
                child: Row( // Calculate one hour package price
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("1 Hour package: 300 TL"),

                    new FlatButton( // decrease _hourStack by 1
                      onPressed: (){
                        decreaseHour();
                        hourPrice();
                        totalPrice();
                        totalHours();
                      },
                      child: new Icon(
                          const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                          color: Colors.black),
                    ),

                    new Text('$_oneHourStack',
                        style: new TextStyle(fontSize: 30.0)),

                    new FlatButton( // increase _hourStack by 1
                      onPressed: (){
                        incrementHour();
                        hourPrice();
                        totalPrice();
                        totalHours();
                      },
                      child: new Icon(Icons.add, color: Colors.black,),
                    ),
                  ],
                ),
              ),

              Text(
                "Total price: $_totalLessonPrice TL",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
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
                      selectedSession();
                    });
                  } else if(value == false){
                    setState(() {
                      _morningSession = false;
                      selectedSession();
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
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text("Your information"),
                    SizedBox(height: 10.0),

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
                      decoration: textInputDecoration.copyWith(labelText: "Enter your e-mail"),
                      validator: (val) => val.isEmpty ? 'Please enter an e-mail' : null,
                      keyboardType: TextInputType.emailAddress,
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
                      keyboardType: TextInputType.number,
                      onChanged: (val) => setState(() => _age = int.parse(val)),
                    ),
                    SizedBox(height: 10.0),

                    TextFormField(
                      focusNode: _focus5,
                      textInputAction: TextInputAction.next,
                      autofocus: true,
                      onFieldSubmitted: (v){
                        FocusScope.of(context).requestFocus(_focus6);
                      },
                      decoration: textInputDecoration.copyWith(labelText: "Enter your weight"),
                      validator: (val) => val.isEmpty ? 'Please enter a weight' : null,
                      keyboardType: TextInputType.number,
                      onChanged: (val) => setState(() => _weight = double.parse(val)),
                    ),
                    SizedBox(height: 10.0),

                    Text("Group members information"),
                    SizedBox(height: 10.0),

                    TextFormField(
                      focusNode: _focus6,
                      textInputAction: TextInputAction.next,
                      autofocus: true,
                      onFieldSubmitted: (v){
                        FocusScope.of(context).requestFocus(_focus7);
                      },
                      decoration: textInputDecoration.copyWith(labelText: "Enter their name"),
                      validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                      onChanged: (val) => setState(() => _secondName = val),
                    ),
                    SizedBox(height: 10.0),

                    TextFormField(
                      focusNode: _focus7,
                      textInputAction: TextInputAction.next,
                      autofocus: true,
                      onFieldSubmitted: (v){
                        FocusScope.of(context).requestFocus(_focus8);
                      },
                      decoration: textInputDecoration.copyWith(labelText: "Enter their surname"),
                      validator: (val) => val.isEmpty ? 'Please enter a surname' : null,
                      onChanged: (val) => setState(() => _secondSurname = val),
                    ),
                    SizedBox(height: 10.0),


                    TextFormField(
                      focusNode: _focus8,
                      textInputAction: TextInputAction.next,
                      autofocus: true,
                      onFieldSubmitted: (v){
                        FocusScope.of(context).requestFocus(_focus9);
                      },
                      decoration: textInputDecoration.copyWith(labelText: "Enter their age"),
                      validator: (val) => val.isEmpty ? 'Please enter an age' : null,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (val) => setState(() => _secondAge = int.parse(val)),
                    ),
                    SizedBox(height: 10.0),

                    TextFormField(
                      focusNode: _focus9,
                      decoration: textInputDecoration.copyWith(labelText: "Enter their weight"),
                      validator: (val) => val.isEmpty ? 'Please enter a weight' : null,
                      onChanged: (val) => setState(() => _secondWeight = double.parse(val)),
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10.0),

                    RaisedButton(
                        color: Colors.brown[400],
                        child: Text(
                          'Close and Save Information',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: (){
                          if(_name == null || _surname == null || _email == null || _phoneNumber == null || _weight == null || _age == null
                          ||  _secondName == null || _secondSurname == null || _secondAge == null || _secondWeight == null){
                            noInfo(context);
                          } else {
                            Navigator.of(context).pop(false);
                          }
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
              "Second Student's Information:\n"
              "Name Surname: $_secondName  $_secondSurname\n"
              "Age: $_secondAge\n"
              "Weight: $_secondWeight"
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Confirm & Continue"),
          onPressed: (){
            _databaseService.anonCustomerDataUpdate(_name, _surname, _email, _age, _weight, _phoneNumber);
            _databaseService.groupLessonData(
                _totalHours,
                _oneHourStack,
                _sixHoursStack,
                _eightHoursStack,
                _session,
                _totalLessonPrice,
                _lessonDate,
                _secondName,
                _secondSurname,
                _secondAge,
                _secondWeight,
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
