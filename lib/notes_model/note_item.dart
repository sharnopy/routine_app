import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:newroutine/models/task_model.dart';
import 'package:newroutine/screens/edit_screen.dart';
import 'package:newroutine/shared/firebase/firebase_manger.dart';

class NoteItem extends StatelessWidget {
  TaskModel task;

  NoteItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        color: Color(0XFF141922),
        child: Slidable(
          closeOnScroll: true,
          startActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  FirebaseManager.deleteTask(task.id);
                },
                backgroundColor: Colors.red,
                label: "Delete",
                icon: Icons.delete,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    topRight: Radius.circular(12)),
              ),
              SlidableAction(
                onPressed: (context) {
                  Navigator.pushNamed(context, "EditScreen",
                      arguments: TaskModel(
                        description: task.description,
                        data: task.data,
                        title: task.title,
                        id: task.id,
                        isDone: task.isDone,
                      ));
                },
                backgroundColor: Colors.blue,
                label: "Edit",
                icon: Icons.edit,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    topLeft: Radius.circular(12)),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(
              //   width: 10,
              // ),
              Container(
                height: 80,
                width: 5,
                color: Colors.blue,
              ),
              // SizedBox(
              //   width: 10,
              // ),
              Column(
                children: [
                  Text(
                    task.title,
                    style: TextStyle(fontSize: 20, color: Color(0XFF5D9CEC)),
                  ),
                  Text(
                    task.description,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),

              InkWell(
                onTap: () {
                  task.isDone = true;
                  FirebaseManager.upDate(task);
                },
                child: Container(
                  child: task.isDone
                      ? Text(
                          "IsDone",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      : Icon(
                          Icons.done,
                          color: Color(0XFF5D9CEC),
                          size: 30,
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
