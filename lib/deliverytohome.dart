import 'package:dailee/profileedit.dart';
import 'package:flutter/material.dart';
import 'package:dailee/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'http.dart';

class DeliveryHome extends StatefulWidget {
  // final String id;
  // final String zoneid;
  // DeliveryHome({this.id,this.zoneid});
  @override
    
  _DeliveryHomeState createState() => _DeliveryHomeState();
}

class _DeliveryHomeState extends State<DeliveryHome> {
  int d;
  void initState(){
    getApi();
    super.initState();
  }
  getApi()  async{
    print("hello");
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // wholezoneid=preferences.getString("zoneid");
  print(wholezoneid);
  print(wholeid);
  
    var result=await http_get("defaultcustomerfordelivery/$wholezoneid");
    setState(() {
      examplelist=result.data['list'];
      print(examplelist);
    }); 
  }
  header() {
    return Padding(                                  //PLEASE DONT MIND FOCUS
      padding: EdgeInsets.only(bottom: 25),
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.center,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.5, 0.7, 0.9],
                colors: [
                  Colors.blueGrey[900],
                  Colors.blueGrey[900],
                  Colors.blueGrey[900],
                  Colors.blueGrey[900],
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: <Widget>[
              SizedBox(
                height: 60,
              ),
              // Text(
              //   // "Customers",
              //   style: TextStyle(color: Colors.white, fontSize: 20),
              // ),
              SizedBox(height: 20),
              Row(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (query) async {
                      print(query);
                      if(query.isEmpty){
                        getApi();
                      }else{
                        var result= await http_get("customersearchindelivery/${query.toLowerCase()}&$wholezoneid");
                       setState(() {
                          examplelist=result.data["list"];
                             
                      
                       });
                      }
                        },
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: "Search Customers",
                        fillColor: Colors.white,
                        // suffixIcon: IconButton(
                        //   icon: Icon(Icons.search),
                        //   onPressed: () {},
                        // ),
                      ),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.search, color: Colors.white,),
                      onPressed: () {
                        print(search);
                      }
                     )
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
  //USED FOR SHOWING WHEN WE PRESSED EACH DETAILS

  showpub(String name, String address,String phone) {
    print('$name $address $phone');
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        int selectedRadio = 0;
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            height: 400,
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        
                        children: [
                          Text(name),
                          // Text(city),
                          Text(phone),
                          Text(address),
                         publicationprint()
                        ],
                       
                      ),
                    ),
                    SizedBox(
                      width: 320.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green,
                      ),
                    )
                  ],
                )),
          ),
        );
      },
    );
  }
  var i=0;
  publicationprint(){
    print(templist);
    return ListView.builder(
    shrinkWrap: true,
    
    itemCount: templist.length,
    itemBuilder:  (context, i) => InkWell(
      child: Container(
        child:Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(templist[i]['publication_name']),
            Text(templist[i]['period'].toString())
          ],
        ),
        
      ),
      ));
    
  }
 var a;
/////////////[THis is how a content fetched from database looks like   "ANEEZ MUHAMMED"]
  List examplelist = [];
  List templist=[];
  buildGridView() {
    return ListView.separated(
      padding: EdgeInsets.all(1),
      shrinkWrap: true,
      itemCount: examplelist.length,
      itemBuilder: (context, i) => InkWell(
        onTap: () async{
          var result=await http_get("deliverydetails/${examplelist[i]['customer_id']}");
          setState(() {
          
            print("hi");
            templist=result.data['list'];
            showpub(examplelist[i]['customer_name'].toString(),examplelist[i]['address'].toString(),examplelist[i]['reg_mobile'].toString());
          });
          
        },
        child: Card(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${examplelist[i]['customer_name']}",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 100,
                      child: Text(
                        "${examplelist[i]['reg_mobile']}",
                        maxLines: 3,
                        style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Column(
                children: <Widget>[
                  Text(
                    "${examplelist[i]['address']}",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // FlatButton(
              //   onPressed: () => print("object"),
              //   child: Icon(Icons.close),
              // )
            ],
          ),
        ),
      ),
      separatorBuilder: (context, i) => Divider(),
    );
  }

  String search;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "DeliveryHome",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 0.5),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MenuButtonHome()));
              })
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[header(), Expanded(child: buildGridView())],
        ),
      ),
    );
  }
}
