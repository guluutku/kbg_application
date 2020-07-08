import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:kbgapp/sharedCode/loadingIcon.dart';
import 'package:kbgapp/sharedCode/logout.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {

  Firestore _firestore = Firestore.instance;

  Loading load = new Loading();

  // variables, read and send check of Gün
  bool _gunWork;
  bool _gunMorning;
  bool  _gunAfternoon;
  _getGunCheck() async {
    DocumentSnapshot snapshot = await _firestore.collection('Teacher Checklist').document('gunUluutku').get();
    snapshot == null ? null :
    setState(() {
      _gunWork = snapshot['work'];
      _gunMorning = snapshot['morning lesson'];
      _gunAfternoon = snapshot['afternoon lesson'];


    });
  }
  void _gunChangeChecks(bool gunWork, bool gunMorning, bool gunAfternoon) async{
    await _firestore.collection("Teacher Checklist").document('gunUluutku').updateData({
      'work' : gunWork,
      'morning lesson' : gunMorning,
      'afternoon lesson' : gunAfternoon,

    });
  }

  @override
  void initState() {
    super.initState();
    _getGunCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Daily Teacher Checklist"),
        actions: <Widget>[
          logOut(context),
        ],
        leading: new Container(),
      ),

      body: _gunWork == null && _gunAfternoon == null && _gunMorning == null ? Loading() : Center(
        child: Column(
          children: <Widget>[
            Card(// Gün's check list
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
                                  _gunChangeChecks(_gunWork, _gunMorning, _gunAfternoon);
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
                                  _gunChangeChecks(_gunWork, _gunMorning, _gunAfternoon);
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
                                  _gunChangeChecks(_gunWork, _gunMorning, _gunAfternoon);
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
