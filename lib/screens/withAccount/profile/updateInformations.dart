import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kbgapp/services/database.dart';

import 'package:kbgapp/sharedCode/textInpuDecoration.dart';

class UpdateInformation extends StatefulWidget {
  @override
  _UpdateInformationState createState() => _UpdateInformationState();
}

class _UpdateInformationState extends State<UpdateInformation> {

  DatabaseService _databaseService = new DatabaseService();

  String _name, _surname, _phoneNumber;
  int _age = 0;
  double _weight = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Personal Information"),
        actions: <Widget>[
          FlatButton(
            child: Text("Change Information"),
            onPressed: (){
              setState(() {
                _databaseService.memberDataUpdate(_name, _surname, _age, _weight, _phoneNumber);
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
                onChanged: (value){
                  setState(() {
                    _name = value;
                  });
                },
              ),

              SizedBox(height: 20,),

              TextFormField(
                decoration: textInputDecoration.copyWith(labelText: "surname"),
                validator: (value) => value.isEmpty ? "surname" : null,
                onChanged: (value){
                  setState(() {
                    _surname = value;
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
                    _age = int.parse(_value);
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
                    _weight = double.parse(_value);
                  });
                },
              ),

              SizedBox(height: 20,),

              TextFormField(
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
}
