import 'package:flutter/material.dart';

import 'package:kbgapp/services/authentication.dart';

AuthService _authService = new AuthService();

FlatButton logout = FlatButton.icon(
  icon: Icon(Icons.close),
  label: Text("Log Out"),
  onPressed: () async{
    await _authService.logOut();
  },
);