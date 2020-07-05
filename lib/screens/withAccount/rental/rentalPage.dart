import 'package:flutter/material.dart';

import 'allDay.dart';
import 'halfDay.dart';

class RentalPage extends StatefulWidget {
  @override
  _RentalPageState createState() => _RentalPageState();
}

class _RentalPageState extends State<RentalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],

      appBar: AppBar(
        title: Text('Rental'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "Choose if you use equipment full day or half a day",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllDayRent())
                );
              },
              child: Text("All day rental"),
            ),

            RaisedButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HalfDayRental())
                );
              },
              child: Text("Half day rental"),
            ),
          ],
        ),
      ),
    );
  }
}
