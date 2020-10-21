import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 6, vsync: this);
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
          "Dailee:Admin",
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
            new Tab(icon: new Icon(Icons.home)),
            new Tab(
              icon: new Icon(Icons.receipt),
            ),
            new Tab(
              icon: new Icon(Icons.room_service),
            ),
            new Tab(
              icon: new Icon(Icons.warning),
            ),
            new Tab(
              icon: new Icon(Icons.message),
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
          Details(),
          Request(),
          AgencyResponse(),
          Complaint(),
          Message(),
          MenuTab()
        ],
        controller: _tabController,
      ),
    );
  }
}

////[DETAILS]
class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Widget carbutton(Icon icon, String text, Function fun) {
    return InkWell(
      onTap: fun,
      child: Card(
          child: Container(
        height: 100,
        child: Center(
          child: ListTile(
            leading: CircleAvatar(child: icon),
            title: Text(
              text,
              style: TextStyle(fontSize: 26),
            ),
          ),
        ),
      )),
    );
  }

  String search;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          carbutton(Icon(Icons.perm_contact_calendar), "Publication", () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WholeList("Publication")));
          }),
          carbutton(Icon(Icons.perm_contact_calendar), "Subscription", () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WholeList("Subscription")));
          }),
          carbutton(Icon(Icons.perm_contact_calendar), "Customer", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WholeList("Customer")));
          }),
          carbutton(Icon(Icons.perm_contact_calendar), "Delivery", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WholeList("Delivery")));
          }),
        ],
      ),
    );
  }
}

///[REQUEST]
class Request extends StatefulWidget {
  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
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

///[AGENCY RESPONSE]
class AgencyResponse extends StatefulWidget {
  @override
  _AgencyResponseState createState() => _AgencyResponseState();
}

class _AgencyResponseState extends State<AgencyResponse> {
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

class Complaint extends StatefulWidget {
  @override
  _ComplaintState createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  @override
  Widget build(BuildContext context) {
    return Container();
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

class Message extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  String message;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
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
                hintText: "Message......................",
                fillColor: Colors.white70,
                // suffixIcon: IconButton(
                //   icon: Icon(Icons.search),
                //   onPressed: () {},
                // ),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () => print("$message"),
            child: Text("Send Cheyadaaaa"),
          )
        ],
      ),
    );
  }
}

//////////////////////
class WholeList extends StatefulWidget {
  final String datalist;
  WholeList(this.datalist);
  @override
  _WholeListState createState() => _WholeListState();
}

class _WholeListState extends State<WholeList> {
  getApi() {
    if (widget.datalist == "Customer") {
//Step1.search the list from node; use http get ::here for customer
      //store result as setState((){ examplelist=result.data['list']})    note:here i used sample example
      setState(() {
        mainlistforsearch = examplelist;
      });
    } else if (widget.datalist == "Publication") {
      //Step1.search the list from node; use http get ::here for publication
      //store result as setState((){ examplelist=result.data['list']})    note:here i used sample example
      setState(() {
        mainlistforsearch = examplelist;
      });
    }
  }

  Widget appBarTitle;
  List mainlistforsearch;
  @override
  void initState() {
    appBarTitle = new Text(widget.datalist);
    getApi();

    super.initState();
  }

  ///[THIS examplelist is what we assign to the ]
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
      itemCount: mainlistforsearch.length,
      itemBuilder: (context, i) => InkWell(
        onTap: () {
          print("IVIDE ENTHELUM PRINT CHEYY");
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
                      "${mainlistforsearch[i]['name']}",
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
                        "${mainlistforsearch[i]['city']}",
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
                    "${mainlistforsearch[i]['city']}",
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
  Icon actionIcon = new Icon(Icons.search);
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            new AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
          new IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (actionIcon.icon == Icons.search) {
                  print("asfa");
                  actionIcon = new Icon(Icons.close);
                  appBarTitle = new TextField(
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                    onChanged: (query) {
                      ///[THIS IS MY STYLE OF SEARCHING A LIST WHICH IS TOTALLY FETCHED FROM THE API]
                      if (widget.datalist == "Customer") {
                        print(query);
                        setState(() {
                          mainlistforsearch = examplelist
                              .where((p) => p['name']
                                  .toLowerCase()
                                  .contains(query.toLowerCase()))
                              .toList();
                        });
                      }
                    },
                    decoration: new InputDecoration(
                        prefixIcon: new Icon(Icons.search, color: Colors.white),
                        hintText: "Search...",
                        hintStyle: new TextStyle(color: Colors.white)),
                  );
                } else {
                  actionIcon = new Icon(Icons.search);
                  appBarTitle = new Text("${widget.datalist}");
                }
              });
            },
          ),
        ]),
        body: Container(
          child: Column(
            children: <Widget>[
              if (widget.datalist == "Customer")
                Expanded(
                  child: buildGridView(),
                ),
              if (widget.datalist == "Publication")
                Expanded(
                  child: buildGridView(), //show another gridview
                )
            ],
          ),
        ));
  }
}
