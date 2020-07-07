import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:kbgapp/services/database.dart';
import 'package:kbgapp/sharedCode/missingInformations.dart';
import 'package:kbgapp/sharedCode/textInpuDecorations.dart';
import '../anonHome.dart';

class AllDayRent extends StatefulWidget {
  @override
  _AllDayRentState createState() => _AllDayRentState();
}

class _AllDayRentState extends State<AllDayRent> {

  DatabaseService _databaseService = new DatabaseService();

  DateTime _rentalDate = new DateTime.now();

  final _formKey = GlobalKey<FormState>();

  final _focus1 = FocusNode();
  final _focus2 = FocusNode();
  final _focus3 = FocusNode();
  final _focus4 = FocusNode();
  final _focus5 = FocusNode();

  bool _authorise = false;

  String _name, _surname, _phoneNumber, _email;
  int _age;
  double _weight;
  
  int _full = 0;
  int _kiteBar = 0;
  int _board = 0;
  int _harness = 0;

  int _fullStack = 0;
  int _kiteBarStack = 0;
  int _boardStack = 0;
  int _harnessStack = 0;

  int _totalAllDayEquipPrice = 0;

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
    return _full = 250 * _fullStack;
  }

  int _kiteBarPrice(){ // multiply to give us total kite+bar price
    return _kiteBar = 200 * _kiteBarStack;
  }

  int _boardPrice(){ // multiply to give us total board price
    return _board = 150 * _boardStack;
  }

  int _harnessPrice(){ // multiply to give us total harness price
    return _harness = 100 * _harnessStack;
  }

  int totalPrice(){ // Calculate total price the customer will pay
    return _totalAllDayEquipPrice = _harness + _board + _kiteBar + _full;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],

      appBar: AppBar(
        title: Text('All Day Rental'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Make an appointment",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 17
              ),
            ),
            onPressed: () {
              setState(() {
                if( _totalAllDayEquipPrice == 0){
                  noEquipment(context);
                } else if(_name == null || _surname == null || _weight == null || _age == null || _email == null || _phoneNumber == null){
                  noInfo(context);
                } else {
                  _databaseService.allDayRentalData(_fullStack, _kiteBarStack, _boardStack, _harnessStack, _totalAllDayEquipPrice, _rentalDate, _authorise);
                  _databaseService.anonCustomerDataUpdate(_name, _surname, _email, _age, _weight, _phoneNumber);
                  Navigator.of(context).pop(AnonymousHomePage());
                }
              });
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Center(

          child: Column(
            children: <Widget>[
              Card(
                child: Row( // Calculate full equipment price
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Full Equipment (250 TL)"),

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
                    Text("Kite+Bar (200 TL)"),

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
                    Text("Board (150 TL)"),

                    new FlatButton( // decrease _boardStack by 1
                      onPressed: (){
                        _minusBoardStack();
                        _boardPrice();
                        totalPrice();
                      },
                      child: new Icon(
                          const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                          color: Colors.black),
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
                    Text("Harness (100 TL)"),

                    new FlatButton( // decrease _harnessStack by 1
                      onPressed: (){
                        _minusHarnessStack();
                        _harnessPrice();
                        totalPrice();
                      },
                      child: new Icon(
                          const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                          color: Colors.black),
                    ),

                    new Text('$_harnessStack',
                        style: new TextStyle(fontSize: 30.0)),

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
                child: Text("Give personal information"),
                onPressed: (){
                    _personalInfo(context);
                },
              ),
            ],
          ),

          ),
      ),
      );
  }

  void _personalInfo(BuildContext context){
    showCupertinoModalPopup(context: context, builder: (context){
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Material(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 95.0, horizontal: 10.0),
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
                      textInputAction: TextInputAction.next,
                      autofocus: true,
                      onFieldSubmitted: (v){
                        FocusScope.of(context).requestFocus(_focus1);
                      },
                    ),
                    SizedBox(height: 10.0),

                    TextFormField(
                      focusNode: _focus1,
                      textInputAction: TextInputAction.next,
                      autofocus: true,
                      onFieldSubmitted: (v){
                        FocusScope.of(context).requestFocus(_focus2);
                      },
                      decoration: textInputDecoration.copyWith(labelText: "Enter your surname"),
                      validator: (val) => val.isEmpty ? 'Please enter a surname' : null,
                      onChanged: (val) => setState(() => _surname = val),
                    ),
                    SizedBox(height: 10.0),

                    TextFormField(
                      focusNode: _focus2,
                      textInputAction: TextInputAction.next,
                      autofocus: true,
                      onFieldSubmitted: (v){
                        FocusScope.of(context).requestFocus(_focus3);
                      },
                      decoration: textInputDecoration.copyWith(labelText: "Enter your phone"),
                      validator: (val) => val.isEmpty ? 'Please enter a phone number' : null,
                      onChanged: (val) => setState(() => _phoneNumber = val),
                    ),
                    SizedBox(height: 10.0),

                    TextFormField(
                      focusNode: _focus3,
                      textInputAction: TextInputAction.next,
                      autofocus: true,
                      onFieldSubmitted: (v){
                        FocusScope.of(context).requestFocus(_focus4);
                      },
                      decoration: textInputDecoration.copyWith(labelText: "Enter your e-mail"),
                      validator: (val) => val.isEmpty ? 'Please enter an e-mail' : null,
                      onChanged: (val) => setState(() => _email = val),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 10.0),

                    TextFormField(
                      focusNode: _focus4,
                      textInputAction: TextInputAction.next,
                      autofocus: true,
                      onFieldSubmitted: (v){
                        FocusScope.of(context).requestFocus(_focus5);
                      },
                      decoration: textInputDecoration.copyWith(labelText: "Enter your age"),
                      validator: (val) => val.isEmpty ? 'Please enter an age' : null,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (val) => setState(() => _age = int.parse(val)),
                    ),
                    SizedBox(height: 10.0),

                    TextFormField(
                      focusNode: _focus5,
                      decoration: textInputDecoration.copyWith(labelText: "Enter your weight"),
                      validator: (val) => val.isEmpty ? 'Please enter a weight' : null,
                      keyboardType: TextInputType.number,
                      onChanged: (val) => setState(() => _weight = double.parse(val)),
                    ),
                    SizedBox(height: 10.0),

                    RaisedButton(
                      color: Colors.brown[400],
                      child: Text(
                        'Close and Save the Informations',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: (){
                        if(_name == null || _surname == null || _weight == null || _age == null || _email == null || _phoneNumber == null){
                          noInfo(context);
                        } else {
                          Navigator.of(context).pop(false);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

}
