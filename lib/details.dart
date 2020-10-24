import 'package:flutter/material.dart';

import 'http.dart';

class Adminviewdetails extends StatefulWidget {
  final String role;
  final String id;
  Adminviewdetails({this.role,this.id});
  @override
  _AdminviewdetailsState createState() => _AdminviewdetailsState();
}

class _AdminviewdetailsState extends State<Adminviewdetails> {
  void initState(){
    super.initState();
    getApi();
  }
  getApi() async{
    if(widget.role=="Customer"){
      var result=await http_get("customerdetails/${widget.id}");
      setState(() {
        listtemp=result.data['list'];
        // print(result.data['list']);
        print(listtemp);
      });
    }
      else if(widget.role=="Delivers"){
      var result=await http_get("deliverdetails/${widget.id}");
      setState(() {
        listtemp=result.data['list'];
        // print(result.data['list']);
        print(listtemp);
      });
    }
      else if(widget.role=="Publication"){
      var result=await http_get("publicationdetails/${widget.id}");
      setState(() {
        listtemp=result.data['list'];
        // print(result.data['list']);
        print(listtemp);
      });
    }
  }
  customerdetails(){
    return Container(padding:EdgeInsets.all(20.0),
    
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
       Text('Customer Name:${listtemp[0]['customer_name']}',style:TextStyle(fontSize:20.0)),
       SizedBox(height:10.0),
       Text("Phone Number:${listtemp[0]['reg_mobile']}",style:TextStyle(fontSize: 20.0)),
       SizedBox(height:10.0),
        Text("Email:${listtemp[0]['email']}",style:TextStyle(fontSize: 20.0)),
       SizedBox(height:10.0),
        Text("Address:${listtemp[0]['address']}",style:TextStyle(fontSize: 20.0)),
       SizedBox(height:10.0),
        ],
      ),
    );
  }
  deliverdetails(){
    return Container(padding:EdgeInsets.all(20.0),
    
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
       Text('Deliver Name:${listtemp[0]['name']}',style:TextStyle(fontSize:20.0)),
       SizedBox(height:10.0),
       Text("Phone Number:${listtemp[0]['reg_mobile']}",style:TextStyle(fontSize: 20.0)),
       SizedBox(height:10.0),
        Text("Email:${listtemp[0]['email']}",style:TextStyle(fontSize: 20.0)),
       SizedBox(height:10.0),
        Text("Deliver Type:${listtemp[0]['deliver_type']}",style:TextStyle(fontSize: 20.0)),
       SizedBox(height:10.0),
       if(listtemp[0]['deliver_type']=="Delivery to agency")
       Text("Deliver Agency:${listtemp[0]['Agency_Name']}",style:TextStyle(fontSize: 20.0))
        ],
      ),
    );
  }
  publicationdetails(){
    return Container(padding:EdgeInsets.all(20.0),
    
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
       Text('Publication Name:${listtemp[0]['publication_name']}',style:TextStyle(fontSize:20.0)),
       SizedBox(height:10.0),
       Text("Price:${listtemp[0]['price']}",style:TextStyle(fontSize: 20.0)),
       SizedBox(height:10.0),
        Text("Language:${listtemp[0]['language']}",style:TextStyle(fontSize: 20.0)),
       SizedBox(height:10.0),
         Text("Category:${listtemp[0]['category']}",style:TextStyle(fontSize: 20.0)),
        ],
      ),
    );
  }
  List listtemp=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Details",style:TextStyle(fontSize:20.0),),backgroundColor: Colors.blueGrey[90],
      ),
      body:SafeArea(
              child: SingleChildScrollView(
          child:Column(mainAxisAlignment: MainAxisAlignment.center,children:<Widget>[
            if(widget.role=='Customer')customerdetails(),
            if(widget.role=='Delivers')deliverdetails(),
            if(widget.role=="Publication")publicationdetails(),
          ])
        ),
      )
    );
  }
}