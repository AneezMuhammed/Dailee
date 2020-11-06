import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

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
    print(widget.role);
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
    }else if(widget.role=="Amount"){
      var result=await http_get("Amountadmindetails/${widget.id}");
      setState(() {
        listtemp=result.data['list'];
        a=result.data['amount'];

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
    setState(() {
      loading = false;
    });
  }
  customerdetails(){
    return Container(padding:EdgeInsets.all(20.0),
    width: double.maxFinite,
    
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
     Center(child: Row(children: <Widget>[ Icon(Icons.person,color: Colors.black), Text(' ${listtemp[0]['customer_name']}',style:TextStyle(fontSize:20.0)),],)),       SizedBox(height:10.0),
Divider(thickness: 1,color: Colors.black,),
      Text("Phone Number:${listtemp[0]['reg_mobile']}",style:TextStyle(fontSize: 20.0)),
       SizedBox(height:10.0),
    Text("Email:${listtemp[0]['email']}",style:TextStyle(fontSize:20)),
      
       SizedBox(height:10.0),
     Text("Address:${listtemp[0]['address']} jshddh sjhdhdjjs jsskks ",style:TextStyle(fontSize: 20.0)),
       SizedBox(height:10.0),
        ],
      ),
    );
  }
  deliverdetails(){
    return Container(padding:EdgeInsets.all(20.0),
  
      
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          
          Row(children:<Widget>[Icon(Icons.person),  textsuper(Colors.black, Colors.blueGrey[900]," ", "${listtemp[0]['name']}", 20, 20),])
,            Divider(thickness:1,color:Colors.black),
         
         SizedBox(height:10.0),
            textsuper(Colors.black, Colors.blueGrey[900],"Phone Number:", "${listtemp[0]['reg_mobile']}", 20, 20),

         
         SizedBox(height:10.0),
                     textsuper(Colors.black, Colors.blueGrey[900],"Email:", "${listtemp[0]['email']}", 20, 20),

         SizedBox(height:10.0),
                     textsuper(Colors.black, Colors.blueGrey[900],"Deliver Type:", "${listtemp[0]['deliver_type']}", 20, 20),

          
         SizedBox(height:10.0),
         if(listtemp[0]['deliver_type']=="Deliver to agency")
                     textsuper(Colors.black, Colors.blueGrey[900],"Agency:", " ${listtemp[0]['Agency_Name']}", 20, 20),
         
        
          ],
        ),
      )
           ;
  }

  textsuper(Color color1,Color color2,String s1,String s2,double f1,double f2){
 return   RichText(
              text: TextSpan(
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(fontWeight: FontWeight.normal),
                children: [
                  TextSpan(
                    text: s1,
                    style: TextStyle(
                       
                        color: color1,
                        fontSize: f1),
                  ),
                  TextSpan(
                  
                    text: s2,
                    style: TextStyle(
                        color: color2, fontSize: f2),
                  ),
                ],
              ),
            );
  }
  publicationdetails(){
    return   Column(crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment:MainAxisAlignment.start,
            children: <Widget>[
         Center(child: Icon(LineIcons.newspaper_o,size:60,color: Colors.blueGrey[900],)),
         Divider(
thickness: 1,
color: Colors.black,
      ),
           SizedBox(height:10.0),
         
           Text('Publication Name: ${listtemp[0]['publication_name']}',style:TextStyle(fontSize:20.0,
          ),),
           SizedBox(height:10.0),
          Row(children: <Widget>[Text("Price: ${listtemp[0]['price']}",style:TextStyle(fontSize: 18.0,)),],),
           SizedBox(height:10.0),
            Row(children:<Widget>[Text("Language:${listtemp[0]['language']}",style:TextStyle(fontSize: 18.0,)),]),
           SizedBox(height:10.0),
             Text("Category:${listtemp[0]['category']}",style:TextStyle(fontSize: 18.0,)),
             SizedBox(height:30),
            ],
         
       
    );
  }
  amountdetails(){
     return Container(child:Column(children: <Widget>[
       ListView.builder(
    shrinkWrap: true,
    
    itemCount: listtemp.length,
    itemBuilder:  (context, i) => InkWell(
      child: Container(
        padding:EdgeInsets.all(20.0),
        child:Row(crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text("${i+1}. ",style: TextStyle(fontSize:25,color:Colors.black )),
            // Icon(LineIcons.book,),
            Text(listtemp[i]['pub_Name'].toString(),style: TextStyle(fontSize:25,color:Colors.black ),),SizedBox(width:20),
            Text(listtemp[i]['quantity'].toString(),style: TextStyle(fontSize:20,color:Colors.black )),

          ],
        ),
        
      ),
      )),
      Divider(
thickness: 1,
color: Colors.black,
      ),
      Text("₹${a.toString()}",style: TextStyle(fontSize:25,color:Colors.red[900] ))
     ]
      // Container(
      //   child:Column(crossAxisAllignment:CrossAlignment.start),
      //   child:Text(a.toString())
      // )
      ));
    // return Container(padding:EdgeInsets.all(20.0),
    
    //   child: Column(crossAxisAlignment: CrossAxisAlignment.center,
    //     children: <Widget>[
    //    Text('Publication Name:${listtemp[0]['publication_name']}',style:TextStyle(fontSize:20.0)),
    //    SizedBox(height:10.0),
    //    Text("Price:${listtemp[0]['price']}",style:TextStyle(fontSize: 20.0)),
    //    SizedBox(height:10.0),
    //     Text("Language:${listtemp[0]['language']}",style:TextStyle(fontSize: 20.0)),
    //    SizedBox(height:10.0),
    //      Text("Category:${listtemp[0]['category']}",style:TextStyle(fontSize: 20.0)),
    //     ],
    //   ),
    // );
  }
 bool loading = true;
  List listtemp=[];
  var a;
  @override
  Widget build(BuildContext context) {
    return Dialog(shape: RoundedRectangleBorder(
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(15.0)),
                      ),child:Container(
      padding: EdgeInsets.all(20),
      constraints: BoxConstraints(maxHeight:300),
          child:ListView(children:<Widget>[
       
        
           getcall()
         
            
          ])
        ),
      
    );
  }
  getcall(){
      if(loading) return Center(child: CircularProgressIndicator());
      else{
if(widget.role=='Customer')return customerdetails();
            if(widget.role=='Delivers')return deliverdetails();
            if(widget.role=="Publication")return publicationdetails();
            if(widget.role=="Amount")return amountdetails();
      }
  }
}