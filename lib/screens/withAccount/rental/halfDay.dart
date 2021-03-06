import 'package:flutter/material.dart';

import 'package:kbgapp/services/database.dart';
import 'package:kbgapp/sharedCode/missingInformations.dart';

class HalfDayRental extends StatefulWidget {
  @override
  _HalfDayRentalState createState() => _HalfDayRentalState();
}

class _HalfDayRentalState extends State<HalfDayRental> {

  DatabaseService _databaseService = new DatabaseService();

  DateTime _rentalDate = new DateTime.now();

  bool _authorise = false;

  int _full = 0;
  int _kiteBar = 0;
  int _board = 0;
  int _harness = 0;

  int _fullStack = 0;
  int _kiteBarStack = 0;
  int _boardStack = 0;
  int _harnessStack = 0;

  int _totalPrice = 0;

  void _minusFullEquipStack() { // decrease _fullStack by 1 never under 0
    setState(() {
      if (_fullStack != 0)
        _fullStack--;
    });
  }

  void _incrementFullEquipStack() { // increase _fullStack by 1
    setState(() {
      _fullStack++;
    });
  }

  void _incrementKiteBarStack() { // increase _kiteBarStack by 1
    setState(() {
      _kiteBarStack++;
    });
  }

  void _minusKiteBarStack() { // increase _kiteBarStack by 1 never under 0
    setState(() {
      if (_kiteBarStack != 0)
        _kiteBarStack--;
    });
  }

  void _incrementBoardStack() { // increase _boardStack by 1
    setState(() {
      _boardStack++;
    });
  }

  void _minusBoardStack() { // increase _boardStack by 1 never under 0
    setState(() {
      if (_boardStack != 0)
        _boardStack--;
    });
  }

  void _incrementHarnessStack() { // increase _harnessStack by 1
    setState(() {
      _harnessStack++;
    });
  }

  void _minusHarnessStack() { // increase _harnessStack by 1 never under 0
    setState(() {
      if (_harnessStack != 0)
        _harnessStack--;
    });
  }

  int _fullEquipmentPrice(){ // multiply to give us total full equipment price
    return _full = 160 * _fullStack;
  }

  int _kiteBarPrice(){ // multiply to give us total kite+bar price
    return _kiteBar = 140 * _kiteBarStack;
  }

  int _boardPrice(){ // multiply to give us total board price
    return _board = 120 * _boardStack;
  }

  int _harnessPrice(){ // multiply to give us total harness price
    return _harness = 60 * _harnessStack;
  }

  int totalPrice(){ // Calculate total price the customer will pay
    return _totalPrice = _harness + _board + _kiteBar + _full;
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
                        '$_fullStack',
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
                          color: Colors.black
                        ),
                      ),

                      new Text('$_kiteBarStack',
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

                      new Text('$_boardStack',
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

                      new Text('$_harnessStack',
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

                SizedBox(height: 10,),

                Text(
                  "Total price: $_totalPrice TL",
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
                  child: Text("Rental Date"),
                  onPressed: (){
                    showDatePicker(
                      context: context,
                      initialDate: _rentalDate == null ? DateTime.now() : _rentalDate,
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
                  child: Text("Make an Appointment"),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _rentConfirmation(BuildContext context){
    var alertDialog = AlertDialog(
      backgroundColor: Colors.brown[100],
      title: Text(
        "CONFIRMATION",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text(
          "The equipments you want to rent are:\n"
              "$_fullStack" +"  Full Equipment\n  "
              "$_kiteBarStack"+"  Kite and Bar\n  "
              "$_boardStack"+"  Boards\n  "
              "$_harnessStack"+"  Harnesses\n"
              "On $_rentalDate\n  "
              "Total: $_totalPrice  TL"
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Confirm & Continue"),
          onPressed: (){
            _databaseService.halfDayRentalData(_fullStack, _kiteBarStack, _boardStack, _harnessStack, _totalPrice, _rentalDate, _authorise);
            Navigator.of(context).pop(false);

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
