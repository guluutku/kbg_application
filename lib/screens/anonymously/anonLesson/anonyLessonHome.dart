import 'package:flutter/material.dart';
import 'package:kbgapp/screens/anonymously/anonLesson/anonGroupLesson.dart';
import 'package:kbgapp/screens/anonymously/anonLesson/anonPrivateLesson.dart';

class LessonsHomePage extends StatefulWidget {
  @override
  _LessonsHomePageState createState() => _LessonsHomePageState();
}

class _LessonsHomePageState extends State<LessonsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],

      appBar: AppBar(
        title: Text("Lessons"),
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
                    MaterialPageRoute(builder: (context) => AnonPrivateLessons())
                );
              },
              child: Text("Private lesson"),
            ),

            RaisedButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AnonGroupLesson())
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