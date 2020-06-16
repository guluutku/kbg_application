import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'authentication.dart';
import 'package:kbgapp/modules/customers.dart';

class DatabaseService{

  final Customer customers;

  final String uid;
  final db = Firestore.instance;

  DatabaseService({this.uid, this.customers});

  final databaseReference = Firestore.instance;

  // collection reference
  final CollectionReference colRef = Firestore.instance.collection('membership');


  // update customer's data using uid while sign-in
  void memberDataUpdate(String name, String surname,  int age, double weight, String phoneNumber) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await databaseReference.collection("membership")
        .document(firebaseUser.uid).setData({
      'name': name,
      'surname': surname,
      'age': age,
      'weight': weight,
      'phone number': phoneNumber,
    });
  }

  // subCollection member half day rental
  void memberHalfDayRentalData(int full, int kiteBar, int board, int harness, int price, DateTime rentDate) async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await databaseReference.collection("membership").document(firebaseUser.uid).collection("Half Day Rentals").add({
      'Full Equipment': full,
      'Kite N Bar': kiteBar,
      'Board': board,
      'Harness': harness,
      'Price(TL)': price,
      'Rental Date': rentDate
    });
  }

  // subCollection member all day rental
  void memberAllDayRentalData(int full, int kiteBar, int board, int harness, int price, DateTime rentDate) async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await databaseReference.collection("membership").document(firebaseUser.uid).collection("All Day Rentals").add({
      'Full Equipment': full,
      'Kite N Bar': kiteBar,
      'Board': board,
      'Harness': harness,
      'Price(TL)': price,
      'Rental Date': rentDate
    });
  }

  // subCollection for member private lesson
  void memberPrivateLessonData(int hours, int oneHour, int sixHours, int eightHours, String session, int price, DateTime lessonDate) async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await databaseReference.collection("membership").document(firebaseUser.uid).collection("Private Lesson").add({
      'Total Hours': hours,
      'One Hour': oneHour,
      'Six Hours': sixHours,
      'Eight Hours': eightHours,
      'Session': session,
      'Price': price,
      'Date': lessonDate,
    });
  }

  // subCollection for member group lesson
  void memberGroupLessonData(int hours, int oneHour, int sixHours, int eightHours, String session, int price, DateTime lessonDate
      , String name, String surname, int age, double weight) async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await databaseReference.collection("membership").document(firebaseUser.uid).collection("Group Lesson").add({
      'Total Hours': hours,
      'One Hour': oneHour,
      'Six Hours': sixHours,
      'Eight Hours': eightHours,
      'Session': session,
      'Price': price,
      'Date': lessonDate,
      'Second Student': FieldValue.arrayUnion([name, surname, age, weight])
    });
  }

  // anonymous user's data
  void anonCustomerDataUpdate(String name, String surName, String email, int age, double weight, String phoneNumber) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await databaseReference.collection("anonymous")
        .document(firebaseUser.uid).setData({
      'name': name,
      'surname': surName,
      'e-mail': email,
      'age': age,
      'weight': weight,
      'phone number': phoneNumber,
    });
  }

  // subCollection for anonymous half day rental
  void anonHalfDayRentalData(int full, int kiteBar, int board, int harness, int price,DateTime rentDate) async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await databaseReference.collection("anonymous").document(firebaseUser.uid).collection("Half Day Rentals").add({
      'Full Equipment': full,
      'Kite N Bar': kiteBar,
      'Board': board,
      'Harness': harness,
      'Price(TL)': price,
      'Rental Date': rentDate
    });
  }

  // subCollection for anonymous all day rental
  void anonAllDayRentalData(int full, int kiteBar, int board, int harness, int price,DateTime rentDate) async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await databaseReference.collection("anonymous").document(firebaseUser.uid).collection("All Day Rentals").add({
      'Full Equipment': full,
      'Kite N Bar': kiteBar,
      'Board': board,
      'Harness': harness,
      'Price(TL)': price,
      'Rental Date': rentDate
    });
  }

  // subCollection for anonymous private lesson
  void anonPrivateLessonData(int hours, int oneHour, int sixHours, int eightHours, String session, int price, DateTime lessonDate) async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await databaseReference.collection("anonymous").document(firebaseUser.uid).collection("Private Lesson").add({
      'Total Hours': hours,
      'One Hour': oneHour,
      'Six Hours': sixHours,
      'Eight Hours': eightHours,
      'Session': session,
      'Price': price,
      'Date': lessonDate,
    });
  }

  // subCollection for anonymous group lesson
  void anonGroupLessonData(int hours, int oneHour, int sixHours, int eightHours, String session, int price, DateTime lessonDate) async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await databaseReference.collection("anonymous").document(firebaseUser.uid).collection("Group Lesson").add({
      'Total Hours': hours,
      'One Hour': oneHour,
      'Six Hours': sixHours,
      'Eight Hours': eightHours,
      'Session': session,
      'Price': price,
      'Date': lessonDate,
    });
  }

}