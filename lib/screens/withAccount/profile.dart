import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Firestore _firestore = Firestore.instance;

  String name, surname, phone;
  int age;
  double weight;

  getName() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    DocumentSnapshot snapshot =  await _firestore.collection('membership').document(firebaseUser.uid).get();
    setState(() {
      name = snapshot['name'];
      surname = snapshot['surname'];
      phone = snapshot['phone number'];
      age = snapshot['age'];
      weight = snapshot['weight'];
      print(name);
    });
  }

  @override
  void initState() {
    super.initState();
    getName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        child: name == null && surname == null && phone == null && age == null && weight == null ? Text("la") : Column( // TODO: loading ekle
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              child: Text("Name: $name"),
            ),

            Card(
              child: Text("Surname: $surname"),
            ),

            Card(
              child: Text("Phone Number: $phone"),
            ),

            Card(
              child: Text("Age: $age"),
            ),
            Card(
              child: Text("Weight: $weight"),
            ),
          ],
        ),
      ),
    );
  }

}
