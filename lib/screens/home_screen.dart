import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newroutine/shared/firebase/firebase_manger.dart';
import 'package:newroutine/tabs/list_tab.dart';
import 'package:newroutine/tabs/settings_tab.dart';
import 'package:provider/provider.dart';

import '../provider/my_provider.dart';
import 'flouting_press.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  int index = 0;

  Widget build(BuildContext context) {
    // var provider=Provider.of<MyProvider>(context);
    return Scaffold(
      body: tabs[index],
      appBar: AppBar(
        title: Text(
          "To Do",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Color(0XFF141922),
        notchMargin: 10,
        padding: EdgeInsets.only(bottom: 0),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 30,
                ),
                label: ""),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,

        ),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.black)),
        backgroundColor: Color(0XFF5D9CEC),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }

  showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddTaskBottomSheet(),
        );
      },
    );
  }

  List<Widget> tabs = [ListTab(), SettingsTab()];
}
