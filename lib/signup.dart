import 'package:dailee/customer.dart';
import 'package:dailee/deliverAgency.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'deliverytohome.dart';
import 'http.dart';
import 'package:dailee/main.dart';

class SignUpPage extends StatefulWidget {
  final String usertype;
  SignUpPage({this.usertype});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String email;
  String password;
  String nameforadmin;
  String namefordelivery;
  String nameforcustomer;
  String adminspecialvalue;
  String agencyname;
  String deliveryphone;
  String role;
  String address;
  String zone_key;
String type;
String phone;
double latitude;
double longitude;
final _formKey = GlobalKey<FormState>();
void initState(){
   
   setState(() {
     role=widget.usertype;
   });
  super.initState();
}
  getLocationPermission()async{
LocationPermission permission = await Geolocator.checkPermission();
permission;
  }
  showCustomerWidget() {
    
    return Container(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: new InputDecoration(
              labelText: "Name ${widget.usertype}",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
              //fillColor: Colors.green
            ),
            onChanged: (newValue) => nameforcustomer = newValue,
            validator: (val) {
              if (val.length == 0) {
                return "Email cannot be empty";
              } else {
                
                return null;
              }
            },
            keyboardType: TextInputType.text,
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            decoration: new InputDecoration(
              labelText: "Enter Address",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
              //fillColor: Colors.green
            ),
            onChanged: (newValue) => address = newValue,
            validator: (val) {
              if (val.length == 0) {
                return "";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.text,
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),
    TextFormField(
            decoration: new InputDecoration(
              labelText: "Phone Number",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
              //fillColor: Colors.green
            ),
            onChanged: (newValue) => phone = newValue,
            validator: (val) {
              if (val.length == 0) {
                return "";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.phone,
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),
        ],
      ),
    );
  }

 showDeliveryHomeWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: new InputDecoration(
              labelText: "Enter Name",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
              //fillColor: Colors.green
            ),
            onChanged: (newValue) => namefordelivery = newValue,
            validator: (val) {
              if (val.length == 0) {
                return "Name cannot be empty";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.emailAddress,
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),
          TextFormField(
            decoration: new InputDecoration(
              labelText: "Phone Number ",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
              //fillColor: Colors.green
            ),
            onChanged: (newValue) => deliveryphone = newValue,
            validator: (val) {
              if (val.length == 0) {
                return "";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.phone,
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
            
          ),
           TextFormField(
            decoration: new InputDecoration(
              labelText: "Zone Key ",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
              //fillColor: Colors.green
            ),
            onChanged: (newValue) => zone_key = newValue,
            validator: (val) {
              if (val.length == 0) {
                return "";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.phone,
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
            
          ),
        ],
      ),
    );
  }

  showDeliveryAgencyWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: new InputDecoration(
              labelText: "Enter Name ${widget.usertype}",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
              //fillColor: Colors.green
            ),
            onChanged: (newValue) => namefordelivery = newValue,
            validator: (val) {
              if (val.length == 0) {
                return "Name cannot be empty";
              } else {
                role='Deliver to agency';
                return null;
              }
            },
            keyboardType: TextInputType.text,
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),
          TextFormField(
            decoration: new InputDecoration(
              labelText: "Phone Number ",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
              //fillColor: Colors.green
            ),
            onChanged: (newValue) => deliveryphone = newValue,
            validator: (val) {
              if (val.length == 0) {
                return "Email cannot be empty";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.phone,
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),
          TextFormField(
            decoration: new InputDecoration(
              labelText: " Agency Name${widget.usertype}",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
              //fillColor: Colors.green
            ),
            onChanged: (newValue) => agencyname = newValue,
            validator: (val) {
              if (val.length == 0) {
                return "Email cannot be empty";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.text,
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),
        ],
      ),
    );
  }
  signupCustomer()async{
    var result=await http_post("customer",{
   "email": email,
    "password": password,
    "name":nameforcustomer,
    "phonenumber":phone,
    "address":address,
    "latitude":latitude,
    "longitude":longitude,
    "role":role
    });
     print(result.data['code']);
  if (result.data['code'] == 200) {
   
     
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => new Customer()),
        (Route<dynamic> route) => false);
  }

  }
signupDeliveryAgency()async{
  
  var result = await http_post("deliveryagency", {
    "email": email,
    "password": password,
    "name":namefordelivery, 
    "phonenumber":deliveryphone,
    "agencyname":agencyname,
    "role":role

  });
  print(result.data['code']);
  if (result.data['code'] == 200) {
   setState(() {
          wholerole = role;
          wholeid = result.data['id'];
          print(wholerole);
          print(wholeid);
        });
        SharedPreferences preferences = await SharedPreferences.getInstance();

         preferences.setString("role", wholerole);
            preferences.setString("id", wholeid);
     
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => new Deliveragency()),
        (Route<dynamic> route) => false);
  }
}
signupDeliveryHome()async{
var result=await http_post("deliveryhome", {
    "email": email,
    "password": password,
    "name":namefordelivery, 
    "phonenumber":deliveryphone,
    "zone_key":zone_key,
    "role":role });
    if(result.data['code']==200){
       setState(() {
          wholerole = result.data['role'];
          wholeid = result.data['id'];
          wholezoneid=result.data['zone_id'];
          print(wholerole);
          print(wholeid);
        });
        SharedPreferences preferences = await SharedPreferences.getInstance();

         preferences.setString("role", wholerole);
            preferences.setString("id", wholeid);
            preferences.setString("zoneid",wholezoneid);
         Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => new DeliveryHome()),
        (Route<dynamic> route) => false);
    }

 
}
getLocation() async{
Position position=await Geolocator.getCurrentPosition(desiredAccuracy:LocationAccuracy.low);
latitude=position.latitude;
longitude=position.longitude;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Form(  
                           key:_formKey,
                          child: Column(
                children: <Widget>[
                  SizedBox(height: 50),
                  Text("Welcome to sign up for ${widget.usertype}"),
                  SizedBox(height: 50),
                  if (widget.usertype == "Customer")showCustomerWidget(),
                  if (widget.usertype == "Delivery to home") showDeliveryHomeWidget(),
                  if (widget.usertype == "Delivery to agency")
                    showDeliveryAgencyWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Enter Email for ${widget.usertype}",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    onChanged: (newValue) => email = newValue,
                    validator: (val) {
                      if (val.length == 0) {
                        return "Email cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: new InputDecoration(
                      labelText: "Password for ${widget.usertype}",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    onChanged: (newValue) => password = newValue,
                    validator: (val) {
                      if (val.length == 0) {
                        return "Email cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.visiblePassword,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  RaisedButton(
                    onPressed: ()async{
                      if (_formKey.currentState.validate()) {
                        if(widget.usertype=="Customer"){
                          print("customer");
                          await getLocation();
                            if(latitude!=null&& longitude!=null)
                            signupCustomer();

                        }
                        if(widget.usertype=="Delivery to agency"){
                          signupDeliveryAgency();
                        }
                       else if(widget.usertype=="Delivery to home"){
                         signupDeliveryHome();
                       }  
                        }
                    },
                    child: Text("Sign UP"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
