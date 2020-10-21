import 'package:dailee/profileedit.dart';
import 'package:flutter/material.dart';

class DeliveryHome extends StatefulWidget {
  @override
  _DeliveryHomeState createState() => _DeliveryHomeState();
}

class _DeliveryHomeState extends State<DeliveryHome> {
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
                "Delivery",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 20),
              Row(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) => search = value,
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: "Search Customer",
                        fillColor: Colors.white70,
                        // suffixIcon: IconButton(
                        //   icon: Icon(Icons.search),
                        //   onPressed: () {},
                        // ),
                      ),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        print(search);
                      })
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }

  showpub(String pub, String city, String phone, String address) {
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
                          Text(pub),
                          Text(city),
                          Text(phone),
                          Text(address),
                          Text(
                            "asasghgkagkgkajhskjfhkjashfkjashfkjashfkjagskfjhaskfgkjaskfgaskhfgkjasgfkjasgkfjgaskjfgkasgfkjasgfkjagsfkjagskfjgaskjfgkajsgfjagskfgaskfgkjasgfkjgaskjfgasjf",
                            style: TextStyle(fontSize: 40),
                          )
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

/////////////[THis is how a content fetched from database looks like   "ANEEZ MUHAMMED"]
  List examplelist = [
    {
      "name": "Customer1",
      "city": "kothamnagalm",
      "phonenumber": "993345364",
      "address": "Cheruppuram p.o",
      "pub": "asfasgasgasgagasgasg"
    },
    {
      "name": "Customer2",
      "city": "perum",
      "phonenumber": "1093345364",
      "address": "Tahdi p.o",
      "pub": "213"
    },
    {
      "name": "Customer3",
      "city": "kochu",
      "phonenumber": "03345364",
      "address": "hello p.o",
      "pub": "342"
    },
  ];
  buildGridView() {
    return ListView.separated(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: examplelist.length,
      itemBuilder: (context, i) => InkWell(
        onTap: () {
          showpub(examplelist[i]['pub'], examplelist[i]['city'],
              examplelist[i]['phonenumber'], examplelist[i]['address']);
        },
        child: Card(
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
                        "${examplelist[i]['city']}",
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
                    "${examplelist[i]['city']}",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              FlatButton(
                onPressed: () => print("object"),
                child: Icon(Icons.close),
              )
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
          "Dailee:Home",
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
