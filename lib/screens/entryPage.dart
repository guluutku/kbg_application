import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kbgapp/screens/Admin/adminHome.dart';
import 'package:kbgapp/screens/signUp.dart';
import 'package:kbgapp/screens/withAccount/accountHome.dart';
import 'package:kbgapp/services/authentication.dart';
import 'package:kbgapp/sharedCode/loadingIcon.dart';
import 'package:kbgapp/sharedCode/textInpuDecoration.dart';
import 'package:kbgapp/sharedCode/appBar.dart';
import 'anonymously/anonHome.dart';
import 'package:kbgapp/services/database.dart';

class EntryPage extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<EntryPage> {

  String name, surname, phoneNumber;
  int age = 0;
  double weight = 0.0;

  DatabaseService _databaseService = new DatabaseService();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = "";
  String password = "";
  String error = "";

  final AuthService _auth = AuthService();

  writeText(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[

              TextFormField(
                decoration: textInputDecoration.copyWith(labelText: "name"),
                validator: (value) => value.isEmpty ? "name" : null,
                onChanged: (value){
                  setState(() {
                    name = value;
                  });
                },
              ),

              SizedBox(height: 20,),

              TextFormField(
                decoration: textInputDecoration.copyWith(labelText: "surname"),
                validator: (value) => value.isEmpty ? "surname" : null,
                onChanged: (value){
                  setState(() {
                    surname = value;
                  });
                },
              ),

              SizedBox(height: 20,),

              TextField(
                decoration: textInputDecoration.copyWith(labelText: "Enter your age"),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                onChanged: (_value){
                  setState(() {
                    age = int.parse(_value);
                  });
                },
              ),

              SizedBox(height: 20,),

              TextField(
                decoration: textInputDecoration.copyWith(labelText: "Enter your weight"),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
                onChanged: (_value){
                  setState(() {
                    weight = double.parse(_value);
                  });
                },
              ),

              SizedBox(height: 20,),

              TextFormField(
                decoration: textInputDecoration.copyWith(labelText: "phone number"),
                validator: (value) => value.isEmpty ? "phone number" : null,
                onChanged: (value){
                  setState(() {
                    phoneNumber = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  userInfoDialog(BuildContext context){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Missing Info"),
        content: writeText(context),
        actions: <Widget>[
          RaisedButton(
            child: Text("PPP"),
            onPressed: (){
              setState(() {
                _databaseService.memberDataUpdate(name, surname, age, weight, phoneNumber);
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
        backgroundColor: Colors.brown[100],
        appBar: appBar,

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
                    validator: (value) => value.isEmpty ? "Enter email" : null,
                    onChanged: (value){
                      setState(() {
                        email = value;
                      });
                    },
                    decoration: textInputDecoration.copyWith(labelText: "Email"),
                  ),

                  /** password */
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

                  /** sign-in anonymously */
                  RaisedButton(
                    child: Text('sign in anon'),
                    onPressed: () async {
                      anonymous();
                    },
                  ),

                  // sign-in with e-mail
                  RaisedButton(
                    child: Text('sign-in'),
                    onPressed: () {
                      signIn();
                    }
                   ),

                  /** sign-up */
                  RaisedButton(
                    child: Text('sign-up'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
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
      Navigator.push(context, MaterialPageRoute(builder: (context) => AnonymousHomePage()));
    }
  }

  //log-in via e-mail
  void signIn() async {
    if (_formKey.currentState.validate()) {
      var firebaseUser = await FirebaseAuth.instance.currentUser();

      dynamic result = await _auth
          .signInEmail(email, password);

      if (result == null) {
        setState(() {
          loading = false;
          error = "Wrong email";
        });
      } else if(firebaseUser.uid == "aMDsuSJ9h6eIJuWX0SvwmXJTvTJ3"){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHome()));
      } else { // sends to account page
          var firebaseUser = await FirebaseAuth.instance.currentUser();
          final snapShot = await Firestore.instance.collection("membership")
              .document(firebaseUser.uid)
              .get();

          if(snapShot.exists){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AccountHome()));
          } else{
            userInfoDialog(context);
          }
      }
    }
  }
}