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
            Image.asset(
              "assets/images/kbgFriends.jpg",
              scale: 13,
            ),
            SizedBox(height: 10,),
            Text(
              " We have private and group lessons*. In your kite "
                  "\n"
                  " lessons, all of the kite equipments are given by our \n school. "
                  " You can come to our school like you go to \n a beach. "
                  "\n"
                  " First, we will teach you about wind, how to control \n the kite(with a small kite) on land, safety and kite\n equipments."
                  " After that, we will teach you how to\n control a big kite in the water."
                  " And finally, you will\n learn to ride a board with kite."
                  "\n"
                  " After lessons, you can rent our equipments."
                  "\n"
                  " Note that, you can take only 3 hours of lesson a day \n as your body can't take more than 3 hour lesson."
                  "\n"
                  " Remaining hours will be given next days. ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 18,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PrivateLesson())
                    );
                  },
                  child: Text("Private lesson"),
                ),

                SizedBox(width: 16,),

                RaisedButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GroupLesson())
                    );
                  },
                  child: Text("Group lesson"),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
