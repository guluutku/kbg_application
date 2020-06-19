import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Admin_AnonHome extends StatefulWidget {

  Admin_AnonHome({Key key}) : super(key: key);

  @override
  _Admin_AnonHomeState createState() => _Admin_AnonHomeState();
}

class _Admin_AnonHomeState extends State<Admin_AnonHome> {

  Firestore _firestore = Firestore.instance;
  List<DocumentSnapshot> _anony = [];
  List<DocumentSnapshot> _subColl = [];

  bool _loading = true;

  _getMember() async {
    Query query = _firestore.collection("anonymous");

    setState(() {
      _loading = true;
    });

    QuerySnapshot querySnapshot = await query.getDocuments();
    _anony = querySnapshot.documents;
    setState(() {
      _loading = false;
    });
  }

  _getSubCollection() async {
    Query subQuery = _firestore.collection("anonymous").document().collection("Half Day Rentals");

    setState(() {
      _loading = true;
    });

    QuerySnapshot querySnapshot1 = await subQuery.getDocuments();
    _subColl = querySnapshot1.documents;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getMember();
    _getSubCollection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anonymous"),
      ),
      body: Container(
        child: _anony.length == 0 ? Center(child: Text("empty"),) : ListView.builder(
            itemCount: _anony.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.brown,
                  ),
                  title: Text("Name: " + _anony[index].data["name"]),
                  onTap: (){
                    bottomSettings(context);
                  },
                ),
              );
            }),
      ),
    );
  }

  void bottomSettings(BuildContext context){
    showModalBottomSheet(context: context, builder: (context){
      return Container(
        child: ListView.builder(
            itemCount: _subColl.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.brown,
                ),
                title: Text("Name: " + _subColl[index].data["Harness"]),
                onTap: (){
                  bottomSettings(context);
                },
              );
            }),
      );
    });
  }

}
