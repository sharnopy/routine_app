// import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newroutine/models/task_model.dart';
// import 'package:newroutine/models/uesr_model.dart';

class FirebaseManager {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (task, _) {
        return task.tojson();
      },
    );
  }

  static Future<void> addTask(TaskModel task) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    task.id = docRef.id;
    return docRef.set(task);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime data) {
    return getTasksCollection()
        // .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("data", isEqualTo: data.millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> deleteTask(String taskId) {
    return getTasksCollection().doc(taskId).delete();
  }

  static upDate(TaskModel model) {
    getTasksCollection().doc(model.id).update(model.tojson());
  }

  static Future<void> createAccount(String frist, String last, String email,
      String password, Function onSuccess, Function onError) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // UserModel userModel = UserModel(
      //     id: credential.user!.uid, name: frist, email: email, lastname: last);
      // credential.user!.sendEmailVerification();
      // addUserToFireStore(userModel);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
      } else if (e.code == 'email-already-in-use') {
        // onError(e.message);
      }
    } catch (e) {
      print(e);
    }
  }



  static Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
