import 'package:flutter/material.dart';
import 'package:guidance_and_counselling/components/AppTittle.dart';
import 'package:guidance_and_counselling/components/RoundedInputField.dart';
import 'package:guidance_and_counselling/screens/CategoryScreen.dart';

class CouncillorsScreen extends StatefulWidget {
  @override
  _CouncillorsScreenState createState() => _CouncillorsScreenState();
}

class _CouncillorsScreenState extends State<CouncillorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: AppTitle(), centerTitle: true),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 5.0),
            searchBox(),
            SizedBox(height: 5.0),
            Container(
                height: 500.0,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Categoryscreen()),
                              (Route<dynamic> route) => true);
                        },
                        child: Card(
                          color: Colors.grey[400],
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: CircleAvatar(
                                    radius: 65.0,
                                    backgroundImage:
                                        AssetImage("assets/images/profile.jpg"),
                                  )),
                              Expanded(
                                  flex: 7,
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
                                          "Name of Counsellor",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 25.0,
                                            color: Colors.orange,
                                          ),
                                        ),
                                        Text(
                                          "counsellor@gmail.com",
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
                "Councsellors",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
          ],
        )));
  }

  //Ui Components
  searchBox() {
    return RoundedInputField(
      icon: Icons.search_outlined,
      hintText: "Name of Counsellor",
    );
  }
}
