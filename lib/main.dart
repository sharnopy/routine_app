import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newroutine/provider/my_provider.dart';
import 'package:newroutine/screens/edit_screen.dart';
import 'package:newroutine/screens/home_screen.dart';
import 'package:newroutine/screens/LoginScreen.dart';
import 'package:newroutine/screens/sign_up.dart';
import 'package:newroutine/screens/splash_screen.dart';
import 'package:newroutine/tabs/list_tab.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        EditScreen.routeName: (context) => EditScreen(),
        ListTab.routeName: (context) => ListTab(),
        SignIn.routeName: (context) => SignIn(),
      },
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0XFF060E1E),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0XFF5D9CEC),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              // type: BottomNavigationBarType.shifting,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              selectedItemColor: Color(0XFF5D9CEC),
              unselectedItemColor: Colors.white)),
    );
  }
}
