import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kbgapp/screens/Admin/forMembers/admin_MemberProfile.dart';

class Admin_AnonHome extends StatefulWidget {

  Admin_AnonHome({Key key}) : super(key: key);

  @override
  _Admin_AnonHomeState createState() => _Admin_AnonHomeState();
}

class _Admin_AnonHomeState extends State<Admin_AnonHome> {

  Firestore _firestore = Firestore.instance;
  List<DocumentSnapshot> _anony = [];

  _getMember() async {
    Query query = _firestore.collection("anonymous");

    QuerySnapshot querySnapshot = await query.getDocuments();
    _anony = querySnapshot.documents;
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
                  title: Text("Name: " + _anony[index].data["name"] + _anony[index].data["surname"]),
                  onTap: (){
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Admin_MemberProfile())
                      );
                    });
                  },
                ),
              );
            }),
      ),
    );
  }

}
