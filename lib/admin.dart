import 'package:dailee/http.dart';
import 'package:dailee/requestdeatailsview.dart';
import 'package:dailee/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'complaints.dart';
import 'details.dart';
import 'messageSuccess.dart';

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
            color: Colors.blueGrey[900]
              // gradient: LinearGradient(
              //     begin: Alignment.topLeft,
              //     end: Alignment.bottomRight,
              //     colors: <Color>[                            //color gradient design
              //   Colors.blueGrey[900],
              //   Colors.blueGrey[900],
              //   Colors.blueGrey[900],
              //   Colors.blueGrey[900],
              // ])
              ),
        ),
        elevation: 0,
        title: Text(
          "Dailee:Admin",
          style: TextStyle(
              fontSize: 20,
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
            new Tab(                                             //icons on admin appbar
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
              style: TextStyle(fontSize: 22),
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
          carbutton(Icon(Icons.perm_contact_calendar), "Publications", () {
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
          carbutton(Icon(Icons.perm_contact_calendar), "Customers", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WholeList("Customer")));
          }),
          carbutton(Icon(Icons.perm_contact_calendar), "Delivery Boys", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WholeList("Delivery")));
          }),
        ],
      ),
    );
  }                                                       //upto this about creating the ui of ddetails
}

///[REQUEST]
class Request extends StatefulWidget {
  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  @override
  String id;
  void initState() {
  
    getApi(); //ask

    super.initState();
  }
  getApi() async{
    var result=await http_get("request");
    setState(() {
      examplelist=result.data['list'];
      print(examplelist);
    });
  }
  List examplelist = [];
  buildGridView() {
    return ListView.separated
    (
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: examplelist.length,
      itemBuilder: (context, i) => 
      InkWell(
        onTap: () async{
          await Navigator.push(context,MaterialPageRoute(builder: (context)=>Requestdetails(id:examplelist[i]['request_id'])));
          getApi();
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
                     Text(
                      "${examplelist[i]['category']}",
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
      separatorBuilder: (context, i) => Divider(color: Colors.black,),
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
    // {
    //   "title": "Request1",
    //   "content": "Content1",
    //   "publication": "puaksfkajsbfkjasbfkbasf"
    // },
    // {
    //   "title": "Request2",
    //   "content": "Content2",
    //   "publication": "2puaksfkajsbfkjasbfkbasf"
    // },
    // {
    //   "title": "Request3",
    //   "content": "Content3",
    //   "publication": "p3uaksfkajsbfkjasbfkbasf"
    // },
    // {
    //   "title": "Aneez",
    //   "content": "Content4",
    //   "publication": "4puaksfkajsbfkjasbfkbasf"
    // },
    // {
    //   "title": "First title",
    //   "content": "Content1",
    //   "publication": "5ksfkajsbfkjasbfkbasf"
    // },
    // {
    //   "title": "Second title",
    //   "content": "Content2",
    //   "publication": "24usfkajsbfkjasbfkbasf"
    // },
    // {
    //   "title": "Third title",
    //   "content": "Content3",
    //   "publication": "124124124puaksfkajsbfkjasbfkbasf"
    // },
    // {
    //   "title": "Aneez",
    //   "content": "Content4",
    //   "publication": "0000000000puaksfkajsbfkjasbfkbasf"
    // },
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
   void initState(){
   getApi();
   super.initState();
 }
 getApi() async{
   var result= await http_get("complaint");
  
    setState(() {
      examplelist=result.data['list'];
      print(examplelist);
    });
 }
 List examplelist=[];
  buildGridView() {
    return ListView.separated
    (
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: examplelist.length,
      itemBuilder: (context, i) => 
      InkWell(
        onTap: () async{
           await Navigator.push(context,MaterialPageRoute(builder: (context)=>Complaints(id:examplelist[i]['complaint_id'])));
           getApi();
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
                     Text(
                      "${examplelist[i]['reason_type']}",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                      SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //   width: 100,
                    //   child: Text(
                    //     "${examplelist[i]['language']}",
                    //     maxLines: 3,
                    //     style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
      separatorBuilder: (context, i) => Divider(color: Colors.black, thickness: 10,height: 10,),
    );
  }
  @override
  Widget build(BuildContext context) {            //here call old features through Container();
    return Container(
      child:Column(
        children: <Widget>[
          Container(
            child:Expanded(child:buildGridView()),
          )
        ],
      ),
      
    );
  }
}

class MenuTab extends StatefulWidget {
  @override
  _MenuTabState createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  void initState(){
    getApi();
    super.initState();
  }
  getApi()async{
var result=await http_get("Menutab");
 setState(() {
   examplelist=result.data['list'];
   print("aaaa");
 });
  }
  List examplelist=[];
  changeEmail(){

  }
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
                  "${examplelist[0]['name']}",
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
            title: "Change Email",
            press: () {
              changeEmail();
              print("Email");
            },
          ),
          MenuButton(
            icon: Icon(Icons.vpn_key),
            title: "Change password",
            press: () {
              // changePassword();
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
             
              _logout(context);
            },
          ),
        ],
      ),
    );
  }
  _logout(BuildContext mcontext) async {
    print("logout");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Navigator.of(mcontext).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => new SignInScreen()),
        (Route<dynamic> route) => false);
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
  void initstate(){
    
      // msgcontroller.clear();  
    super.initState();
  }
  @override
  var msgcontroller=TextEditingController();

  sendMessage()async{
   var result=await http_get("sendMessage/${msgcontroller.text}");
   print(result.data['code']);
   if(result.data['code']==200){
 await Navigator.push(context,MaterialPageRoute(builder: (context)=>Messagesuccess()));
  
     msgcontroller.clear();
   
    
   }
  }
  
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 0,),
          // Padding(
            // padding:EdgeInsets.all(8.0),
            // child:
            Padding(padding: const EdgeInsets.all(20),
                          child: Text("Message Customers and do business",style:TextStyle(fontSize:35) ,
          ),
            ),
          // ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: msgcontroller,
              // onChanged: (value) => message = value,
              maxLines: 2,
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[800]),
                hintText: "Enter the Message",
                fillColor: Colors.white70,
                // suffixIcon: IconButton(
                //   icon: Icon(Icons.search),
                //   onPressed: () {},
                // ),
              ),
            ),
          ),
          RaisedButton(
            onPressed: (){
              print("he");
               if(msgcontroller.text.length!=0)
               sendMessage();
            },
            child: Text(
              "Send",
              style: TextStyle(fontSize: 20,color:Colors.white),),
            color: Colors.blueGrey[900],
          )
        ],
      ),
    );
  }
}

//////////////////////here begins our search so enjoy 
class WholeList extends StatefulWidget {
  final String datalist;
  WholeList(this.datalist);
  @override
  _WholeListState createState() => _WholeListState();
}

class _WholeListState extends State<WholeList> {
  getApi() async{
    print("how ");
    if (widget.datalist == "Customer") {
      var result=await http_get("defaultcustomer");
//Step1.search the list from node; use http get ::here for customer
      //store result as setState((){ examplelist=result.data['list']})    note:here i used sample example
      setState(() {
    // /.;
    print("default customer");
    examplelist=result.data['list'];
    newexamplelist=examplelist;
      });
    } else if (widget.datalist == "Publication") {
          var result=await http_get("defaultpublication");
      //Step1.search the list from node; use http get ::here for publication
      //store result as setState((){ examplelist=result.data['list']})    note:here i used sample example
      setState(() {
        print("default publication");
        examplelist=result.data['list'];
        newexamplelist=examplelist;
      });
    }
    else if (widget.datalist == "Delivery"){

    var result=await http_get("defaultdeliver");
    print(result);
    setState(() {
      print(result);
      print("default delivers");
      print(result);
      examplelist=result.data['list'];
      newexamplelist=examplelist;
    });
  }
  }

  Widget appBarTitle;
  List mainlistforsearch;
  @override
  void initState() {
    appBarTitle = new Text(widget.datalist);
    getApi(); //ask

    super.initState();
  }

  ///[THIS examplelist is what we assign to the ]
  List examplelist = [];
  List newexamplelist=[];

  buildCustomerGridView() {
    return ListView.separated(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: examplelist.length,
      itemBuilder: (context, i) => InkWell(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context)=>Adminviewdetails(role: 'Customer', id:examplelist[i]['customer_id'])));
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
                        "${examplelist[i]['email']}",
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
                    "${examplelist[i]['reg_mobile']}",
                    style: TextStyle(
                      fontSize: 25,
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
  }      //end of customer build grid view
 buildDeliveryGridView() {
    return ListView.separated(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: examplelist.length,
      itemBuilder: (context, i) => InkWell(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context)=>Adminviewdetails(role: 'Delivers', id:examplelist[i]['deliver_id'])));
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
                        "${examplelist[i]['email']}",
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
                    "${examplelist[i]['reg_mobile']}",
                    style: TextStyle(
                      fontSize: 25,
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
  }                                                                     //end of delivery grid view
   buildPublicationGridView() {
    return ListView.separated(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: examplelist.length,
      itemBuilder: (context, i) => InkWell(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context)=>Adminviewdetails(role: 'Publication', id:examplelist[i]['publication_id'])));
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
                      "${examplelist[i]['publication_name']}",
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
                  ],
                ),
              ),
              Spacer(),
              Column(
                children: <Widget>[
                  Text(
                    "${examplelist[i]['language']}",
                    style: TextStyle(
                      fontSize: 25,
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
  }                               //end of publication grid view
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
                    onChanged: (query) async {
                      print(query);
                      ///[THIS IS MY STYLE OF SEARCHING A LIST WHICH IS TOTALLY FETCHED FROM THE API]
                      if (widget.datalist == "Customer") {
                        var result= await http_get("customersearch/${query.toLowerCase()}");
                       setState(() {
                          examplelist=result.data["list"];
                             
                      
                       });
                        // if(query.length==0){
                        //   setState(() {
                        //     getApi();
                        //   });
                        // }
                        // print(query);
                        // setState(() {
                        //   mainlistforsearch = examplelist
                        //       .where((p) => p['name']                           //ask
                        //           .toLowerCase()
                        //           .contains(query.toLowerCase()))
                        //       .toList();
                        // });
                  
                      }
                      else if(widget.datalist=="Publication"){
                          var result= await http_get("publicationsearch/${query.toLowerCase()}");
                       setState(() {
                          examplelist=result.data["list"];
                      //      if(query.length==0){
                      //   setState(() {
                      //    getApi();
                      //   });
                      // }
                       });
                       
                      }
                        else if(widget.datalist=="Delivery"){
                          var result= await http_get("deliverysearch/${query.toLowerCase()}");
                       setState(() {
                          examplelist=result.data["list"];
                         
                      //   `   if(query.length==0){
                      // setState(() {
                      //   getApi();
                      // });
                      // }`
                       });
                       
                      }
                    },
                    decoration: new InputDecoration(
                        prefixIcon: new Icon(Icons.search, color: Colors.white),
                        hintText: "Search...",                                            //ask 
                        hintStyle: new TextStyle(color: Colors.white)),
                  );
                } else {
                 setState(() {
                   examplelist=newexamplelist;
                 });
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
                  child: buildCustomerGridView(),
                ),
              if (widget.datalist == "Publication")
                Expanded(
                  child: buildPublicationGridView(), //show another gridview
                ),
                 if (widget.datalist == "Delivery")
                Expanded(
                  child: buildDeliveryGridView(), //show another gridview
                ),
            ],
          ),
        ));
  }
}
