import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:kbgapp/services/database.dart';
import 'package:kbgapp/sharedCode/textInpuDecoration.dart';

class GroupLesson extends StatefulWidget {
  @override
  _GroupLessonState createState() => _GroupLessonState();
}

class _GroupLessonState extends State<GroupLesson> {

  DatabaseService _databaseService = new DatabaseService();

  final _formKey = GlobalKey<FormState>();

  // personal information of second student
  String _name;
  String _surname;
  int _age;
  double _weight;

  final dateForm = DateFormat("dd - mm - yyyy");

  DateTime lessonDate = new DateTime.now();

  int _sixHours = 0;
  int _eightHours = 0;
  int _hour = 0;

  int sixHoursStack = 0;
  int eightHoursStack = 0;
  int hourStack = 0;

  int _totalLessonPrice = 0;
  int _totalHour = 0;

  bool morningSession = false;
  String session;

  void selectedSession() {
    if (morningSession) {
      setState(() {
        session = "Morning Session";
      });
    } else {
      session = "Afternoon Session";
    }
  }

  void incrementSixHours() {
    setState(() {
      sixHoursStack++;
    });
  }

  void decreaseSixHours() {
    if (sixHoursStack != 0) {
      setState(() {
        sixHoursStack--;
      });
    }
  }

  int sixHoursPrice() {
    return _sixHours = 1600 * sixHoursStack;
  }

  void incrementEightHours() {
    setState(() {
      eightHoursStack++;
    });
  }

  void decreaseEightHours() {
    if (eightHoursStack != 0) {
      setState(() {
        eightHoursStack--;
      });
    }
  }

  int eightHoursPrice() {
    return _eightHours = 2100 * eightHoursStack;
  }

  void incrementHour() {
    setState(() {
      hourStack++;
    });
  }

  void decreaseHour() {
    if (hourStack != 0) {
      setState(() {
        hourStack--;
      });
    }
  }

  int hourPrice() {
    return _hour = 300 * hourStack;
  }

  int totalPrice() {
    return _totalLessonPrice = _eightHours + _hour + _sixHours;
  }

  int totalHours() {
    return _totalHour = 1 * hourStack + 6 * sixHoursStack + 8 * eightHoursStack;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text("Group Lesson"),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Make an appointment",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            onPressed: (){
              lessonConfirmation(context);
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

              Row( // Calculate kite+bar price
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("8 Hours packege: 2100 TL"),

                  new RaisedButton( // decrease _eightHoursStack by 1
                    onPressed: () {
                      decreaseEightHours();
                      eightHoursPrice();
                      totalPrice();
                      totalHours();
                    },
                    child: new Icon(
                        const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                        color: Colors.black),
                  ),

                  new Text('$eightHoursStack',
                      style: new TextStyle(fontSize: 30.0)),

                  new RaisedButton( // increase _eightHoursStack by 1
                    onPressed: () {
                      incrementEightHours();
                      eightHoursPrice();
                      totalPrice();
                      totalHours();
                    },
                    child: new Icon(Icons.add, color: Colors.black,),
                  ),
                ],
              ),

              Row( // Calculate kite+bar price
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("6 Hours packege: 1600 TL"),

                  new RaisedButton( // decrease _sixHoursStack by 1
                    onPressed: () {
                      decreaseSixHours();
                      sixHoursPrice();
                      totalPrice();
                      totalHours();
                    },
                    child: new Icon(
                        const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                        color: Colors.black),
                  ),

                  new Text('$sixHoursStack',
                      style: new TextStyle(fontSize: 30.0)),

                  new RaisedButton( // increase _sixHoursStack by 1
                    onPressed: () {
                      incrementSixHours();
                      sixHoursPrice();
                      totalPrice();
                      totalHours();
                    },
                    child: new Icon(Icons.add, color: Colors.black,),
                  ),
                ],
              ),

              Row( // Calculate kite+bar price
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("1 Hour packege: 300 TL"),

                  new RaisedButton( // decrease _hourStack by 1
                    onPressed: () {
                      decreaseHour();
                      hourPrice();
                      totalPrice();
                      totalHours();
                    },
                    child: new Icon(
                        const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                        color: Colors.black),
                  ),

                  new Text('$hourStack',
                      style: new TextStyle(fontSize: 30.0)),

                  new RaisedButton( // increase _hourStack by 1
                    onPressed: () {
                      incrementHour();
                      hourPrice();
                      totalPrice();
                      totalHours();
                    },
                    child: new Icon(Icons.add, color: Colors.black,),
                  ),
                ],
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
                      morningSession = true;
                      selectedSession();
                    });
                  } else if (value == false) {
                    setState(() {
                      morningSession = false;
                      selectedSession();
                    });
                  } else {
                    return "wrong";
                  }
                },
                hint: Text("Sessions"),
              ),

              Text("$lessonDate"),

              RaisedButton(
                child: Text("Date"),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: lessonDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2021),
                  ).then((date) {
                    setState(() {
                      lessonDate = date;
                    });
                  });
                },
              ),

              RaisedButton(
                onPressed: () {
                  _secondStudent(context);
                },
                child: Text("Continue"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void lessonConfirmation(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text(
        "CONFIRMATION",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text(
          "The lessons you want to take are:"
              "$hourStack" + "  One Hour Lessons,  "
              "$sixHoursStack" + "  6 hours lessons,  "
              "$eightHoursStack" + "  8 hours lessons,  "
              "Total: $_totalLessonPrice  TL"
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Confirm & Continue"),
          onPressed: () {
            _databaseService.groupLessonData(_totalHour, _hour, _sixHours, _eightHours, session, _totalLessonPrice, lessonDate
                , _name, _surname, _age, _weight);
          },
        ),
      ],
      backgroundColor: Colors.pink,
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        }
    );
  }

  void _secondStudent(BuildContext context){
    showModalBottomSheet(context: context, builder: (context){ // TODO: try showCupertinoModalPopup
      return Container(
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
                ),
                SizedBox(height: 10.0),

                TextFormField(
                  decoration: textInputDecoration.copyWith(labelText: "Enter your surname"),
                  validator: (val) => val.isEmpty ? 'Please enter a surname' : null,
                  onChanged: (val) => setState(() => _surname = val),
                ),
                SizedBox(height: 10.0),

                TextFormField(
                  decoration: textInputDecoration.copyWith(labelText: "Enter your age"),
                  validator: (val) => val.isEmpty ? 'Please enter an age' : null,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (val) => setState(() => _age = int.parse(val)),
                ),
                SizedBox(height: 10.0),

                TextFormField(
                  decoration: textInputDecoration.copyWith(labelText: "Enter your weight"),
                  validator: (val) => val.isEmpty ? 'Please enter a weight' : null,
                  onChanged: (val) => setState(() => _weight = double.parse(val)),
                ),
                SizedBox(height: 10.0),

                RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Close and Save Informations',
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
      );
    });
  }
}
