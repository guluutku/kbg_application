import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:kbgapp/services/database.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  // read member data

  dynamic data;

  Future<dynamic> getData() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    final DocumentReference document =   Firestore.instance.collection("membership").document(firebaseUser.uid);
    await document.get().then<dynamic>(( DocumentSnapshot snapshot) async{
      return data = snapshot.data;
    });
  }

  DatabaseService _databaseService = new DatabaseService();

  @override
  void initState() {
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tiitlr"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)
                  ),
                  child: ListTile(
                    title: Text(data['name']),//here error
                  ),
                )
              ]
          )
      ),
    );
  }


}
