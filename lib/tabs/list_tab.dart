import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newroutine/notes_model/note_item.dart';
import 'package:newroutine/shared/firebase/firebase_manger.dart';

import '../models/task_model.dart';

class ListTab extends StatefulWidget {
  static const String routeName="ListTab";
  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  DateTime selectedData = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          CalendarTimeline(
            initialDate: selectedData,
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime.now().add(const Duration(days: 365)),
            onDateSelected: (date) {
              selectedData = date;
              setState(() {});
            },
            leftMargin: 20,
            monthColor: Colors.blueGrey,
            dayColor: Colors.teal[200],
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Colors.redAccent[100],
            dotsColor: Color(0xFF333A47),
            // selectableDayPredicate: (date) => date.day != 23,
            locale: 'en_ISO',
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot<TaskModel>>(
            stream: FirebaseManager.getTasks(selectedData),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }
              var tasks =
                  snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];
              return ListView.builder(
                itemBuilder: (context, index) {
                  return NoteItem(tasks[index]);
                },
                itemCount: tasks.length,
              );
            },
          )),
        ],
      ),
    );
  }
}
