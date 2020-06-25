import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/text.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {

  Firestore _firestore = Firestore.instance;

  Future<String> getName() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    DocumentSnapshot snapshot= await _firestore.collection('membership').document(firebaseUser.uid).get();
    name = snapshot['name'];
    if (name is String) {
      print(name);
      return name;
    } else {
      print("Wrrrr");
    }
  }

  var name;

  @override
  Widget build(BuildContext context) {
    getName();
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: <Widget>[
          FlatButton(
            child: Text("adawd"),
            onPressed: (){
              getName();
            },
          ),
        ],
      ),
      body: Container(
        child: name == null ? Text("mam") : Text(name),
      ),
    );
  }


}
