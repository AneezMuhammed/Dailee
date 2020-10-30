import 'package:dailee/deliverAgency.dart';
import 'package:dailee/deliverytohome.dart';
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
      wholezoneid=preferences.getString('zoneid');
      wholeid=preferences.getString('id');
      wholerole=preferences.getString('role');
    });
    print(preferences.getString('id'));
    print(preferences.getString('role'));
    if(preferences.getString('id')!=null){
      print('hello');
      if(preferences.getString('role')=='Admin')
      {
         Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) =>Admin()),
        (Route<dynamic> route) => false);
    }
      
      else if(preferences.getString('role')=='Delivery to home')
      {
          Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) =>DeliveryHome()),
        (Route<dynamic> route) => false);
      }
      else if(preferences.getString('role')=='Deliver to agency'){
Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) =>Deliveragency()),
        (Route<dynamic> route) => false);
      }
    
   else if(preferences.getString('role')==null){
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) =>SignInScreen()),
        (Route<dynamic> route) => false); 
     }
     }
        
     
    else{
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) =>SignInScreen()),
        (Route<dynamic> route) => false); 
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