import 'package:dailee/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuButtonHome extends StatefulWidget {
  @override
  _MenuButtonHomeState createState() => _MenuButtonHomeState();
}

class _MenuButtonHomeState extends State<MenuButtonHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Account"),
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
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
              SettingButton(
                icon: Icon(Icons.email),
                title: "Email",
                press: () {
                  print("Email");
                },
              ),
              SettingButton(
                icon: Icon(Icons.vpn_key),
                title: "Change password",
                press: () {
                  print("Change Password");
                },
              ),
              SettingButton(
                icon: Icon(Icons.vpn_key),
                title: "Email",
                press: () {
                  print("Email");
                },
              ),
              SettingButton(
                icon: Icon(Icons.vpn_key),
                title: "Email",
                press: () {
                  print("Email");
                },
              ),
              SettingButton(
                icon: Icon(Icons.vpn_key),
                title: "Email",
                press: () {
                  print("Email");
                },
              ),
              SettingButton(
                icon: Icon(Icons.cancel),
                title: "SignOut",
                press: () {
                  _logout(context);
                },
              ),
            ],
          ),
        ));
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


class SettingButton extends StatelessWidget {
  final String title;
  final Function press;
  final Icon icon;

  const SettingButton({Key key, this.title, this.press, this.icon})
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
