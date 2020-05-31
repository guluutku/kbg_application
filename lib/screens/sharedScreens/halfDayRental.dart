import 'package:flutter/material.dart';

class HalfDayRental extends StatefulWidget {
  @override
  _HalfDayRentalState createState() => _HalfDayRentalState();
}

class _HalfDayRentalState extends State<HalfDayRental> {

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(

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
                  Text("Harness (60 TL)"),

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

            ],
          ),
        ),
      ),
    );
  }

}
