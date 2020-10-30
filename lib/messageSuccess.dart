import 'dart:async';

import 'package:flutter/material.dart';

class Messagesuccess extends StatefulWidget {
  @override
  _MessagesuccessState createState() => _MessagesuccessState();
}

class _MessagesuccessState extends State<Messagesuccess> {
  onclosed(){
    Navigator.pop(context);
  }
  void initState(){

    super.initState();
    new Timer(const Duration(seconds: 3), onclosed);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child:Padding(padding:EdgeInsets.all(10.0),
      
      child:Column(crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(child:Image.asset("assets/Shopify Checkout - Thank You.gif"),height: 400,)
      
// SizedBox(child:Text("Message Successfully send",style: TextStyle(fontSize: 50.0),),),
//      SizedBox(height:10.0 ,) ,
//      RaisedButton(child:Text("Go back",style: TextStyle(fontSize: 10.0),) ,onPressed: (){  Navigator.pop(context);},)
      ]
      ),
   
    )) );
  }
}