import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Admin_MemberProfile extends StatefulWidget {

  @override
  _Admin_MemberProfileState createState() => _Admin_MemberProfileState();
}

class _Admin_MemberProfileState extends State<Admin_MemberProfile> {

  Firestore _firestore = Firestore.instance;
  List<DocumentSnapshot> _subColl = [];

  _getSubCollection() async {
    Query subQuery = _firestore.collection("anonymous").document().collection("Half Day Rentals");

    QuerySnapshot querySnapshot1 = await subQuery.getDocuments();
    _subColl = querySnapshot1.documents;
  }

  @override
  void initState() {
    super.initState();
    _getSubCollection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buraya subcolletionlar gelecek."),
      ),

      body:  Container(
        child: ListView.builder(
          itemCount: _subColl.length,
          itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.brown,
              ),
              title: Text("Name: " + _subColl[index].data["Board"]),
            ),
          );
        }),
      )
    );
  }
}
