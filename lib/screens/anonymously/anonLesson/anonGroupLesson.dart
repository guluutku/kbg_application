import 'package:flutter/material.dart';

class AnonGroupLesson extends StatefulWidget {
  @override
  _AnonGroupLessonState createState() => _AnonGroupLessonState();
}

class _AnonGroupLessonState extends State<AnonGroupLesson> {

  int _sixHours = 0;
  int _eightHours = 0;
  int _hour = 0;

  int _sixHoursStack = 0;
  int _eightHoursStack = 0;
  int _hourStack = 0;

  int totalLessonPrice = 0;
  int totalHour = 0;

  void incrementSixHours(){
    setState(() {
      _sixHoursStack++;
    });
  }

  void decreaseSixHours(){
    if(_sixHoursStack != 0){
      setState(() {
        _sixHoursStack--;
      });
    }
  }

  int sixHoursPrice(){
    return _sixHours = 1600 * _sixHoursStack;
  }

  void incrementEightHours(){
    setState(() {
      _eightHoursStack++;
    });
  }

  void decreaseEightHours(){
    if(_eightHoursStack != 0){
      setState(() {
        _eightHoursStack--;
      });
    }
  }

  int eightHoursPrice(){
    return _eightHours = 2100 * _eightHoursStack;
  }

  void incrementHour(){
    setState(() {
      _hourStack++;
    });
  }

  void decreaseHour(){
    if(_hourStack != 0){
      setState(() {
        _hourStack--;
      });
    }
  }

  int hourPrice(){
    return _hour = 300 * _hourStack;
  }

  int totalPrice() {
    return totalLessonPrice = _eightHours + _hour + _sixHours;
  }

  int totalHours(){
    return totalHour = 1 * _hourStack + 6 * _sixHoursStack + 8 * _eightHoursStack;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text("Private Lesson"),
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "Please how many hours you want to puchose.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 20,
              ),
            ),

            Text(
              "You can only take lessons up to 3 hours for 1 day. Other hours will be done in the next day. "
                  "This is done because learning more than 3 hours a day would be too hard for your body.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 20,
              ),
            ),

            Row( // Calculate kite+bar price
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("8 Hours packege: 2100 TL"),

                new RaisedButton( // decrease _eightHoursStack by 1
                  onPressed: (){
                    decreaseEightHours();
                    eightHoursPrice();
                    totalPrice();
                    totalHours();
                  },
                  child: new Icon(
                      const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                      color: Colors.black),
                ),

                new Text('$_eightHoursStack',
                    style: new TextStyle(fontSize: 30.0)),

                new RaisedButton( // increase _eightHoursStack by 1
                  onPressed: (){
                    incrementEightHours();
                    eightHoursPrice();
                    totalPrice();
                    totalHours();
                  },
                  child: new Icon(Icons.add, color: Colors.black,),
                ),
              ],
            ),

            Row( // Calculate kite+bar price
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("6 Hours packege: 1600 TL"),

                new RaisedButton( // decrease _sixHoursStack by 1
                  onPressed: (){
                    decreaseSixHours();
                    sixHoursPrice();
                    totalPrice();
                    totalHours();
                  },
                  child: new Icon(
                      const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                      color: Colors.black),
                ),

                new Text('$_sixHoursStack',
                    style: new TextStyle(fontSize: 30.0)),

                new RaisedButton( // increase _sixHoursStack by 1
                  onPressed: (){
                    incrementSixHours();
                    sixHoursPrice();
                    totalPrice();
                    totalHours();
                  },
                  child: new Icon(Icons.add, color: Colors.black,),
                ),
              ],
            ),

            Row( // Calculate kite+bar price
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("1 Hour packege: 300 TL"),

                new RaisedButton( // decrease _hourStack by 1
                  onPressed: (){
                    decreaseHour();
                    hourPrice();
                    totalPrice();
                    totalHours();
                  },
                  child: new Icon(
                      const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                      color: Colors.black),
                ),

                new Text('$_hourStack',
                    style: new TextStyle(fontSize: 30.0)),

                new RaisedButton( // increase _hourStack by 1
                  onPressed: (){
                    incrementHour();
                    hourPrice();
                    totalPrice();
                    totalHours();
                  },
                  child: new Icon(Icons.add, color: Colors.black,),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
