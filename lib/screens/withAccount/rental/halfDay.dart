import 'package:flutter/material.dart';

import 'package:kbgapp/screens/withAccount/accountHome.dart';
import 'package:kbgapp/services/database.dart';
import 'package:kbgapp/sharedCode/missingInfo.dart';

class HalfDayRental extends StatefulWidget {
  @override
  _HalfDayRentalState createState() => _HalfDayRentalState();
}

class _HalfDayRentalState extends State<HalfDayRental> {

  DatabaseService _databaseService = new DatabaseService();

  DateTime rentalDate = new DateTime.now();

  int _full = 0;
  int _kiteBar = 0;
  int _board = 0;
  int _harness = 0;

  int fullStack = 0;
  int kiteBarStack = 0;
  int boardStack = 0;
  int harnessStack = 0;

  int totalHalfDayEquip = 0;

  void _minusFullEquipStack() { // decrease _fullStack by 1 never under 0
    setState(() {
      if (fullStack != 0)
        fullStack--;
    });
  }

  void _incrementFullEquipStack() { // increase _fullStack by 1
    setState(() {
      fullStack++;
    });
  }

  void _incrementKiteBarStack() { // increase _kiteBarStack by 1
    setState(() {
      kiteBarStack++;
    });
  }

  void _minusKiteBarStack() { // increase _kiteBarStack by 1 never under 0
    setState(() {
      if (kiteBarStack != 0)
        kiteBarStack--;
    });
  }

  void _incrementBoardStack() { // increase _boardStack by 1
    setState(() {
      boardStack++;
    });
  }

  void _minusBoardStack() { // increase _boardStack by 1 never under 0
    setState(() {
      if (boardStack != 0)
        boardStack--;
    });
  }

  void _incrementHarnessStack() { // increase _harnessStack by 1
    setState(() {
      harnessStack++;
    });
  }

  void _minusHarnessStack() { // increase _harnessStack by 1 never under 0
    setState(() {
      if (harnessStack != 0)
        harnessStack--;
    });
  }

  int _fullEquipmentPrice(){ // multiply to give us total full equipment price
    return _full = 160 * fullStack;
  }

  int _kiteBarPrice(){ // multiply to give us total kite+bar price
    return _kiteBar = 140 * kiteBarStack;
  }

  int _boardPrice(){ // multiply to give us total board price
    return _board = 120 * boardStack;
  }

  int _harnessPrice(){ // multiply to give us total harness price
    return _harness = 60 * harnessStack;
  }

  int totalPrice(){ // Calculate total price the customer will pay
    return totalHalfDayEquip = _harness + _board + _kiteBar + _full;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],

      appBar: AppBar(
        title: Text('Half Day Rental'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
      ),

      body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[

                Card(
                  child: Row( // Calculate full equipment price
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Full Equipment (160 TL)"),

                      new FlatButton( // decrease _fullStack by 1
                        onPressed: (){
                          _minusFullEquipStack();
                          _fullEquipmentPrice();
                          totalPrice();
                        },
                        child: new Icon(
                            const IconData(
                              0xe15b,
                              fontFamily: 'MaterialIcons',
                            ),
                            color: Colors.black),
                      ),

                      new Text(
                        '$fullStack',
                        style: new TextStyle(
                            fontSize: 30.0
                        ),
                      ),

                      new FlatButton( // increase _fullStack by 1
                        onPressed: (){
                          _incrementFullEquipStack();
                          _fullEquipmentPrice();
                          totalPrice();
                        },
                        child: new Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),

                    ],
                  ),
                ),

                Card(
                  child: Row( // Calculate kite+bar price
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Kite+Bar (140 TL)"),

                      new FlatButton( // decrease _kiteBarStack by 1
                        onPressed: (){
                          _minusKiteBarStack();
                          _kiteBarPrice();
                          totalPrice();
                      },
                      child: new Icon(
                        const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                        color: Colors.black),
                      ),

                      new Text('$kiteBarStack',
                        style: new TextStyle(fontSize: 30.0)),

                      new FlatButton( // increase _kiteBarStack by 1
                        onPressed: (){
                          _incrementKiteBarStack();
                          _kiteBarPrice();
                          totalPrice();
                        },
                        child: new Icon(Icons.add, color: Colors.black,),
                      ),
                    ],
                  ),
                ),

                Card(
                  child: Row( // Calculate board price
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                    Text("Board (120 TL)"),

                      new FlatButton( // decrease _boardStack by 1
                        onPressed: (){
                          _minusBoardStack();
                          _boardPrice();
                          totalPrice();
                        },
                        child: new Icon(
                          const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                          color: Colors.black
                        ),
                      ),

                      new Text('$boardStack',
                        style: new TextStyle(fontSize: 30.0)),

                      new FlatButton( // increase _boardStack by 1
                        onPressed: (){
                          _incrementBoardStack();
                          _boardPrice();
                          totalPrice();
                        },
                        child: new Icon(Icons.add, color: Colors.black,),
                      ),
                    ],
                  ),
                ),

                Card(
                  child: Row( // Calculate harness price
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Harness (60 TL)"),

                      new FlatButton( // decrease _harnessStack by 1
                        onPressed: (){
                          _minusHarnessStack();
                          _harnessPrice();
                          totalPrice();
                        },
                        child: new Icon(
                          const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                          color: Colors.black
                        ),
                      ),

                      new Text('$harnessStack',
                        style: new TextStyle(fontSize: 30.0)
                      ),

                      new FlatButton( // increase _harnessStack by 1
                        onPressed: (){
                          _incrementHarnessStack();
                          _harnessPrice();
                          totalPrice();
                        },
                        child: new Icon(Icons.add, color: Colors.black,),
                      ),
                    ],
                  ),
                ),

                CheckboxListTile(
                  title: Text('Likra and Wetsuit: Free'),
                    value: true,
                ),

                Text(
                  "$rentalDate",
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),

                RaisedButton(
                  child: Text("Date"),
                  onPressed: (){
                    showDatePicker(
                      context: context,
                      initialDate: rentalDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2021),
                    ).then((date)  {
                      setState((){
                        rentalDate = date;
                      });
                    });
                  },
                ),

                RaisedButton(
                  onPressed: (){
                    if(totalHalfDayEquip == 0){
                      noEquipment(context);
                    } else{
                      _rentConfirmation(context);
                    }
                  },
                  child: Text("Continue"),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _rentConfirmation(BuildContext context){
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
            _databaseService.halfDayRentalData(fullStack, kiteBarStack, boardStack, harnessStack, totalHalfDayEquip, rentalDate);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountHome()),
            );
          },
        ),
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context){
          return alertDialog;
        }
    );
  }

}
