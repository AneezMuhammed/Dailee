import 'package:dailee/profileedit.dart';
import 'package:flutter/material.dart';

class DeliveryAgency extends StatefulWidget {
  @override
  _DeliveryAgencyState createState() => _DeliveryAgencyState();
}

class _DeliveryAgencyState extends State<DeliveryAgency> {
  showpub(String pub) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        int selectedRadio = 0;
        return AlertDialog(
          title: Text("Publications"),
          content: Text(pub),
          actions: <Widget>[
            FlatButton(
              onPressed: () => print("object"),
              child: Icon(Icons.check),
            ),
            FlatButton(
              onPressed: () => print("object"),
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
                  Colors.yellow[800],
                  Colors.yellow[700],
                  Colors.yellow[600],
                  Colors.yellow[400],
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
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 20),
              // Row(
              //   textDirection: TextDirection.ltr,
              //   children: <Widget>[
              //     Expanded(
              //       child: TextField(
              //         onChanged: (value) => search = value,
              //         decoration: new InputDecoration(
              //           border: new OutlineInputBorder(
              //             borderRadius: const BorderRadius.all(
              //               const Radius.circular(10.0),
              //             ),
              //           ),
              //           filled: true,
              //           hintStyle: new TextStyle(color: Colors.grey[800]),
              //           hintText: "Search Request",
              //           fillColor: Colors.white70,
              //           // suffixIcon: IconButton(
              //           //   icon: Icon(Icons.search),
              //           //   onPressed: () {},
              //           // ),
              //         ),
              //       ),
              //     ),
              //     IconButton(
              //         icon: Icon(Icons.search),
              //         onPressed: () {
              //           print(search);
              //         })
              //   ],
              // )
            ]),
          ),
        ],
      ),
    );
  }

/////////////[THis is how a content fetched from database looks like   "ANEEZ MUHAMMED"]
  List examplelist = [
    {
      "title": "Request1",
      "content": "Content1",
      "publication": "puaksfkajsbfkjasbfkbasf"
    },
    {
      "title": "Request2",
      "content": "Content2",
      "publication": "2puaksfkajsbfkjasbfkbasf"
    },
    {
      "title": "Request3",
      "content": "Content3",
      "publication": "p3uaksfkajsbfkjasbfkbasf"
    },
    {
      "title": "Aneez",
      "content": "Content4",
      "publication": "4puaksfkajsbfkjasbfkbasf"
    },
    {
      "title": "First title",
      "content": "Content1",
      "publication": "5ksfkajsbfkjasbfkbasf"
    },
    {
      "title": "Second title",
      "content": "Content2",
      "publication": "24usfkajsbfkjasbfkbasf"
    },
    {
      "title": "Third title",
      "content": "Content3",
      "publication": "124124124puaksfkajsbfkjasbfkbasf"
    },
    {
      "title": "Aneez",
      "content": "Content4",
      "publication": "0000000000puaksfkajsbfkjasbfkbasf"
    },
  ];
  buildGridView() {
    return ListView.separated(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: examplelist.length,
      itemBuilder: (context, i) => InkWell(
        onTap: () {
          showpub(examplelist[i]['publication']);
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
                      "${examplelist[i]['title']}",
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
                        "${examplelist[i]['content']}",
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          children: <Widget>[header(), Expanded(child: buildGridView())],
        ),
      ),
    );
  }
}
