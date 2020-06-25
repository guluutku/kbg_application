import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kbgapp/screens/Admin/forMembers/admin_MembersHome.dart';

// ignore: camel_case_types
class Admin_MemberProfile extends StatefulWidget {

  final String docID;

  Admin_MemberProfile({Key key, @required this.docID}) : super(key: key);

  @override
  _Admin_MemberProfileState createState() => _Admin_MemberProfileState(docID);
}

// ignore: camel_case_types
class _Admin_MemberProfileState extends State<Admin_MemberProfile> {

  String docID;
  _Admin_MemberProfileState(this.docID);

  Firestore _firestore = Firestore.instance;
  List<DocumentSnapshot> _members = [];

  bool _loading = true;

  _getMember() async {
    Query query = _firestore.collection("Half Day Rentals");
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
                title: Text("Name: " + _members[index].data["asd"] + _members[index].data["afg"]),
                onTap: (){
                  print(docID);
                },
              );
            }),
      ),
    );
  }

}
