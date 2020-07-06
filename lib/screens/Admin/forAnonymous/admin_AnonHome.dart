import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:kbgapp/screens/Admin/forAnonymous/admin_AnonProfile.dart';
import 'package:kbgapp/sharedCode/loadingIcon.dart';
import 'package:kbgapp/sharedCode/logout.dart';

class Admin_AnonHome extends StatefulWidget {

  Admin_AnonHome({Key key}) : super(key: key);

  @override
  _Admin_AnonHomeState createState() => _Admin_AnonHomeState();
}

class _Admin_AnonHomeState extends State<Admin_AnonHome> {

  Firestore _firestore = Firestore.instance;
  List<DocumentSnapshot> _anony = [];

  Loading load = new Loading();

  String _docID;
  bool _loading = true;

  _getDocID(String name){ //TODO: use this DO NOT FORGET
    var ref = _firestore.collection("anonymous").where("name", isEqualTo: name).getDocuments();
    ref.then((_documentID) => this._docID = _documentID.documents[0].documentID); // take document ID to a variable
  }

  _getCustomer() async {
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

  @override
  void initState() {
    super.initState();
    _getCustomer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anonymous"),
        actions: <Widget>[
         logout,
        ],
        leading: new Container(),
      ),

      body: Container(
        child: _loading ? load.build(context) : ListView.builder(
            itemCount: _anony.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.brown,
                ),
                title: Text("Customer: " + _anony[index].data["name"] + " " + _anony[index].data["surname"]),
                onTap: (){
                  setState(() {
                    _getDocID(_anony[index].data["name"]).then({
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Admin_AnonProfile(docID: _docID,))
                      )
                    });
                  });
                },
              );
            }),
      ),
    );
  }

}
