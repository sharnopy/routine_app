import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:newroutine/screens/home_screen.dart';
import 'package:newroutine/screens/LoginScreen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "SplashScreen";

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset("assets/images/logo.png"),
      nextScreen: LoginScreen(),
      backgroundColor: Color(0XFF060E1E),
      splashIconSize: 150,
    );
  }
}
