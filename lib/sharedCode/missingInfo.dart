import 'package:flutter/material.dart';

void noSecondStudent(BuildContext context){
  var alertDialog = AlertDialog(
    title: Text("Warning!!!!"),
    content: Text("Please write information about second student in 'Add second student'"),
  );
  showDialog(
      context: context,
      builder: (BuildContext context){
        return alertDialog;
      }
  );
}

void noLesson(BuildContext context){
  var dialog = AlertDialog(
    title: Text("Warning!!!!"),
    content: Text("Please buy at least 1 lesson"),
  );
  showDialog(
      context: context,
      builder: (BuildContext context){
        return dialog;
      }
  );
}

void noInfo(BuildContext context){
  var dialog = AlertDialog(
    title: Text("Warning!!!!"),
    content: Text("Write all of the form"),
  );
  showDialog(
      context: context,
      builder: (BuildContext context){
        return dialog;
      }
  );
}

void noSession(BuildContext context){
  var dialog = AlertDialog(
    title: Text("Warning!!!!"),
    content: Text("Select a session"),
  );
  showDialog(
      context: context,
      builder: (BuildContext context){
        return dialog;
      }
  );
}

void noEquipment(BuildContext context){
  var dialog = AlertDialog(
    title: Text("Warning!!!!"),
    content: Text("Please choose at least 1 equipment to rent"),
  );
  showDialog(
      context: context,
      builder: (BuildContext context){
        return dialog;
      }
  );
}
