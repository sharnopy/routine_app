// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/widgets.dart';
// import 'package:newroutine/models/uesr_model.dart';
// import 'package:newroutine/shared/firebase/firebase_manger.dart';
//
// class MyProvider extends ChangeNotifier {
//   UserModel? userModel;
//   User? firebaseUser;
//
//   MyProvider() {
//     firebaseUser = FirebaseAuth.instance.currentUser;
//     if (firebaseUser != null) {
//       intiUser();
//     }
//   }
//
//   intiUser() async {
//     firebaseUser=FirebaseAuth.instance.currentUser;
//     userModel = await FirebaseManager.readUser(firebaseUser!.uid);
//     notifyListeners();
//   }
// }
