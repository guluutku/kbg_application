import 'package:flutter/material.dart';
import 'package:kbgapp/screens/Admin/adminHome.dart';
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
            icon: Icon(Icons.pan_tool),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pan_tool),
            title: Text("Members"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pan_tool),
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
