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
            Image.asset("assets/images/equipments.jpg"),
            SizedBox(height: 10,),
            Text(
              " You can rent equipments for either half a day or all day long.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
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
                    MaterialPageRoute(builder: (context) => AnonHalfDayRental())
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