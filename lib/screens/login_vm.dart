import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:newroutine/screens/login_connector.dart';

class LoginViewModel extends ChangeNotifier {
  late LoginConnector loginConnector;

  Future<void> login(
    String email,
    String password,
  ) async {
    loginConnector.showLoading();
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      loginConnector.hideLoading();
      loginConnector.goToHome();
    } on FirebaseAuthException catch (e) {
      if (e.code == " INVALID_LOGIN_CREDENTIALS ") {
        loginConnector.hideLoading();
        loginConnector.showMessage("wrong Or Password");
      }
    }
  }
}
