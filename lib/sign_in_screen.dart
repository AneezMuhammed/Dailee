import 'package:flutter/material.dart';
import 'package:dailee/http.dart';
import 'package:dailee/homescreen.dart';
import 'package:dailee/signup.dart';

import 'admin.dart';
import 'customer.dart';
import 'deliverytoagency.dart';

class SignInScreen extends StatelessWidget {
  List users = ["Customer", "Delivery to home", "Delivery to agency"];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: Text("Sign In"),
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    // MediaQuery.of(context).size.height * 0.04),
                    Text(
                      "DAILEE",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Sign in with your email and password",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    SignForm(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            int selectedRadio = 0;
                            return AlertDialog(
                              title: Text(
                                "Sign Up",
                              ),
                              content: StatefulBuilder(
                                builder: (BuildContext context,
                                    StateSetter setState) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: List<Widget>.generate(
                                        users.length, (int index) {
                                      return ListTile(
                                          title: Text(users[index]),
                                          leading: Radio<int>(
                                            value: index,
                                            groupValue: selectedRadio,
                                            onChanged: (int value) {
                                              setState(
                                                  () => selectedRadio = value);
                                            },
                                          ));
                                    }),
                                  );
                                },
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("Continue to Page"),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUpPage(
                                                  usertype:
                                                      users[selectedRadio],
                                                )));
                                  },
                                ),
                                FlatButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    //Put your code here which you want to execute on Cancel button click.
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text("SignUp",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool wait = false;
  bool remember = false;
  signin ()async{
  
  var result = await http_post("login", {
    "email": email,
    "password": password,
   

  });
  print(result.data['code']);
  if (result.data['code'] == 200) {
   
     if(result.data['role']=="Customer"){
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => new Customer()),
        (Route<dynamic> route) => false); 
     }
   else if(result.data['role']=="Deliver to agency") {Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => new DeliveryAgency()),
        (Route<dynamic> route) => false);}
 
  else if(result.data['role']=="Admin"){
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => new  Admin()),
        (Route<dynamic> route) => false); }
  }
}

  @override
  void initState() {
    super.initState();
  }

  // savePref(String id) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   print("hdshfgshdkfgakhsfgkg");
  //   setState(() {
  //     preferences.setString("id", id);
  //     preferences.setString("email", emailcontroller.text);
  //     preferences.setString("role", role);
  //     preferences.commit();
  //   });
  // }

  var value;

  String passwordresponse;
  String response;
  String role;
  bool loading = false;

  

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: 30),
          buildPasswordFormField(),
          SizedBox(height: 30),
          Row(
            children: [
              Checkbox(
                value: remember,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // return ForgotPasswordScreen();
                    },
                  ),
                ),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(color: Colors.redAccent),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          DefaultButton(
            text: "Login",
            press: () {
             signin();
            },
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordcontroller,
      obscureText: true,
      onChanged: (newValue) => password = newValue,
      validator: (value) {
        if (value.isEmpty) {
          return "";
        } else if (value.length < 8) {
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailcontroller,
      keyboardType: TextInputType.emailAddress,
      onChanged: (newValue) {email = newValue;},
      validator: (value) {
        if (value.isEmpty) {
          return "";
        } else if (true) {
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 46,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.black,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
