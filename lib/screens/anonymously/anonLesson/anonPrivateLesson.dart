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

  DateTime lessonDate = new DateTime.now();

  String name = "", surname, email, phoneNumber;
  int age;
  double weight;

  int _sixHours = 0;
  int _eightHours = 0;
  int _hour = 0;

  int sixHoursStack = 0;
  int eightHoursStack = 0;
  int hourStack = 0;

  int totalLessonPrice = 0;
  int totalHour = 0;

  bool morningSession = false;
  String session;

  void selectedSession(){
    if(morningSession){
      setState(() {
        session ="Morning Session";
      });
    } else{
      session = "Afternoon Session";
    }
  }

  void incrementSixHours(){
    setState(() {
      sixHoursStack++;
    });
  }

  void decreaseSixHours(){
    if(sixHoursStack != 0){
      setState(() {
        sixHoursStack--;
      });
    }
  }

  int sixHoursPrice(){
    return _sixHours = 1300 * sixHoursStack;
  }

  void incrementEightHours(){
    setState(() {
      eightHoursStack++;
    });
  }

  void decreaseEightHours(){
    if(eightHoursStack != 0){
      setState(() {
        eightHoursStack--;
      });
    }
  }

  int eightHoursPrice(){
    return _eightHours = 1600 * eightHoursStack;
  }

  void incrementHour(){
    setState(() {
      hourStack++;
    });
  }

  void decreaseHour(){
    if(hourStack != 0){
      setState(() {
        hourStack--;
      });
    }
  }

  int hourPrice(){
    return _hour = 250 * hourStack;
  }

  int totalPrice() {
    return totalLessonPrice = _eightHours + _hour + _sixHours;
  }

  int totalHours(){
    return totalHour = 1 * hourStack + 6 * sixHoursStack + 8 * eightHoursStack;
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

                    new Text('$eightHoursStack',
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

                    new Text('$sixHoursStack',
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

                    new Text('$hourStack',
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

                TextFormField(
                  decoration: textInputDecoration.copyWith(labelText: "name"),
                  validator: (value) => value.isEmpty ? "name" : null,
                  onChanged: (value){
                    setState(() {
                      name = value;
                    });
                  },
                ),

                SizedBox(height: 20,),

                TextFormField(
                  decoration: textInputDecoration.copyWith(labelText: "surname"),
                  validator: (value) => value.isEmpty ? "surname" : null,
                  onChanged: (value){
                    setState(() {
                      surname = value;
                    });
                  },
                ),

                SizedBox(height: 20,),

                TextFormField(
                  decoration: textInputDecoration.copyWith(labelText: "email"),
                  validator: (value) => value.isEmpty ? "email" : null,
                  onChanged: (value){
                    setState(() {
                      email = value;
                    });
                  },
                ),

                SizedBox(height: 20,),

                TextFormField(
                  decoration: textInputDecoration.copyWith(labelText: "Phone"),
                  validator: (value) => value.isEmpty ? "phone" : null,
                  onChanged: (value){
                    setState(() {
                      phoneNumber = value;
                    });
                  },
                ),

                SizedBox(height: 20,),

                TextField(
                  decoration: textInputDecoration.copyWith(labelText: "Enter your age"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (_value){
                    setState(() {
                      age = int.parse(_value);
                    });
                  },
                ),

                SizedBox(height: 20,),

                TextField(
                  decoration: textInputDecoration.copyWith(labelText: "Enter your weight"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  onChanged: (_value){
                    setState(() {
                      weight = double.parse(_value);
                    });
                  },
                ),

                Text("$lessonDate"),

                RaisedButton(
                  child: Text("Date"),
                  onPressed: (){
                    showDatePicker(
                      context: context,
                      initialDate: lessonDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2021),
                    ).then((date)  {
                      setState((){
                        lessonDate = date;
                      });
                    });
                  },
                ),

                RaisedButton(
                  onPressed: (){
                    lessonConfirmation(context);
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
          "The leesons you want to take are:"
              "$hourStack" + "  One Hour Lessons,  "
              "$sixHoursStack" + "  6 hours lessons,  "
              "$eightHoursStack" + "  8 hours lessons,  "
              "Total: $totalLessonPrice  TL"
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Confirm & Continue"),
          onPressed: () {
            _databaseService.anonCustomerDataUpdate(
                name, surname, email, age, weight, phoneNumber);
            _databaseService.anonPrivateLessonData(
                totalHour,
                hourStack,
                sixHoursStack,
                eightHoursStack,
                session,
                totalLessonPrice,
                lessonDate);
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
        builder: (BuildContext context) {
          return alertDialog;
        }
    );
  }
}

