import 'package:dailee/http.dart';
import 'package:dailee/profileedit.dart';
import 'package:flutter/material.dart';
class Deliveragency extends StatefulWidget {
  @override
  _DeliveragencyState createState() => _DeliveragencyState();
}

class _DeliveragencyState extends State<Deliveragency> {
  @override
  void initState(){
    super.initState();
    print("asdfgh");
    getApi();
  }
  getApi()async{
    print('ngey');
var result= await http_get("deliver2agencyrequest");
setState(() {
  examplelist=result.data['list'];
});
  }
  confirm(){

  }
  showpub(var pub) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        int selectedRadio = 0;
        return AlertDialog(
          title: Text("Publications"),
          content:Container(child:Column(children:<Widget>[Text(pub['name']),SizedBox(height:5.0),Text(pub['category']),SizedBox(height:5.0),Text(pub['language'])],),height:100,width: 100,) ,
          actions: <Widget>[
            FlatButton(
              onPressed: () async{
                  var result=await http_get("confirmrequest/${pub['request_id']}");
                  print(result.data['code']);
                   if (result.data['code']==200){
                        getApi();
                        Navigator.pop(context);
                   }
                    
                  
              },
              child: Icon(Icons.check),
            ),
            FlatButton(
              onPressed: ()async{
                var result=await http_get("confirmrequest/${pub['request_id']}");
                   if (result.data['code']==200){
                        getApi();
                        Navigator.pop(context);
                   }
                print("object");},
              child: Icon(Icons.close),
            )
          ],
        );
      },
    );
  }

  header() {
    return Padding(
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
              Text(
                "Requests",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              SizedBox(height: 20),
           
            ]),
          ),
        ],
      ),
    );
  }

// /////////////[THis is how a content fetched from database looks like   "ANEEZ MUHAMMED"]
  List examplelist = [];
  buildGridView() {
    return ListView.separated(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: examplelist.length,
      itemBuilder: (context, i) => InkWell(
        onTap: () {
          showpub(examplelist[i]);
        },
        child: Container(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${examplelist[i]['name']}",
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
                        "${examplelist[i]['category']}",
                        maxLines: 3,
                        style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                      ),
                    ),
                   Container(
                      width: 100,
                      child: Text(
                        "${examplelist[i]['language']}",
                        maxLines: 3,
                        style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
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
    print("hello");
   
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Dailee:Agency",
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
          children: <Widget>[header(),Expanded(child: buildGridView())],
        ),
      ),
    );
  }
}
