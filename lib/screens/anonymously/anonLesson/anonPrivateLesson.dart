import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:kbgapp/screens/anonymously/anonHome.dart';

import 'package:kbgapp/services/database.dart';
import 'package:kbgapp/sharedCode/textInpuDecoration.dart';

class AnonPrivateLessons extends StatefulWidget {
  @override
  _AnonPrivateLessonsState createState() => _AnonPrivateLessonsState();
}

class _AnonPrivateLessonsState extends State<AnonPrivateLessons> {

  DatabaseService _databaseService = new DatabaseService();

  final dateForm = DateFormat("dd - mm - yyyy");

  DateTime _lessonDate = new DateTime.now();

  final _formKey = GlobalKey<FormState>();

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

  bool morningSession = false;
  String _session;

  void selectedSession(){
    if(morningSession){
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
    return _sixHours = 1300 * _sixHoursStack;
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
    return _eightHours = 1600 * _eightHoursStack;
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
    return _hour = 250 * _oneHourStack;
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
        title: Text("Private Lesson"),
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
                    Text("8 Hours packege: 1600 TL"),

                    new RaisedButton( // decrease _eightHoursStack by 1
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

                    new RaisedButton( // increase _eightHoursStack by 1
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

                Row( // Calculate kite+bar price
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("6 Hours packege: 1300 TL"),

                    new RaisedButton( // decrease _sixHoursStack by 1
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

                    new RaisedButton( // increase _sixHoursStack by 1
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

                Row( // Calculate kite+bar price
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("1 Hour packege: 250 TL"),

                    new RaisedButton( // decrease _hourStack by 1
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

                    new RaisedButton( // increase _hourStack by 1
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
                         morningSession = true;
                         selectedSession();
                      });
                    } else if(value == false){
                      setState(() {
                         morningSession = false;
                         selectedSession();
                      });
                    } else{
                      return "wrong";
                    }
                  },
                  hint: Text("Sessions"),
                ),

                Text("$_lessonDate"),

                RaisedButton(
                  child: Text("Date"),
                  onPressed: (){
                    showDatePicker(
                      context: context,
                      initialDate: _lessonDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2021),
                    ).then((date)  {
                      setState((){
                        _lessonDate = date;
                      });
                    });
                  },
                ),

                RaisedButton(
                  onPressed: (){
                    personalInfo(context);
                  },
                  child: Text("Continue"),
                ),
              ],
          ),
        ),
      ),
    );
  }

  void personalInfo(BuildContext context){
    showModalBottomSheet(context: context, builder: (context){ // TODO: try showCupertinoModalPopup
      return Container(
        padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 100.0),
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
                ),
                SizedBox(height: 10.0),

                TextFormField(
                  decoration: textInputDecoration.copyWith(labelText: "Enter your surname"),
                  validator: (val) => val.isEmpty ? 'Please enter a surname' : null,
                  onChanged: (val) => setState(() => _surname = val),
                ),
                SizedBox(height: 10.0),

                TextFormField(
                  decoration: textInputDecoration.copyWith(labelText: "Enter your phone"),
                  validator: (val) => val.isEmpty ? 'Please enter a phone number' : null,
                  onChanged: (val) => setState(() => _phoneNumber = val),
                ),
                SizedBox(height: 10.0),

                TextFormField(
                  decoration: textInputDecoration.copyWith(labelText: "Enter your e-mail"),
                  validator: (val) => val.isEmpty ? 'Please enter an e-mail' : null,
                  onChanged: (val) => setState(() => _email = val),
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
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      _databaseService.anonCustomerDataUpdate(_name, _surname, _email, _age, _weight, _phoneNumber);
                      _databaseService.privateLessonData(
                          _totalHours,
                          _oneHourStack,
                          _sixHoursStack,
                          _eightHoursStack,
                          _session,
                          _totalLessonPrice,
                          _lessonDate
                      );
                    }
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

}

