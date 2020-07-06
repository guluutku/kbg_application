import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kbgapp/sharedCode/logout.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {

  bool _gunWork = false;
  bool _gunMorning = false;
  bool _gunAfternoon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Daily Teacher Checklist"),
        actions: <Widget>[
          logout,
        ],
        leading: new Container(),
      ),

      body: Center( // TODO: Firebase bağlamadan öğretmenleri listele
        child: Column(
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  Text(
                    "Gün ULUUTKU",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Card(
                        color: !_gunWork ? Colors.red : Colors.green,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 5,),
                            Text( _gunWork ? "  Came  " : "  Did not come  "),
                            Checkbox(
                              value: _gunWork,
                              onChanged: (bool value){
                                setState(() {
                                  _gunWork = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),

                      Card(
                        color: !_gunMorning ? Colors.green : Colors.blue,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 5,),
                            Text(_gunMorning ? "  Morning Lesson  " : "  Morning Empty "),
                            Checkbox(
                              value: _gunMorning,
                              onChanged: (bool value){
                                setState(() {
                                  _gunMorning = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),

                      Card(
                        color: !_gunAfternoon ? Colors.green : Colors.blue,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 5,),
                            Text(_gunAfternoon ?  "  Afternoon Lesson  " : "  Afternoon Empty  "),
                            Checkbox(
                              value: _gunAfternoon,
                              onChanged: (bool value){
                                setState(() {
                                  _gunAfternoon = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
