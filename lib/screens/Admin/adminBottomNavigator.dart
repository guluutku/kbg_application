import 'package:flutter/material.dart';

import 'package:kbgapp/screens/Admin/teacherCheckList.dart';
import 'package:kbgapp/screens/Admin/forAnonymous/admin_AnonHome.dart';
import 'package:kbgapp/screens/Admin/forMembers/admin_MembersHome.dart';

class AdminBottomNavigator extends StatefulWidget {
  @override
  _AdminBottomNavigatorState createState() => _AdminBottomNavigatorState();
}

class _AdminBottomNavigatorState extends State<AdminBottomNavigator> {

  int _currentIndex = 0;

  final tabs = [
    AdminHome(),
    Admin_MembersHome(),
    Admin_AnonHome(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.brown,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            title: Text("Teacher Checklist"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text("Members"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text("Anonymous"),
          )
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
