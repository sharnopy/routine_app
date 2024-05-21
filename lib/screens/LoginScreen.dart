import 'package:flutter/material.dart';
import 'package:newroutine/screens/home_screen.dart';
import 'package:newroutine/screens/login_connector.dart';
import 'package:newroutine/screens/login_vm.dart';
import 'package:newroutine/screens/sign_up.dart';
import 'package:newroutine/shared/firebase/firebase_manger.dart';
import 'package:provider/provider.dart';

import '../provider/my_provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginConnector {
  var EmailController = TextEditingController();

  var PasswordController = TextEditingController();

  LoginViewModel viewModel = LoginViewModel();

  @override
  void initState() {
    // TODO: implement initState
    viewModel.loginConnector=this;
  }
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // var provider=Provider.of<MyProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Login",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: EmailController,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      decoration: InputDecoration(
                        label: Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: PasswordController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        label: Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          viewModel.login(
                              EmailController.text, PasswordController.text);
                          // FirebaseManager.login(
                          //     EmailController.text, PasswordController.text, () {
                          //   // provider.intiUser();
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => HomeScreen(),
                          //       ));
                          // }, (error) {
                          //   showDialog(
                          //     barrierDismissible: false,
                          //     context: context,
                          //     builder: (context) => AlertDialog(
                          //       title: Text("Error"),
                          //       content: Text(error.toString()),
                          //       actions: [
                          //         ElevatedButton(
                          //             onPressed: () {
                          //               Navigator.pop(context);
                          //             },
                          //             child: Text("okey"))
                          //       ],
                          //     ),
                          //   );
                          // });
                        },
                        child: Text(
                          "LogIn",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignIn(),
                              ));
                        },
                        child: Text(
                          "SignUP",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  goToHome() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
  }

  @override
  hideLoading() {
    Navigator.pop(context);
  }

  @override
  showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  @override
  showMessage(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(message),
        actions: [
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("Okay"))
        ],
      ),
    );
  }
}
