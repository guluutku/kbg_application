import 'package:flutter/material.dart';

import 'package:kbgapp/screens/withAccount/lessons/groupLesson.dart';
import 'package:kbgapp/screens/withAccount/lessons/privateLesson.dart';

class LessonHome extends StatefulWidget {
  @override
  _LessonHomeState createState() => _LessonHomeState();
}

class _LessonHomeState extends State<LessonHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],

      appBar: AppBar(
        title: Text("Lessons"),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "Choose if you want to take private lessons or group lessons*.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 20,
              ),
            ),

            RaisedButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrivateLesson())
                );
              },
              child: Text("Private lesson"),
            ),

            RaisedButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GroupLesson())
                );
              },
              child: Text("Group lesson"),
            ),

            Text(
              "* Group lessons are done with 2 students. These students are NOT random people."
                  " They are friends, family, etc."
                  " Also, price of the group lessons is NOT individual.",
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),

            Text(
              "** In lessons, all kite equipments are provided by the school.",
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
