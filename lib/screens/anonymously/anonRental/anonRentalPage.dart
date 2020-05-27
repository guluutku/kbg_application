import 'package:flutter/material.dart';

import 'package:kbgapp/screens/anonymously/anonRental/anonAllDay.dart';
import 'package:kbgapp/screens/anonymously/anonRental/anonHalfDay.dart';

class AnonRentalPage extends StatefulWidget {
  @override
  _AnonRentalPageState createState() => _AnonRentalPageState();
}

class _AnonRentalPageState extends State<AnonRentalPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],

      appBar: AppBar(
        title: Text('Rental'),
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