import 'package:flutter/material.dart';

class Customer extends StatefulWidget {
  @override
  _CustomerState createState() => _CustomerState();
}

class _CustomerState extends State<Customer>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 5, vsync: this);
    super.initState();
  }

  String search;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Colors.yellow[800],
                Colors.yellow[700],
                Colors.yellow[600],
                Colors.yellow[400],
              ])),
        ),
        elevation: 0,
        title: Text(
          "Dailee:Customer",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 0.5),
        ),
        bottom: TabBar(
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.white,
          tabs: [
            new Tab(text: 'Subscrition', icon: new Icon(Icons.subscriptions)),
            new Tab(
              text: 'Sub list',
              icon: new Icon(Icons.list),
            ),
            new Tab(
              text: 'Need',
              icon: new Icon(Icons.card_giftcard),
            ),
            new Tab(
              text: 'Complaint',
              icon: new Icon(Icons.warning),
            ),
            new Tab(
              icon: new Icon(Icons.menu),
            )
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomOpacity: 1,
      ),
      body: TabBarView(
        physics: ClampingScrollPhysics(),
        children: [
          SearchAndSub(),
          SubList(),
          Need(),
          ComplaintCust(),
          MenuTab()
        ],
        controller: _tabController,
      ),
    );
  }
}

////[DETAILS]
class SearchAndSub extends StatefulWidget {
  @override
  _SearchAndSubState createState() => _SearchAndSubState();
}

class _SearchAndSubState extends State<SearchAndSub> {
  String search;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
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
                      hintText: "Search Subs",
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
            ),
          ),
          Expanded(child: buildGridView())
        ],
      ),
    );
  }

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
        onTap: () {},
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
}

///[REQUEST]
class SubList extends StatefulWidget {
  @override
  _SubListState createState() => _SubListState();
}

class _SubListState extends State<SubList> {
  List examplelist = [
    {
      "title": "Sub1",
      "content": "Content1",
      "publication": "puaksfkajsbfkjasbfkbasf"
    },
    {
      "title": "Sub2",
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
        onTap: () {},
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Expanded(child: buildGridView()),
          )
        ],
      ),
    );
  }
}

///[AGENCY RESPONSE]
class Need extends StatefulWidget {
  @override
  _NeedState createState() => _NeedState();
}

class _NeedState extends State<Need> {
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
        onTap: () {},
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Expanded(child: buildGridView()),
          )
        ],
      ),
    );
  }
}

class ComplaintCust extends StatefulWidget {
  @override
  _ComplaintCustState createState() => _ComplaintCustState();
}

class _ComplaintCustState extends State<ComplaintCust> {
  String message;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) => message = value,
                maxLines: 10,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  filled: true,
                  hintStyle: new TextStyle(color: Colors.grey[800]),
                  hintText: "Complaint......................",
                  fillColor: Colors.white70,
                  // suffixIcon: IconButton(
                  //   icon: Icon(Icons.search),
                  //   onPressed: () {},
                  // ),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () => print("message"),
              child: Text("Send Cheyadaaaa"),
            ),
            Container(
              height: 300,
              child: buildGridView(),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  List examplelist = [
    {
      "name": "Compalint1",
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
        onTap: () {},
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
}

class MenuTab extends StatefulWidget {
  @override
  _MenuTabState createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  child: Icon(Icons.perm_identity),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Aneez Muhammed",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
          Divider(
            thickness: 1,
            height: 1,
          ),
          MenuButton(
            icon: Icon(Icons.email),
            title: "Email",
            press: () {
              print("Email");
            },
          ),
          MenuButton(
            icon: Icon(Icons.vpn_key),
            title: "Change password",
            press: () {
              print("Change Password");
            },
          ),
          MenuButton(
            icon: Icon(Icons.vpn_key),
            title: "Email",
            press: () {
              print("Email");
            },
          ),
          MenuButton(
            icon: Icon(Icons.vpn_key),
            title: "Email",
            press: () {
              print("Email");
            },
          ),
          MenuButton(
            icon: Icon(Icons.vpn_key),
            title: "Email",
            press: () {
              print("Email");
            },
          ),
          MenuButton(
            icon: Icon(Icons.cancel),
            title: "SignOut",
            press: () {
              print("Sign Out");
            },
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String title;
  final Function press;
  final Icon icon;

  const MenuButton({Key key, this.title, this.press, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        child: Row(
          children: <Widget>[
            icon,
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}

//////////////////////
