import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kbgapp/services/database.dart';
import 'package:kbgapp/sharedCode/textInpuDecorations.dart';

class UpdateInformation extends StatefulWidget {
  @override
  _UpdateInformationState createState() => _UpdateInformationState();
}

class _UpdateInformationState extends State<UpdateInformation> {

  DatabaseService _databaseService = new DatabaseService();
  Firestore _firestore = Firestore.instance;

  String _name, _surname, _phoneNumber;
  int _age = 0;
  double _weight = 0.0;

  _getProfile() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    DocumentSnapshot snapshot = await _firestore.collection('membership')
        .document(firebaseUser.uid)
        .get();
    setState(() {
      _name = snapshot['name'];
      _surname = snapshot['surname'];
      _phoneNumber = snapshot['phone number'];
      _age = snapshot['age'];
      _weight = snapshot['weight'];
    });
  }

  @override
  void initState() {
    _getProfile();
    super.initState();
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Change Personal Information"),
          actions: <Widget>[
            FlatButton(
              child: Text("Change Information"),
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                  _databaseService.updateMemberData(
                      _name, _surname, _age, _weight, _phoneNumber);
                });
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[

                TextFormField(
                  decoration: textInputDecoration.copyWith(labelText: "name"),
                  validator: (value) => value.isEmpty ? "name" : null,
                  onChanged: (value) {
                    setState(() {
                      value == null ? null :
                      _name = value;
                    });
                  },
                ),

                SizedBox(height: 20,),

                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      labelText: "surname"),
                  validator: (value) => value.isEmpty ? "surname" : null,
                  onChanged: (value) {
                    setState(() {
                      value == null ? null :
                      _surname = value;
                    });
                  },
                ),

                SizedBox(height: 20,),

                TextField(
                  decoration: textInputDecoration.copyWith(
                      labelText: "Enter your age"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (_value) {
                    setState(() {
                      _value == null ? null :
                      _age = int.parse(_value);
                    });
                  },
                ),

                SizedBox(height: 20,),

                TextField(
                  decoration: textInputDecoration.copyWith(
                      labelText: "Enter your weight"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  onChanged: (_value) {
                    setState(() {
                      _value == null ? null :
                      _weight = double.parse(_value);
                    });
                  },
                ),

                SizedBox(height: 20,),

                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      labelText: "phone number"),
                  validator: (value) => value.isEmpty ? "phone number" : null,
                  onChanged: (value) {
                    setState(() {
                      value == null ? null :
                      _phoneNumber = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
