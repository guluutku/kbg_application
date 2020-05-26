import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:kbgapp/services/database.dart';
import 'package:kbgapp/sharedCode/textInpuDecoration.dart';

import '../anonHome.dart';

class AllDayRent extends StatefulWidget {
  @override
  _AllDayRentState createState() => _AllDayRentState();
}

class _AllDayRentState extends State<AllDayRent> {

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

  int total = 0;
  String dayType = "Full Day";

  String name = "", surname, email, phoneNumber;
  int age;
  double weight;

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

  int totalPrice(){ // Calculate total price the customer will pay
    return total = _harness + _board + _kiteBar + _full;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],

      appBar: AppBar(
        title: Text('All Day Rental'),
      ),

      body: SingleChildScrollView(
        child: Center(

          child: Column(
            children: <Widget>[
              Row( // Calculate full equipment price
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Full Equipment (250 TL)"),

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
                  Text("Kite+Bar (200 TL)"),

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
                  Text("Board (150 TL)"),

                  new RaisedButton( // decrease _boardStack by 1
                    onPressed: (){
                      _minusBoardStack();
                      _boardPrice();
                      totalPrice();
                    },
                    child: new Icon(
                        const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                        color: Colors.black),
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
                  Text("Harness (100 TL)"),

                  new RaisedButton( // decrease _harnessStack by 1
                    onPressed: (){
                      _minusHarnessStack();
                      _harnessPrice();
                      totalPrice();
                    },
                    child: new Icon(
                        const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                        color: Colors.black),
                  ),

                  new Text('$harnessStack',
                      style: new TextStyle(fontSize: 30.0)),

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

              TextFormField(
                decoration: textInputDecoration.copyWith(labelText: "name"),
                validator: (value) => value.isEmpty ? "name" : null,
                onChanged: (value){
                  setState(() {
                    name = value;
                  });
                },
              ),

              SizedBox(height: 20,),

              TextFormField(
                decoration: textInputDecoration.copyWith(labelText: "surname"),
                validator: (value) => value.isEmpty ? "surname" : null,
                onChanged: (value){
                  setState(() {
                    surname = value;
                  });
                },
              ),

              SizedBox(height: 20,),

              TextFormField(
                decoration: textInputDecoration.copyWith(labelText: "email"),
                validator: (value) => value.isEmpty ? "email" : null,
                onChanged: (value){
                  setState(() {
                    email = value;
                  });
                },
              ),

              SizedBox(height: 20,),

              TextFormField(
                decoration: textInputDecoration.copyWith(labelText: "Phone"),
                validator: (value) => value.isEmpty ? "phone" : null,
                onChanged: (value){
                  setState(() {
                    phoneNumber = value;
                  });
                },
              ),

              SizedBox(height: 20,),

              TextField(
                decoration: textInputDecoration.copyWith(labelText: "Enter your age"),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                onChanged: (_value){
                  setState(() {
                    age = int.parse(_value);
                  });
                },
              ),

              SizedBox(height: 20,),

              TextField(
                decoration: textInputDecoration.copyWith(labelText: "Enter your weight"),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
                onChanged: (_value){
                  setState(() {
                    weight = double.parse(_value);
                  });
                },
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
                onPressed: (){
                  rentConfirmation(context);
                },
                child: Text("Continue"),
              ),
            ],
          ),

          ),
      ),
      );
  }

  void rentConfirmation(BuildContext context){
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
              "Total: $total  TL"
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Confirm & Continue"),
          onPressed: (){
            _databaseService.anonCustomerDataUpdate(name, surname ,email, age,weight,phoneNumber);
            _databaseService.anonRentalData(fullStack, kiteBarStack, boardStack, harnessStack, total, dayType, rentalDate);
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

}
