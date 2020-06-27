import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Admin_AnonProfile extends StatefulWidget {

  final String docID;

  Admin_AnonProfile({Key key, @required this.docID}) : super(key: key);

  @override
  _Admin_AnonProfileState createState() => _Admin_AnonProfileState(docID);
}

class _Admin_AnonProfileState extends State<Admin_AnonProfile> {

  String _docID;
  _Admin_AnonProfileState(this._docID);

  // variables for customers' data
  String _name, _surname, _phone, _secondPersonName, _secondPersonSurname, _email;
  int _age, _secondPersonAge;
  double _weight, _secondPersonWeight;

  // variables for half day rental
  int _halfBoard, _halfEquipment, _halfHarness, _halfKiteBar, _halfPrice;

  // variables for full day rental
  int _fullBoard, _fullEquipment, _fullHarness, _fullKiteBar, _fullPrice;

  // variables for private lesson
  int _privateEightHours, _privateSixHours, _privateOneHours, _privatePrice, _privateTotalHours;
  String _privateSession;

  // variables for group lesson
  int _groupEightHours, _groupSixHours, _groupOneHours, _groupPrice, _groupTotalHours;
  String _groupSession;
  List _secondStudentList = [];

  // dates
  DateTime _halfDate, _fullDate, _privateDate, _groupDate;

  Firestore _firestore = Firestore.instance;

  // gets customer data from firestore
  _getCustomerInfo() async {
    DocumentSnapshot snapshot =  await _firestore.collection('anonymous').document(_docID).get();
    setState(() {
      _name = snapshot['name'];
      _surname = snapshot['surname'];
      _phone = snapshot['phone number'];
      _age = snapshot['age'];
      _weight = snapshot['weight'];
      _email = snapshot['e-mail'];
    });
  }

  // gets Half Day Rentals data from firestore
  _getHalfDayRentalData() async {
    DocumentSnapshot snapshot =  await _firestore.collection('Half Day Rentals').document(_docID).get();
    setState(() {
      _halfBoard = snapshot['Board'];
      _halfEquipment = snapshot['Full Equipment'];
      _halfHarness = snapshot['Harness'];
      _halfKiteBar = snapshot['Kite N Bar'];
      _halfPrice = snapshot['Price(TL)'];
      Timestamp timestampHalf = snapshot['Rental Date'];
      _halfDate = timestampHalf.toDate();
    });
  }

  // gets All Day Rentals data from firestore
  _getFullDayRentalData() async {
    DocumentSnapshot snapshot =  await _firestore.collection('All Day Rentals').document(_docID).get();
    setState(() {
      _fullBoard = snapshot['Board'];
      _fullEquipment = snapshot['Full Equipment'];
      _fullHarness = snapshot['Harness'];
      _fullKiteBar = snapshot['Kite N Bar'];
      _fullPrice = snapshot['Price(TL)'];
      Timestamp timestampFull = snapshot['Rental Date'];
      _fullDate = timestampFull.toDate();
    });
  }

  // gets Private Lessons data from firestore
  _getPrivateLessonData() async {
    DocumentSnapshot snapshot =  await _firestore.collection('Private Lessons').document(_docID).get();
    setState(() {
      _privateEightHours = snapshot['Eight Hours'];
      _privateOneHours = snapshot['One Hour'];
      _privatePrice = snapshot['Price'];
      _privateSession = snapshot['Session'];
      _privateSixHours = snapshot['Six Hours'];
      _privateTotalHours = snapshot['Total Hours'];
      _secondStudentList = snapshot['Second Student'];
      Timestamp timestampPrivate = snapshot['Date'];
      _privateDate = timestampPrivate.toDate();
    });
  }

  @override
  void initState() {
    super.initState();
    _getCustomerInfo();
    _getHalfDayRentalData();
    _getFullDayRentalData();
    _getPrivateLessonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card( // if all of the variables have a value show customer profile
              child: _name == null && _surname == null && _phone == null && _age == null && _weight == null ? Text("laaaa") : Column(
                children: <Widget>[
                  Text("Customer Profile:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red),),
                  Text("Name: $_name"),
                  Text("Surname: $_surname"),
                  Text("Phone Number: $_phone"),
                  Text("Age: $_age"),
                  Text("Weight: $_weight"),
                ],
              ),
            ),

            // show half day rental information
            Card(
              child: _halfBoard == null && _halfHarness == null && _halfPrice == null && _halfEquipment == null ? Text("NOOOOOO")
                  : Column(
                children: <Widget>[
                  Text("Half Day Rental:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red),),
                  _halfBoard == 0 ? Text("No board") : Text("Number of Boards: $_halfBoard"),
                  _halfEquipment == 0 ? Text("No full equipment") : Text("Full Equipments: $_halfEquipment"),
                  _halfHarness == 0 ? Text("No full equipment") : Text("Harnesses: $_halfHarness"),
                  _halfKiteBar == 0 ? Text("No full equipment") : Text("Kite N Bar: $_halfKiteBar"),
                  Text("Price(TL): $_halfPrice"),
                  Text("$_halfDate"),
                ],
              ) ,
            ),

            // show full day rental information
            Card(
              child: _fullBoard == null && _fullHarness == null && _fullPrice == null && _fullEquipment == null ? Text("NOOOOOO")
                  : Column(
                children: <Widget>[
                  Text("Half Day Rental:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red),),
                  _fullBoard == 0 ? Text("No board") : Text("Number of Boards: $_fullBoard"),
                  _fullEquipment == 0 ? Text("No full equipment") : Text("Full Equipments: $_fullEquipment"),
                  _fullHarness == 0 ? Text("No full equipment") : Text("Harnesses: $_fullHarness"),
                  _fullKiteBar == 0 ? Text("No full equipment") : Text("Kite N Bar: $_fullKiteBar"),
                  Text("Price(TL): $_fullPrice"),
                  Text("$_fullDate"),
                ],
              ) ,
            ),

            // show private lesson
            Card(
              child: _privateTotalHours == null && _privateSixHours == null  && _privateSession == null && _privatePrice == null && _privateOneHours == null && _privateEightHours == null && _privateDate == null ? Text("Loading")
                  : Column(
                children: <Widget>[
                  Text("Half Day Rental:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red),),
                  _privateOneHours == 0 ? Text("No board") : Text("One Hour Lessons: $_privateOneHours"),
                  _privateSixHours == 0 ? Text("No full equipment") : Text("Six Hours Lessons: $_privateSixHours"),
                  _privateEightHours == 0 ? Text("No full equipment") : Text("Eight Hour Lessons: $_privateEightHours"),
                  Text("Total Hours: $_privateTotalHours"),
                  Text("Lesson Session: $_privateSession"),
                  Text("Price(TL): $_privatePrice"),
                  Text("$_privateDate"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
