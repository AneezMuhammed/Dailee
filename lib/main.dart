import 'package:dailee/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:dailee/sign_in_screen.dart';
import 'package:dailee/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dailee',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        //  visualDensity :VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
    );
  }
}
String wholerole;
String wholeid;
String wholezoneid;
