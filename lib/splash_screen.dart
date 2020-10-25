import 'package:dailee/main.dart';
import 'package:dailee/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'admin.dart';
import 'customer.dart';
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState(){
    anime();
    super.initState();
  }
  anime() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      wholeid=preferences.getString('id');
      wholerole=preferences.getString('role');
    });

    if(preferences.getString('id')!=null){
      if(preferences.getString('role')=='Admin')
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin()));
      
    }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen())); 
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: CircularProgressIndicator(
        
      ),)
    );
  }
}