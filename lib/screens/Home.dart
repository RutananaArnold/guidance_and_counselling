import 'package:flutter/material.dart';
import 'package:guidance_and_counselling/components/ReusableCard.dart';
import 'package:guidance_and_counselling/components/ReusableCardContent.dart';
import 'package:guidance_and_counselling/screens/CouncillorsScreen.dart';
import 'package:guidance_and_counselling/screens/GenderScreen.dart';
import 'package:guidance_and_counselling/screens/HealthStaffScreen.dart';
import 'package:guidance_and_counselling/components/TabLabel.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TabLabel(
            label: 'Timely Updates',
            color: Colors.orange,
            align: Alignment.center,
          ),
          timelyUpdates(),
          TabLabel(
            label: 'What service do you need ?',
            color: Colors.orange,
            align: Alignment.center,
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        cardChild: ReusableCardContent(
                          icon: Icons.group_outlined,
                          label: 'Counsellors',
                        ),
                        action: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CouncillorsScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        cardChild: ReusableCardContent(
                          icon: Icons.local_hospital_rounded,
                          label: 'Health Staff',
                        ),
                        action: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  HealthStaffScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  cardChild: ReusableCardContent(
                    icon: Icons.account_box_rounded,
                    label: 'Gender Main Streaming and Directorate Center',
                  ),
                  action: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => GenderScreen(),
                      ),
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  timelyUpdates() {
    return Container(
        child: CarouselSlider(
      options: CarouselOptions(
        height: 200,
        scrollDirection: Axis.horizontal,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: [1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                // color: kappPrimary,
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage("assets/images/guidancepic.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              height: 200.0,
              width: MediaQuery.of(context).size.width * 0.9,
            );
          },
        );
      }).toList(),
    ));
  }
}
