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

  final AuthService _authService = new AuthService();

  final _formKey = GlobalKey<FormState>();


  String _email;
  String _password1;
  String _password2;
  String _error = "";

  final _focus1 = new FocusNode();
  final _focus2 = new FocusNode();

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
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                  onFieldSubmitted: (v){
                    FocusScope.of(context).requestFocus(_focus1);
                  },
                  decoration: textInputDecoration.copyWith(labelText: "Email"),
                  validator: (value) => value.isEmpty ? "Enter email" : null,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value){
                    setState(() {
                      _email = value;
                    });
                  },
                ),

                SizedBox(height:  20.0),

                TextFormField(
                  focusNode: _focus1,
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                  onFieldSubmitted: (v){
                    FocusScope.of(context).requestFocus(_focus2);
                  },
                  validator: (value) => value.length < 6 ? "Enter password" : null,
                  onChanged: (value){
                    setState(() {
                      _password1 = value;
                    });
                  },
                  decoration: textInputDecoration.copyWith(labelText: "Password"),
                  obscureText: true,
                ),

                SizedBox(height:  20.0),

                TextFormField(
                  focusNode: _focus2,
                  validator: (value) => value.length < 6 ? "Enter password" : null,
                  onChanged: (value){
                    setState(() {
                      _password2 = value;
                    });
                  },
                  decoration: textInputDecoration.copyWith(labelText: "Password"),
                  obscureText: true,
                ),

                SizedBox(height:  20.0),

                RaisedButton(
                  child: Text('create account'),
                  onPressed: () async {
                    setState(() {
                      if(_formKey.currentState.validate()) {
                        _authService.signUpEmail(_email, _password1);
                        Navigator.of(context).pop(false);
                      } else{
                        _error = "Missing Information or not same password";
                      }
                    });
                  },
                ),

                SizedBox(height: 20.0,),

                Text(
                  _error,
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
