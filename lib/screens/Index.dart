import 'package:flutter/material.dart';
import 'package:guidance_and_counselling/components/AppTittle.dart';

import 'package:guidance_and_counselling/screens/Home.dart';
import 'package:guidance_and_counselling/screens/user-profile/user_profile.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  GlobalKey<ScaffoldState> _openDrawer = GlobalKey<ScaffoldState>();
  Drawer _showDrawer() {
    return Drawer(
        child: Container(
      color: Colors.green[100],
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              radius: 10.0,
              backgroundImage: AssetImage("assets/images/profile.jpg"),
            ),
            accountName: Text("Good Person"),
            accountEmail: Text("goodperson@gmail.com"),
          ),
          ListTile(
              leading: Icon(Icons.home_rounded),
              title: Text("Home"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Index(), fullscreenDialog: true));
              }),
          ListTile(
              leading: Icon(Icons.person),
              title: Text("User Profile"),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => UserInfoScreen(),
                        fullscreenDialog: true),
                    (Route<dynamic> route) => true);
              })
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _openDrawer,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _openDrawer.currentState.openDrawer();
          },
        ),
        title: AppTitle(),
        centerTitle: true,
      ),
      drawer: _showDrawer(),
      body: Home(),
    );
  }
}
