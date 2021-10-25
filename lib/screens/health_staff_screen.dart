import 'package:flutter/material.dart';
import 'package:guidance_and_counselling/components/RoundedInputField.dart';
import 'package:guidance_and_counselling/screens/chat_screen.dart';

class HealthStaffScreen extends StatefulWidget {
  @override
  _HealthStaffScreenState createState() => _HealthStaffScreenState();
}

class _HealthStaffScreenState extends State<HealthStaffScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MakCounsel"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 3.0),
          searchBox(),
          SizedBox(height: 3.0),
          Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.blueGrey[100],
                      child: new InkWell(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ChatScreen()),
                              (Route<dynamic> route) => true);
                        },
                        child: Row(
                          children: [
                            Expanded(
                                flex: 4,
                                child: CircleAvatar(
                                  radius: 65.0,
                                  backgroundImage:
                                      AssetImage("assets/images/profile.jpg"),
                                )),
                            Expanded(
                                flex: 8,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(5, 12, 5, 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 7.0,
                                      ),
                                      Text(
                                        "Mr. Health Counsellor",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 25.0,
                                          color: Colors.orange,
                                        ),
                                      ),
                                      Text(
                                        "healthcounsellor.gmail.com",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 25.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ); //card stops here
                  })),
          SizedBox(height: 5.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            alignment: Alignment.bottomCenter,
            child: Text(
              "Vocation Guidance Counsellors",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          ),
          SizedBox(height: 10.0),
        ],
      )),
    );
  }

  //Ui Components
  searchBox() {
    return RoundedInputField(
      icon: Icons.search_outlined,
      hintText: "Name of Counsellor",
    );
  }
}
