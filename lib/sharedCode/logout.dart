import 'package:flutter/material.dart';

import 'package:kbgapp/services/authentication.dart';

class LogOut extends StatelessWidget{

  AuthService _authService = new AuthService();

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      icon: Icon(Icons.close),
      label: Text("Log Out"),
      onPressed: () async{
        await _authService.logOut();
        Navigator.of(context).pop(false);
      },
    );
  }

}
