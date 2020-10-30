import 'package:dailee/http.dart';
import 'package:dailee/messageSuccess.dart';
import 'package:flutter/material.dart';

class Messagetorequest extends StatefulWidget {
    final String id;
    
     final String req_id;
   Messagetorequest({this.id,this.req_id});
  @override
  _MessagetorequestState createState() => _MessagetorequestState();
}

class _MessagetorequestState extends State<Messagetorequest> {
  String a;
  void initState(){
    a=widget.id;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String message;
        return Scaffold(
           body: SafeArea(
                        child: Container(
               child: Column(
                children: <Widget>[
                  SizedBox(height: 50,),
                  // Padding(
                    // padding:EdgeInsets.all(8.0),
                    // child:
                    Padding(padding: const EdgeInsets.all(20.0),
                                  child: Text("Message Customers and do business",style:TextStyle(fontSize:35) ,
                  ),
                    ),
                  // ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) => message = value,
                  maxLines: 2,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(color: Colors.grey[800]),
                    hintText: "Enter the Message",
                    fillColor: Colors.white70,
                    // suffixIcon: IconButton(
                    //   icon: Icon(Icons.search),
                    //   onPressed: () {},
                    // ),
                  ),
                ),
          ),
         // &${widget.req_id}&$message
          RaisedButton(
                onPressed: ()async{
                  print("send aayo");
                  print(widget.req_id);
                  print(a);
                  var result=await http_post("replycustomer/$a&${widget.req_id}&$message");
                  if(result.data['code']==200){
                          await Navigator.push(context,MaterialPageRoute(builder: (context)=>Messagesuccess()));
                          Navigator.pop(context);
                  }
                },
                child: Text(
                  "Send",
                  style: TextStyle(fontSize: 20,color:Colors.white),),
                color: Colors.blueGrey[900],
          )
        ],
      ),
             ),
           ),
    );
  }
}