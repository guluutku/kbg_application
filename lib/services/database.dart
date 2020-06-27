import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'authentication.dart';
import 'package:kbgapp/modules/customers.dart';

class DatabaseService{

  final Customer customers;

  final String uid;

  DatabaseService({this.uid, this.customers});

  final databaseReference = Firestore.instance;
  final CollectionReference userCollection = Firestore.instance.collection('membership');

  // anonymous user's data to firestore
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

  // update customer's data using uid while sign-in to firestore
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

  // update Half Day Rentals Collection to firestore
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

  // update All Day Rentals Collection to firestore
  void allDayRentalData(int full, int kiteBar, int board, int harness, int price, DateTime rentDate) async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await databaseReference.collection("All Day Rentals").document(firebaseUser.uid).setData({
      'Full Equipment': full,
      'Kite N Bar': kiteBar,
      'Board': board,
      'Harness': harness,
      'Price(TL)': price,
      'Rental Date': rentDate
    });
  }

  // update Private Lessons Collection to firestore
  void privateLessonData(int hours, int oneHour, int sixHours, int eightHours, String session, int price, DateTime lessonDate) async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await databaseReference.collection("Private Lessons").document(firebaseUser.uid).setData({
      'Total Hours': hours,
      'One Hour': oneHour,
      'Six Hours': sixHours,
      'Eight Hours': eightHours,
      'Session': session,
      'Price': price,
      'Date': lessonDate,
    });
  }

  // update Group Lessons Collection to firestore
  void groupLessonData(int hours, int oneHour, int sixHours, int eightHours, String session, int price, DateTime lessonDate
      , String name, String surname, int age, double weight) async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await databaseReference.collection("Group Lessons").document(firebaseUser.uid).setData({
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

  // delete an account document
  Future deleteUser() {
    return userCollection.document(uid).delete();
  }

}