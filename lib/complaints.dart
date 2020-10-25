import 'package:flutter/material.dart';

import 'admin.dart';
import 'http.dart';

class Complaints extends StatefulWidget {
  final String id;
  Complaints({this.id});
  @override
  _ComplaintsState createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  void initState(){
    getApi();
    super.initState();
  }
    
  getApi()async{
    var res= await http_get("complaint2/${widget.id}");
    
    samplelist=res.data['list'];
    print(samplelist);
  var result=await http_get("customercomplaints/${samplelist[0]['customer_id']}");
  setState(() {
        examplelist=result.data['list'][0];
        newexamplelist=samplelist[0];
        print("gap");
        print(newexamplelist);
        print(examplelist);
      }
      );
}
deletecomplaint()async{
  print("entered delete complaint");
  var result= await http_get("ignorecomplaint/${widget.id}");
  if(result.data['code']==200){
    print("Deleted");
    Navigator.pop(context);
  }
  print("Again delete");
}
getbuilder(){
return Container(padding:EdgeInsets.all(20.0),
    
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
      
       Text("Customer Name:${examplelist['customer_name']}",style:TextStyle(fontSize: 20.0)),
       SizedBox(height:10.0),
        Text("Complaint:${newexamplelist['complaint_text']}",style:TextStyle(fontSize:20.0)),
       SizedBox(height:10.0),
        Text("Email:${examplelist['email']}",style:TextStyle(fontSize: 20.0)),
      //  SizedBox(height:10.0),
       new SizedBox(width:50.0,height:50.0,child:RaisedButton(child: Text('Mark as Viewed',style: TextStyle(fontSize:10.0),), onPressed: () {deletecomplaint();},))
        //  Text("Category:${newexamplelist['category']}",style:TextStyle(fontSize: 20.0)),
        //  SizedBox(height: 10.0),
        //    Text("Language:${newexamplelist['language']}",style:TextStyle(fontSize: 20.0)),
        //  SizedBox(height: 10.0),
        // Row( children:<Widget>[RaisedButton(child: Text('Accept',style: TextStyle(fontSize:10.0),), onPressed: () {},),
        // RaisedButton(child:Text('Deny',style: TextStyle(fontSize:10.0),), onPressed: () {
        //    Navigator.push(context,MaterialPageRoute(builder: (context)=>Messagetorequest()));
        // },)
        ]),
        
      
    );
}
  Map examplelist={};
  Map newexamplelist={};
   List samplelist=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Details",style:TextStyle(fontSize:20.0),),backgroundColor: Colors.blueGrey[90],
      ),
      // body:SafeArea(
              body: SafeArea(child:
              SingleChildScrollView(
          child:Column(mainAxisAlignment: MainAxisAlignment.center,children:<Widget>[
            getbuilder(),
          ])
        ),
              )
    );
  }
}