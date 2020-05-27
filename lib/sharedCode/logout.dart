import 'package:flutter/material.dart';
import 'package:kbgapp/services/authentication.dart';

AuthService _authService = new AuthService();

FlatButton logout = FlatButton.icon(
  icon: Icon(Icons.person),
  label: Text("logout"),
  onPressed: () async{
    await _authService.signOut();
  },
);