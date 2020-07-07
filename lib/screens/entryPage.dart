import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kbgapp/screens/Admin/adminBottomnavigator.dart';
import 'package:kbgapp/screens/signUp.dart';
import 'package:kbgapp/screens/withAccount/accountHome.dart';
import 'package:kbgapp/services/authentication.dart';
import 'package:kbgapp/sharedCode/loadingIcon.dart';
import 'package:kbgapp/sharedCode/textInpuDecorations.dart';
import 'anonymously/anonHome.dart';
import 'package:kbgapp/services/database.dart';

class EntryPage extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<EntryPage> {

  final _focus = FocusNode();
  final _focus1 = FocusNode();
  final _focus2 = FocusNode();
  final _focus3 = FocusNode();
  final _focus4 = FocusNode();

  String _name, _surname, _phoneNumber;
  int _age = 0;
  double _weight = 0.0;

  DatabaseService _databaseService = new DatabaseService();

  final _formKey = GlobalKey<FormState>();

  String _email = "";
  String _password = "";

  bool _wrongEmail, _wrongPassword;

  final AuthService _auth = AuthService();

  _writeText(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[

              TextFormField(
                textInputAction: TextInputAction.next,
                autofocus: true,
                onFieldSubmitted: (v){
                  FocusScope.of(context).requestFocus(_focus1);
                },
                decoration: textInputDecoration.copyWith(labelText: "Enter your name"),
                validator: (value) => value.isEmpty ? "name" : null,
                onChanged: (value){
                  setState(() {
                    _name = value;
                  });
                },
              ),

              SizedBox(height: 20,),

              TextFormField(
                focusNode: _focus1,
                textInputAction: TextInputAction.next,
                autofocus: true,
                onFieldSubmitted: (v){
                  FocusScope.of(context).requestFocus(_focus2);
                },
                decoration: textInputDecoration.copyWith(labelText: "Enter your surname"),
                validator: (value) => value.isEmpty ? "surname" : null,
                onChanged: (value){
                  setState(() {
                    _surname = value;
                  });
                },
              ),

              SizedBox(height: 20,),

              TextFormField(
                focusNode: _focus2,
                textInputAction: TextInputAction.next,
                autofocus: true,
                onFieldSubmitted: (v){
                  FocusScope.of(context).requestFocus(_focus3);
                },
                decoration: textInputDecoration.copyWith(labelText: "Enter your age"),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                onChanged: (_value){
                  setState(() {
                    _age = int.parse(_value);
                  });
                },
              ),

              SizedBox(height: 20,),

              TextFormField(
                focusNode: _focus3,
                textInputAction: TextInputAction.next,
                autofocus: true,
                onFieldSubmitted: (v){
                  FocusScope.of(context).requestFocus(_focus4);
                },
                decoration: textInputDecoration.copyWith(labelText: "Enter your weight"),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
                onChanged: (_value){
                  setState(() {
                    _weight = double.parse(_value);
                  });
                },
              ),

              SizedBox(height: 20,),

              TextFormField(
                focusNode: _focus4,
                decoration: textInputDecoration.copyWith(labelText: "phone number"),
                validator: (value) => value.isEmpty ? "phone number" : null,
                onChanged: (value){
                  setState(() {
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

  _userInfoDialog(BuildContext context){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Missing Info"),
        content: _writeText(context),
        actions: <Widget>[
          RaisedButton(
            child: Text("Save"),
            onPressed: (){
              setState(() {
                _databaseService.memberDataUpdate(_name, _surname, _age, _weight, _phoneNumber);
                Navigator.push(context, MaterialPageRoute(builder: (context) => AccountHome()));
              });
            },
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
        ),

        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[

                  Image.asset('assets/images/kbgLogo.png'),

                  /** e-mail */
                  SizedBox(height:  20.0),
                  TextFormField(
                    validator: (value) => _wrongEmail == true ? "Invalid Email" : null,
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                    onFieldSubmitted: (v){
                      FocusScope.of(context).requestFocus(_focus);
                    },
                    onChanged: (value){
                      setState(() {
                        _email = value;
                      });
                    },
                    decoration: textInputDecoration.copyWith(labelText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                  ),

                  /** password */
                  SizedBox(height:  20.0),
                  TextFormField(
                    focusNode: _focus,
                    validator: (value) => value.length < 6 || _wrongPassword == true ? "Invalid Password" : null,
                    onChanged: (value){
                      setState(() {
                        _password = value;
                      });
                    },

                    decoration: textInputDecoration.copyWith(labelText: "Password"),
                    obscureText: true,
                  ),

                  SizedBox(height: 20,),

                  // sign-in with e-mail
                  SizedBox(
                    height: 50,
                    child: RaisedButton(
                        child: Text("Log-in with an account"),
                        color: Colors.blueAccent[200],
                        onPressed: () {
                          signIn();
                          },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)
                        ),
                    ),
                  ),

                  SizedBox(height: 20,),

                  /** sign-in anonymously */
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      child: Text(
                       "Don't have an account? Log-in as anonymous",
                      ),
                      onPressed: () async {
                        Loading();
                        anonymous();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),

                  /** sign-up */
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FlatButton(
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      child: Text(
                        "Don't have an account? Sign-up for free",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      color: Colors.blueAccent[200],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );

  }

  // log-in anonymously
  Future<void> anonymous() async {
    dynamic result = await _auth.signInAnon();
    if(result == null){
      print('error signing in');
    } else {
      Loading();
      Navigator.push(context, MaterialPageRoute(builder: (context) => AnonymousHomePage()));
    }
  }

  //log-in via e-mail
  void signIn() async {
    if (_formKey.currentState.validate()) {

      dynamic result = await _auth.signInEmail(_email, _password);
      var firebaseUser = await FirebaseAuth.instance.currentUser();
      Loading();
      if (result == null) { // if email is false
        setState(() {
          _wrongPassword = true;
          _wrongEmail = true;
        });
      } else if(firebaseUser.uid == "aMDsuSJ9h6eIJuWX0SvwmXJTvTJ3"){ // tried to find admin with its uid
          Navigator.push(context, MaterialPageRoute(builder: (context) => AdminBottomNavigator()));
      } else { // sends to account page
          var firebaseUser = await FirebaseAuth.instance.currentUser();
          final snapShot = await Firestore.instance.collection("membership")
              .document(firebaseUser.uid)
              .get();

          if(snapShot.exists){ // if user has a collection, go to user screens
            Navigator.push(context, MaterialPageRoute(builder: (context) => AccountHome()));
          } else{ // if user doesn't have any collection, pop-up a dialog
            _userInfoDialog(context);
          }
      }
    }
  }
}