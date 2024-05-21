

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newroutine/models/task_model.dart';

class EditScreen extends StatefulWidget {
 static const String routeName="EditScreen";
  @override
  State<EditScreen> createState() => _EditScreenState();

}

class _EditScreenState extends State<EditScreen> {
  var selectedDate = DateTime.now();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final arg=ModalRoute.of(context)!.settings.arguments as TaskModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "EditTask ",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Card(
          color: Color(0XFF141922),
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).viewInsets.top),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 10),
                  Text(
                    "EditTask",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      label: Text(arg.title),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      label: Text(arg.description),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Text(
                    "Select Data ",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      selectData();
                    },
                    child: Text(
                      selectedDate.toString().substring(0, 10),
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.blue),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "HomeScreen");
                    },
                    child: Text(
                      "Save Changes",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );


  }
  selectData() async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate == null) {
      return;
    }
    selectedDate = chosenDate;
  }
}

