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
  final CollectionReference colRef = Firestore.instance.collection('deneme');

  // update customer's data using uid while sign-in
  void customerDataUpdate(String name, int age, double weight) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await databaseReference.collection("deneme")
        .document(firebaseUser.uid).setData({
      'name': name,
      'age': age,
      'weight': weight,
    });
  }

  // anonymous user's data
  void anonCustomerDataUpdate(String name, String surName, String email, int age, double weight, String phoneNumber) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await databaseReference.collection("anonim")
        .document(firebaseUser.uid).setData({
      'name': name,
      'surname': surName,
      'e-mail': email,
      'age': age,
      'weight': weight,
      'phone number': phoneNumber,
    });
  }

  // subCollection for anonymous rental
  void anonRentalData(int full, int kiteBar, int board, int harness, int price, String dayType, DateTime rentDate) async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await databaseReference.collection("anonim").document(firebaseUser.uid).collection("Rentals").add({
      'Full Equipment': full,
      'Kite N Bar': kiteBar,
      'Board': board,
      'Harness': harness,
      'Price(TL)': price,
      'Rent Type': dayType,
      'Rental Date': rentDate
    });
  }

}