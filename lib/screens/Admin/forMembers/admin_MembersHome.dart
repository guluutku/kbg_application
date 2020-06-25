import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'admin_MemberProfile.dart';

// ignore: camel_case_types
class Admin_MembersHome extends StatefulWidget {
  Admin_MembersHome({Key key}) : super(key: key);

  @override
  _Admin_MembersHomeState createState() => _Admin_MembersHomeState();
}

// ignore: camel_case_types
class _Admin_MembersHomeState extends State<Admin_MembersHome> {
  Firestore _firestore = Firestore.instance;
  List<DocumentSnapshot> _members = [];

  bool _loading = true;

  String _docID;

  _getDocID(String docID){ //TODO: use this DO NOT FORGET
    var ref = _firestore.collection("membership").where("name", isEqualTo: docID).getDocuments();
    ref.then((_documentID) => this._docID = _documentID.documents[0].documentID); // take document ID to a variable
  }

  _getMember() async {
    Query query = _firestore.collection("membership");
    setState(() {
      _loading = true;
    });
    QuerySnapshot querySnapshot = await query.getDocuments();
    _members = querySnapshot.documents;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getMember();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        child: _members.length == 0 ? Center(child: Text("empty"),) : ListView.builder(
            itemCount: _members.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.brown,
                ),
                title: Text("Name: " + _members[index].data["name"]),
                onTap: (){
                  _getDocID(_members[index].data["name"]);
                  print(_docID);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Admin_MemberProfile(docID: _docID,))
                  );
                },
              );
            }),
      ),
    );
  }

}
