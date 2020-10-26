import 'package:flutter/material.dart';
import 'admin.dart';
import 'http.dart';
import 'messagerequest.dart';
class Requestdetails extends StatefulWidget {
  final String id;
  Requestdetails({this.id});
  @override

  _RequestdetailsState createState() => _RequestdetailsState();
}

class _RequestdetailsState extends State<Requestdetails> {
   void initState(){
    super.initState();
    getApi();
  }
  getApi()async{
    var res= await http_get("request2/${widget.id}");
    
    samplelist=res.data['list'];
    print(samplelist);

var result=await http_get("customerinrequestdetails/${samplelist[0]['customer_id']}");

      setState(() {
        examplelist=result.data['list'][0];
        newexamplelist=samplelist[0];
        print("gap");
        print(newexamplelist);
        print(examplelist);
      }
      );
  }
  ignorerequest() async{
    print("entered ignore request");
  var result= await http_get("ignorerequest/${widget.id}");
  if(result.data['code']==200){
    print("ignored");
    Navigator.pop(context);
  }
  // print("Again delete");
  }
  Map examplelist={};
  Map newexamplelist={};
   List samplelist=[];
   requestdetails(){
    return Container(padding:EdgeInsets.all(20.0),
    
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
       Text("Publication Name:${newexamplelist['name']}",style:TextStyle(fontSize:20.0)),
       SizedBox(height:10.0),
       Text("Customer Name:${examplelist['customer_name']}",style:TextStyle(fontSize: 20.0)),
       SizedBox(height:10.0),
        Text("Phone Number:${examplelist['reg_mobile']}",style:TextStyle(fontSize: 20.0)),
       SizedBox(height:10.0),
         Text("Category:${newexamplelist['category']}",style:TextStyle(fontSize: 20.0)),
         SizedBox(height: 10.0),
           Text("Language:${newexamplelist['language']}",style:TextStyle(fontSize: 20.0)),
         SizedBox(height: 10.0),
        Row( children:<Widget>[RaisedButton(child: Text('Accept',style: TextStyle(fontSize:10.0),), onPressed: () {
          ignorerequest();
        },),
        RaisedButton(child:Text('Deny',style: TextStyle(fontSize:10.0),), onPressed: () {
           Navigator.push(context,MaterialPageRoute(builder: (context)=>Messagetorequest()));
        },)
        ])
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Details",style:TextStyle(fontSize:20.0),),backgroundColor: Colors.blueGrey[90],
      ),
      // body:SafeArea(
              body: SafeArea(child:
              SingleChildScrollView(
          child:Column(mainAxisAlignment: MainAxisAlignment.center,children:<Widget>[
            requestdetails(),
          ])
        ),
              )
    );
  }
}
