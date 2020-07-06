import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kbgapp/screens/withAccount/profile/updateInformations.dart';
import 'package:kbgapp/services/authentication.dart';
import 'package:kbgapp/sharedCode/loadingIcon.dart';
import 'package:kbgapp/sharedCode/textInpuDecoration.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Firestore _firestore = Firestore.instance;

  String name, surname, phone, email, password;
  int age;
  double weight;
  
  Loading load = new Loading();

  _getProfile() async {
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
    _getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton(
            child: Text("Delete Account"),
            onPressed: (){
              setState(() {
                deleteAccount(context);
              });
            },
          )
        ],
      ),
      body: Container(
        child: name == null && surname == null && phone == null && age == null && weight == null ? load.build(context) : Column( // TODO: loading ekle
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Text(
                "Name: $name",
                style: TextStyle(fontSize: 25),
              ),
            ),

            Card(
              child: Text(
                "Surname: $surname",
                style: TextStyle(fontSize: 25),
              ),
            ),

            Card(
              child: Text(
                "Phone Number: $phone",
                style: TextStyle(fontSize: 25),
              ),
            ),

            Card(
              child: Text(
                "Age: $age",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Card(
              child: Text(
                "Weight: $weight",
                style: TextStyle(fontSize: 25),
              ),
            ),

            RaisedButton(
              child: Text("Change Personal Information"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateInformation()));
              },
            )
          ],
        ),
      ),
    );
  }

  writeText(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: textInputDecoration.copyWith(labelText: "e-mail"),
                validator: (value) => value.isEmpty ? "e-mail" : null,
                onChanged: (value){
                  setState(() {
                    email = value;
                  });
                },
              ),

              SizedBox(height: 25,),

              TextFormField(
                decoration: textInputDecoration.copyWith(labelText: "Password"),
                validator: (value) => value.isEmpty ? "password" : null,
                onChanged: (value){
                  setState(() {
                    password = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


  deleteAccount(BuildContext context){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Do you want to delete your account?"),
        content: writeText(context),
        actions: <Widget>[
          RaisedButton(
            child: Text("Delete"),
            onPressed: (){
              setState(() async {
                await AuthService().deleteUser(email, password);
              });
            },
          ),
        ],
      );
    });
  }

}
