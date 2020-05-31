import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:kbgapp/services/database.dart';
import 'package:kbgapp/sharedCode/textInpuDecoration.dart';
import '../anonHome.dart';

class HalfDayRental extends StatefulWidget {
  @override
  _HalfDayRentalState createState() => _HalfDayRentalState();
}

class _HalfDayRentalState extends State<HalfDayRental> {

  DatabaseService _databaseService = new DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],

      appBar: AppBar(
        title: Text('Half Day Rental'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[600],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.usb),
            title: Text("HHHHHHH"),
          ),
        ],
      ),
    );
  }

  /**
  void rentConfirmation(BuildContext context){
    var alertDialog = AlertDialog(
      title: Text(
        "CONFIRMATION",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text(
          "The equipments you want to rent are:"
              "$fullStack" +"  Full Equipment,  "
              "$kiteBarStack"+"  Kite and Bar,  "
              "$boardStack"+"  Boards,  "
              "$harnessStack"+"  Harnesses  "
              "Total: $totalHalfDayEquip  TL"
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Confirm & Continue"),
          onPressed: (){
            _databaseService.anonCustomerDataUpdate(name, surname ,email, age,weight,phoneNumber);
            _databaseService.anonHalfDayRentalData(fullStack, kiteBarStack, boardStack, harnessStack, totalHalfDayEquip, rentalDate);
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
        builder: (BuildContext context){
          return alertDialog;
        }
    );
  }
      */
}