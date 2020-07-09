import 'dart:math';

import 'package:flutter/material.dart';

import 'package:kbgapp/screens/withAccount/accountHome.dart';
import 'package:kbgapp/services/database.dart';
import 'package:kbgapp/sharedCode/missingInformations.dart';

class AllDayRent extends StatefulWidget {
  @override
  _AllDayRentState createState() => _AllDayRentState();
}

class _AllDayRentState extends State<AllDayRent> {

  DatabaseService _databaseService = new DatabaseService();

  DateTime _rentalDate = new DateTime.now();

  bool _authorise = false;

  int _full = 0;
  int _kiteBar = 0;
  int _board = 0;
  int _harness = 0;

  int fullStack = 0;
  int kiteBarStack = 0;
  int boardStack = 0;
  int harnessStack = 0;

  int _totalPrice = 0;

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
    return _full = 250 * fullStack;
  }

  int _kiteBarPrice(){ // multiply to give us total kite+bar price
    return _kiteBar = 200 * kiteBarStack;
  }

  int _boardPrice(){ // multiply to give us total board price
    return _board = 150 * boardStack;
  }

  int _harnessPrice(){ // multiply to give us total harness price
    return _harness = 100 * harnessStack;
  }

  int _totalPrices(){ // Calculate total price the customer will pay
    return _totalPrice = _harness + _board + _kiteBar + _full;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],

      appBar: AppBar(
        title: Text('All Day Rental'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
      ),

      body: SingleChildScrollView(
        child: Center(

          child: Column(
            children: <Widget>[
              Text(
                " Full equipment means you rent all of the\n equipments. "
                    " Likra and wetsuits can be\n provided by school.",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Card(
                child: Row( // Calculate full equipment price
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Full Equipment (250 TL)"),

                    new FlatButton( // decrease _fullStack by 1
                      onPressed: (){
                        _minusFullEquipStack();
                        _fullEquipmentPrice();
                        _totalPrices();
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
                        _totalPrices();
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
                    Text("Kite+Bar (200 TL)"),

                    new FlatButton( // decrease _kiteBarStack by 1
                      onPressed: (){
                        _minusKiteBarStack();
                        _kiteBarPrice();
                        _totalPrices();
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
                        _totalPrices();
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
                    Text("Board (150 TL)"),

                    new FlatButton( // decrease _boardStack by 1
                      onPressed: (){
                        _minusBoardStack();
                        _boardPrice();
                        _totalPrices();
                      },
                      child: new Icon(
                          const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                          color: Colors.black),
                    ),

                    new Text('$boardStack',
                        style: new TextStyle(fontSize: 30.0)),

                    new FlatButton( // increase _boardStack by 1
                      onPressed: (){
                        _incrementBoardStack();
                        _boardPrice();
                        _totalPrices();
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
                    Text("Harness (100 TL)"),

                    new FlatButton( // decrease _harnessStack by 1
                      onPressed: (){
                        _minusHarnessStack();
                        _harnessPrice();
                        _totalPrices();
                      },
                      child: new Icon(
                          const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                          color: Colors.black),
                    ),

                    new Text('$harnessStack',
                        style: new TextStyle(fontSize: 30.0)),

                    new FlatButton( // increase _harnessStack by 1
                      onPressed: (){
                        _incrementHarnessStack();
                        _harnessPrice();
                        _totalPrices();
                      },
                      child: new Icon(Icons.add, color: Colors.black,),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10,),

              Text(
                "Total price: $_totalPrice",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),
              ),

              CheckboxListTile(
                title: Text('Likra and Wetsuit: Free'),
                value: true,
              ),

              Text(
                _rentalDate == null ? "Choose a date" : "$_rentalDate",
                style: TextStyle(
                    fontSize: 20
                ),
              ),

              RaisedButton(
                child: Text("Date"),
                onPressed: (){
                  showDatePicker(
                    context: context,
                    initialDate: _rentalDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2021),
                  ).then((date)  {
                    setState((){
                      _rentalDate = date;
                    });
                  });
                },
              ),

              RaisedButton(
                onPressed: (){
                  if(_totalPrice == 0){
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
              "$fullStack  Full Equipment,  "
              "$kiteBarStack  Kite and Bar,  "
              "$boardStack  Boards,  "
              "$harnessStack  Harnesses  "
              "Total: $_totalPrice  TL"
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Confirm & Continue"),
          onPressed: (){
            _databaseService.allDayRentalData(fullStack, kiteBarStack, boardStack, harnessStack, _totalPrice, _rentalDate, _authorise);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountHome()),
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

}
