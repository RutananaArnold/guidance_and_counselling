import 'package:flutter/material.dart';

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
      child: Column(
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
                setState(() {
                  currentTabIndex = 0;
                });
                openCloseDrawer();
              }),
          Divider(
            color: Colors.white,
          ),
          ListTile(
              leading: Icon(Icons.person),
              title: Text("User Profile"),
              onTap: () {
                setState(() {
                  currentTabIndex = 1;
                });
                openCloseDrawer();
              }),
          Divider(
            color: Colors.white,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Copyright © 2021 | MakCounsel',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  List<Widget> tabs = [
    Home(),
    UserInfoScreen(),
  ];

  int currentTabIndex = 0;

  void openCloseDrawer() {
    if (_openDrawer.currentState.isDrawerOpen) {
      _openDrawer.currentState.openEndDrawer();
    } else {
      _openDrawer.currentState.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _showDrawer(),
      key: _openDrawer,
      appBar: AppBar(
        title: Text("MakCounsel"),
      ),
      body: tabs[currentTabIndex],
    );
  }
}

//  GlobalKey<ScaffoldState> _openDrawer = GlobalKey<ScaffoldState>();
//   Drawer _showDrawer() {
//     return Drawer(
//         child: Container(
//       color: Colors.blueGrey,
//       child: Column(
//         children: [
//           ListTile(
//               leading: Icon(Icons.home_rounded),
//               title: Text("Home"),
//               onTap: () {
//                 setState(() {
//                   currentTabIndex = 0;
//                 });
//                 openCloseDrawer();
//               }),
//           Divider(
//             color: Colors.white,
//           ),
//           ListTile(
//               leading: Icon(Icons.person),
//               title: Text("SUBMIT FOUND ITEM"),
//               onTap: () {
//                 setState(() {
//                   currentTabIndex = 1;
//                 });
//                 openCloseDrawer();
//               }),
//           Divider(
//             color: Colors.white,
//           ),
//           ListTile(
//               leading: Icon(Icons.person),
//               title: Text("SEARCH LOST ITEM"),
//               onTap: () {
//                 setState(() {
//                   currentTabIndex = 2;
//                 });
//                 openCloseDrawer();
//               }),
//           Divider(
//             color: Colors.white,
//           ),
//           ListTile(
//               leading: Icon(Icons.person),
//               title: Text("REVIEW RECENT POSTS"),
//               onTap: () {
//                 setState(() {
//                   currentTabIndex = 3;
//                 });
//                 openCloseDrawer();
//               }),
//           Expanded(
//             child: Align(
//               alignment: Alignment.bottomCenter,
//               child: Text(
//                 'Copyright © 2021 | Finda',
//                 style: TextStyle(
//                   color: Colors.blueGrey[300],
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     ));
//   }

//   List<Widget> tabs = [
//     Homemobile(),
//     SubmitItem(),
//     SearchingPoint(),
//     Container(),
//   ];

//   int currentTabIndex = 0;

//   void openCloseDrawer() {
//     if (_openDrawer.currentState.isDrawerOpen) {
//       _openDrawer.currentState.openEndDrawer();
//     } else {
//       _openDrawer.currentState.openDrawer();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       endDrawer: _showDrawer(),
//       key: _openDrawer,
//       appBar: AppBar(
//         title: Text("Finda"),
//       ),
//       body: tabs[currentTabIndex],
//     );
//   }
