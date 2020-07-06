import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:kbgapp/screens/entryPage.dart';
import 'package:kbgapp/services/authentication.dart';
import 'package:kbgapp/sharedCode/textInpuDecorations.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();

  getWeight() {
    getWeight();
  }
  getAge() {
    getAge();
  }
  getName() {
    getName();
  }
}

class _SignUpPageState extends State<SignUpPage> {

  final AuthService authService = new AuthService();

  final _formKey = GlobalKey<FormState>();


  String email = "";
  String password = "";
  String error = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign up to Application'),
        actions: <Widget>[
          FlatButton(
            child: Text("Go back to sign-in"),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EntryPage()),
              );
            },
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),

          child: Form(
            key: _formKey,

            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),

                TextFormField(
                  decoration: textInputDecoration.copyWith(labelText: "Email"),
                  validator: (value) => value.isEmpty ? "Enter email" : null,
                  onChanged: (value){
                    setState(() {
                      email = value;
                    });
                  },
                ),

                SizedBox(height:  20.0),

                TextFormField(
                  validator: (value) => value.length < 6 ? "Enter password" : null,
                  onChanged: (value){
                    setState(() {
                      password = value;
                    });
                  },
                  decoration: textInputDecoration.copyWith(labelText: "Password"),
                  obscureText: true,
                ),

                SizedBox(height:  20.0),

                RaisedButton(
                  child: Text('create account'),
                  onPressed: () async {

                    if(_formKey.currentState.validate()) {
                      authService.signUpEmail(email, password);
                    }
                  },
                ),

                SizedBox(height: 20.0,),

                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
