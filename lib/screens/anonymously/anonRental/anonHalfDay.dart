import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:kbgapp/services/database.dart';
import 'package:kbgapp/sharedCode/textInpuDecoration.dart';

class AnonHalfDayRental extends StatefulWidget {
  AnonHalfDayRental({Key key}) : super(key: key);

  @override
  _AnonHalfDayRentalState createState() => _AnonHalfDayRentalState();
}

class _AnonHalfDayRentalState extends State<AnonHalfDayRental> {

  final _formKey = GlobalKey<FormState>();

  String _name;
  String _surname;
  int _age;
  double _weight;
  String _phoneNumber;
  String _email;

  DatabaseService _databaseService = new DatabaseService();

  final dateForm = DateFormat("dd - mm - yyyy");

  DateTime rentalDate = new DateTime.now();

  int _full = 0;
  int _kiteBar = 0;
  int _board = 0;
  int _harness = 0;

  int fullStack = 0;
  int kiteBarStack = 0;
  int boardStack = 0;
  int harnessStack = 0;

  int totalHalfDayEquipPrice = 0;

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
    return totalHalfDayEquipPrice = _harness + _board + _kiteBar + _full;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],

      appBar: AppBar(
        title: Text('Half Day Rental'),
        actions: <Widget>[
          RaisedButton(
            child: Text("Done"),
            onPressed: () {

            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row( // Calculate full equipment price
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Full Equipment (160 TL)"),

                  new RaisedButton( // decrease _fullStack by 1
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

                  new RaisedButton( // increase _fullStack by 1
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

              Row( // Calculate kite+bar price
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Kite+Bar (140 TL)"),

                  new RaisedButton( // decrease _kiteBarStack by 1
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

                  new RaisedButton( // increase _kiteBarStack by 1
                    onPressed: (){
                      _incrementKiteBarStack();
                      _kiteBarPrice();
                      totalPrice();
                    },
                    child: new Icon(Icons.add, color: Colors.black,),
                  ),
                ],
              ),

              Row( // Calculate board price
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Board (120 TL)"),

                  new RaisedButton( // decrease _boardStack by 1
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

                  new RaisedButton( // increase _boardStack by 1
                    onPressed: (){
                      _incrementBoardStack();
                      _boardPrice();
                      totalPrice();
                    },
                    child: new Icon(Icons.add, color: Colors.black,),
                  ),
                ],
              ),

              Row( // Calculate harness price
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Harness (60 TL)"),

                  new RaisedButton( // decrease _harnessStack by 1
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

                  new RaisedButton( // increase _harnessStack by 1
                    onPressed: (){
                      _incrementHarnessStack();
                      _harnessPrice();
                      totalPrice();
                    },
                    child: new Icon(Icons.add, color: Colors.black,),
                  ),
                ],
              ),

              CheckboxListTile(
                title: Text('Likra and Wetsuit: Free'),
                value: true,
              ),

              Text("$rentalDate"),

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
                child: Text("Give personal information"),
                onPressed: (){
                  if( totalHalfDayEquipPrice == 0){
                    print("Wrong info");
                  } else{
                    personalInfo(context);
                  }
                },
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
                      _databaseService.anonHalfDayRentalData(fullStack, kiteBarStack, boardStack, harnessStack, totalHalfDayEquipPrice, rentalDate);
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