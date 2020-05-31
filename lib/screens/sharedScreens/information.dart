import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kbgapp/sharedCode/textInpuDecoration.dart';


class Information extends StatelessWidget {

  String name, surname, email, phoneNumber;
  int age;
  double weight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: textInputDecoration.copyWith(labelText: "name"),
                validator: (value) => value.isEmpty ? "name" : null,
                onChanged: (value){
                  name = value;
                },
              ),

              SizedBox(height: 20,),

              TextFormField(
                decoration: textInputDecoration.copyWith(labelText: "surname"),
                validator: (value) => value.isEmpty ? "surname" : null,
                onChanged: (value){
                  surname = value;
                },
              ),

              SizedBox(height: 20,),

              TextFormField(
                decoration: textInputDecoration.copyWith(labelText: "email"),
                validator: (value) => value.isEmpty ? "email" : null,
                onChanged: (value){
                  email = value;
                },
              ),

              SizedBox(height: 20,),

              TextFormField(
                decoration: textInputDecoration.copyWith(labelText: "Phone"),
                validator: (value) => value.isEmpty ? "phone" : null,
                onChanged: (value){
                  phoneNumber = value;
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
                  age = int.parse(_value);
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
                  weight = double.parse(_value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
