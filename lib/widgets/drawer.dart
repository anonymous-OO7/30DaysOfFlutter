import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl =
        " https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN6PSb90rGnT4WTxYC7HBxNWs2Ig-mSP2b0g&usqp=CAU";
    return Drawer(
        child: Container(
      color: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountEmail: Text("gauravyadav00729@gmail.com"),
              accountName: Text("Gaurav"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                //  backgroundImage: Image.asset("lib\assets\files\login-shield.png"),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            title: Text(
              "Home",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
            ),
            title: Text(
              "Profile",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.white,
            ),
            title: Text(
              "Mail",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ));
  }
}
