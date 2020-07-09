import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kbgapp/services/database.dart';
import 'package:kbgapp/sharedCode/loadingIcon.dart';

// ignore: camel_case_types
class Admin_MemberProfile extends StatefulWidget {

  final String docID;

  Admin_MemberProfile({Key key, @required this.docID}) : super(key: key);

  @override
  _Admin_MemberProfileState createState() => _Admin_MemberProfileState(docID);
}

// ignore: camel_case_types
class _Admin_MemberProfileState extends State<Admin_MemberProfile> {

  String _docID;
  _Admin_MemberProfileState(this._docID);

  DatabaseService _databaseService = new DatabaseService();

  bool _loading = true;

  // variables for customers' data
  String _name, _surname, _phone, _secondPersonName, _secondPersonSurname;
  int _age, _secondPersonAge;
  double _weight, _secondPersonWeight;

  // variables for half day rental
  int _halfBoard, _halfEquipment, _halfHarness, _halfKiteBar, _halfPrice;
  bool _halfAuthorise = false;

  // variables for full day rental
  int _fullBoard, _fullEquipment, _fullHarness, _fullKiteBar, _fullPrice;
  bool _fullAuthorise = false;

  // variables for private lesson
  int _privateEightHours, _privateSixHours, _privateOneHours, _privatePrice, _privateTotalHours;
  String _privateSession;
  bool _privateAuthorise = false;

  // variables for group lesson
  int _groupEightHours, _groupSixHours, _groupOneHours, _groupPrice, _groupTotalHours;
  String _groupSession;
  bool _groupAuthorise = false;

  // dates
  DateTime _halfDate, _fullDate, _privateDate, _groupDate;

  Firestore _firestore = Firestore.instance;

  // gets customer data from firestore
  _getCustomerInfo() async {
    DocumentSnapshot snapshot =  await _firestore.collection('membership').document(_docID).get();
      setState(() {
        _loading = true;
        _name = snapshot['name'];
        _surname = snapshot['surname'];
        _phone = snapshot['phone number'];
        _age = snapshot['age'];
        _weight = snapshot['weight'];
        _loading = false;
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
      _halfAuthorise = snapshot['Rental Authorise'];
    });

  }

  // gets All Day Rentals data from firestore
  _getFullDayRentalData() async {
    DocumentSnapshot snapshot =  await _firestore.collection('All Day Rentals').document(_docID).get();
    snapshot == null ? null :
    setState(() {
      _fullBoard = snapshot['Board'];
      _fullEquipment = snapshot['Full Equipment'];
      _fullHarness = snapshot['Harness'];
      _fullKiteBar = snapshot['Kite N Bar'];
      _fullPrice = snapshot['Price(TL)'];
      Timestamp timestampFull = snapshot['Rental Date'];
      _fullDate = timestampFull.toDate();
      _fullAuthorise = snapshot['Rental Authorise'];
    });
  }

  // gets Private Lessons data from firestore
  _getPrivateLessonData() async {
    DocumentSnapshot snapshot =   _firestore.collection('Private Lessons').document(_docID).get() as DocumentSnapshot;
    _loading ? null :
    setState(() {
      _privateEightHours = snapshot['Eight Hours'];
      _privateOneHours = snapshot['One Hour'];
      _privatePrice = snapshot['Price'];
      _privateSession = snapshot['Session'];
      _privateSixHours = snapshot['Six Hours'];
      _privateTotalHours = snapshot['Total Hours'];
      Timestamp timestampPrivate = snapshot['Date'];
      _privateDate = timestampPrivate.toDate();
      _privateAuthorise = snapshot['Lesson Authorise'];
    });
  }

  // gets group Lessons data from firestore
  _getGroupLessonData() async {
    DocumentSnapshot snapshot =   _firestore.collection('Group Lessons').document(_docID).get() as DocumentSnapshot;
    snapshot == null ? null :
    setState(() {
      _groupEightHours = snapshot['Eight Hours'];
      _groupOneHours = snapshot['One Hour'];
      _groupPrice = snapshot['Price'];
      _groupSession = snapshot['Session'];
      _groupSixHours = snapshot['Six Hours'];
      _groupTotalHours = snapshot['Total Hours'];
      Timestamp timestampGroup = snapshot['Date'];
      _groupDate = timestampGroup.toDate();
      _secondPersonName = snapshot["Second Student Name"];
      _secondPersonSurname =snapshot["Second Student Surname"];
      _secondPersonAge = snapshot["Second Student Age"];
      _secondPersonWeight = snapshot["Second Student Age"];
      _groupAuthorise = snapshot['Lesson Authorise'];
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _getCustomerInfo();
      _getHalfDayRentalData();
      _getFullDayRentalData();
      _getPrivateLessonData();
      _getGroupLessonData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: _loading ? Loading() : Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card( // if all of the variables have a value show customer profile
                    child: _name == null && _surname == null && _phone == null && _age == null && _weight == null ? Text("User haven't give their personal information") : Column(
                      children: <Widget>[
                        Text("Customer Profile:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red),),
                        Text("Name: $_name", style: TextStyle(fontSize: 15),),
                        Text("Surname: $_surname", style: TextStyle(fontSize: 15),),
                        Text("Phone Number: $_phone", style: TextStyle(fontSize: 15),),
                        Text("Age: $_age", style: TextStyle(fontSize: 15),),
                        Text("Weight: $_weight", style: TextStyle(fontSize: 15),),
                      ],
                    ),
                  ),

                  // show half day rental information
                  Card(
                    color: _halfAuthorise == false ? Colors.grey : Colors.blue,
                    child: _halfBoard == null && _halfHarness == null && _halfPrice == null && _halfEquipment == null ? Text("Customer did not rent equipment for half a day", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),)
                        : Column(
                          children: <Widget>[
                            Text("Half Day Rental:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),),
                            _halfBoard == 0 ? Text("No board", style: TextStyle(fontSize: 15),) : Text("Number of Boards: $_halfBoard", style: TextStyle(fontSize: 15),),
                            _halfEquipment == 0 ? Text("No full equipment", style: TextStyle(fontSize: 15),) : Text("Full Equipments: $_halfEquipment", style: TextStyle(fontSize: 15),),
                            _halfHarness == 0 ? Text("No harness", style: TextStyle(fontSize: 15),) : Text("Harnesses: $_halfHarness", style: TextStyle(fontSize: 15),),
                            _halfKiteBar == 0 ? Text("No kite and bar", style: TextStyle(fontSize: 15),) : Text("Kite N Bar: $_halfKiteBar", style: TextStyle(fontSize: 15),),
                            Text("Price(TL): $_halfPrice"),
                            Text("$_halfDate"),
                            SizedBox(height: 10,),
                            Text(
                              "Authorise: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                              ),
                            ),
                            Checkbox(
                              value: _halfAuthorise,
                              onChanged: (bool value){
                                setState(() {
                                  _halfAuthorise = value;
                                  _databaseService.halfDayAuthorise(_halfAuthorise, _docID);
                                });
                              },
                            ),
                          ],
                        ),
                  ),

                  // show full day rental information
                  Card(
                    color: _fullAuthorise == false ? Colors.grey : Colors.blue,
                    child: _fullBoard == null && _fullHarness == null && _fullPrice == null && _fullEquipment == null ? Text("Customer did not rent equipment for full day", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),)
                        : Column(
                      children: <Widget>[
                        Text("Half Day Rental:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),),
                        _fullBoard == 0 ? Text("No board", style: TextStyle(fontSize: 15),) : Text("Number of Boards: $_fullBoard", style: TextStyle(fontSize: 15),),
                        _fullEquipment == 0 ? Text("No full equipment", style: TextStyle(fontSize: 15),) : Text("Full Equipments: $_fullEquipment", style: TextStyle(fontSize: 15),),
                        _fullHarness == 0 ? Text("No full equipment", style: TextStyle(fontSize: 15),) : Text("Harnesses: $_fullHarness", style: TextStyle(fontSize: 15),),
                        _fullKiteBar == 0 ? Text("No full equipment", style: TextStyle(fontSize: 15),) : Text("Kite N Bar: $_fullKiteBar", style: TextStyle(fontSize: 15),),
                        Text("Price(TL): $_fullPrice"),
                        Text("$_fullDate"),

                        SizedBox(height: 10,),
                        Text(
                          "Authorise: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                        Checkbox(
                          value: _fullAuthorise,
                          onChanged: (bool value){
                            setState(() {
                              _fullAuthorise = value;
                              _databaseService.fullDayAuthorise(_fullAuthorise, _docID);
                            });
                          },
                        ),
                      ],
                    ) ,
                  ),

                  // show private lesson
                  Card(
                    color: _privateAuthorise == false ? Colors.grey : Colors.blue,
                    child: _privateTotalHours == null && _privateSixHours == null  && _privateSession == null && _privatePrice == null && _privateOneHours == null && _privateEightHours == null && _privateDate == null ? Text("Customer did not buy any private lesson", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),)
                    : Column(
                      children: <Widget>[
                        Text("Private Lesson:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),),
                        _privateOneHours == 0 ? Text("No one hour", style: TextStyle(fontSize: 15),) : Text("One Hour Lessons: $_privateOneHours", style: TextStyle(fontSize: 15),),
                        _privateSixHours == 0 ? Text("No six hours", style: TextStyle(fontSize: 15),) : Text("Six Hours Lessons: $_privateSixHours", style: TextStyle(fontSize: 15),),
                        _privateEightHours == 0 ? Text("No eight hours", style: TextStyle(fontSize: 15),) : Text("Eight Hour Lessons: $_privateEightHours", style: TextStyle(fontSize: 15),),
                        Text("Total Hours: $_privateTotalHours"),
                        Text("Lesson Session: $_privateSession"),
                        Text("Price(TL): $_privatePrice"),
                        Text("$_privateDate"),

                        SizedBox(height: 10,),
                        Text(
                          "Authorise: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                        Checkbox(
                          value: _privateAuthorise,
                          onChanged: (bool value){
                            setState(() {
                              _privateAuthorise = value;
                              _databaseService.privateLessonAuthorise(_privateAuthorise, _docID);
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  // show Group Lesson
                  Card(
                    color: _groupAuthorise == false ? Colors.grey : Colors.blue,
                    child: _groupTotalHours == null && _groupSixHours == null  && _groupSession == null && _groupPrice == null && _groupOneHours == null && _groupEightHours == null && _groupDate == null ? Text("Customer did not buy any group lesson", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),)
                        : Column(
                      children: <Widget>[
                        Text("Private Lesson:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),),
                        _groupOneHours == 0 ? Text("No one hour", style: TextStyle(fontSize: 15),) : Text("One Hour Lessons: $_privateOneHours", style: TextStyle(fontSize: 15),),
                        _groupSixHours == 0 ? Text("No six hours", style: TextStyle(fontSize: 15),) : Text("Six Hours Lessons: $_privateSixHours", style: TextStyle(fontSize: 15),),
                        _groupEightHours == 0 ? Text("No eight hours", style: TextStyle(fontSize: 15),) : Text("Eight Hour Lessons: $_privateEightHours", style: TextStyle(fontSize: 15),),
                        Text("Total Hours: $_groupTotalHours"),
                        Text("Lesson Session: $_groupSession"),
                        Text("Price(TL): $_groupPrice"),
                        Text("$_groupDate"),

                        SizedBox(height: 10,),
                        Text(
                          "Authorise: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                        Checkbox(
                          value: _groupAuthorise,
                          onChanged: (bool value){
                            setState(() {
                              _groupAuthorise = value;
                              _databaseService.groupLessonAuthorise(_groupAuthorise, _docID);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

}
