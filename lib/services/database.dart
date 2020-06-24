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
  void halfDayRentalData(int full, int kiteBar, int board, int harness, int price, DateTime rentDate) async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await databaseReference.collection("Half Day Rentals").document(firebaseUser.uid).setData({
      'Full Equipment': full,
      'Kite N Bar': kiteBar,
      'Board': board,
      'Harness': harness,
      'Price(TL)': price,
      'Rental Date': rentDate
    });
  }

  // subCollection member all day rental
  void allDayRentalData(int full, int kiteBar, int board, int harness, int price, DateTime rentDate) async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await databaseReference.collection("All Day Rental").document(firebaseUser.uid).setData({
      'Full Equipment': full,
      'Kite N Bar': kiteBar,
      'Board': board,
      'Harness': harness,
      'Price(TL)': price,
      'Rental Date': rentDate
    });
  }

  // subCollection for member private lesson
  void privateLessonData(int hours, int oneHour, int sixHours, int eightHours, String session, int price, DateTime lessonDate) async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await databaseReference.collection("Private Lesson").document(firebaseUser.uid).setData({
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
  void groupLessonData(int hours, int oneHour, int sixHours, int eightHours, String session, int price, DateTime lessonDate
      , String name, String surname, int age, double weight) async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await databaseReference.collection("Group Lesson").document(firebaseUser.uid).setData({
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



}