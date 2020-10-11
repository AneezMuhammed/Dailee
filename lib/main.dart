import 'package:flutter/material.dart';
import 'package:dailee/sign_in_screen.dart';

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
      home: SignInScreen(),
    );
  }
}
