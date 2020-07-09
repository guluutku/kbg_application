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
            Image.asset("assets/images/equipments.jpg"),
            SizedBox(height: 10,),
            Text(
              " You can rent equipments for either half a day or all day long.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
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

            Text(
              " Note that, if you don't know how to do kitesurf, we will NOT\n provide you any equipments.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
