import 'package:flutter/material.dart';
import 'package:guidance_and_counselling/components/ReusableCard.dart';
import 'package:guidance_and_counselling/components/ReusableCardContent.dart';
import 'package:guidance_and_counselling/screens/councillors_screen.dart';
import 'package:guidance_and_counselling/screens/gender_screen.dart';
import 'package:guidance_and_counselling/screens/health_staff_screen.dart';
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
            label: 'What category of counsellors do you need ?',
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
                          icon: Icons.cast_for_education_rounded,
                          label: 'Career Counsellors',
                        ),
                        action: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CouncillorsScreen(),
                            ),
                            (Route<dynamic> route) => true,
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        cardChild: ReusableCardContent(
                          icon: Icons.volunteer_activism,
                          label: 'Vocation Guidance Counsellors',
                        ),
                        action: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  HealthStaffScreen(),
                            ),
                            (Route<dynamic> route) => true,
                          );
                        },
                      ),
                    )
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
                    label: 'Gender Main \n Streaming and \n Directorate Center',
                  ),
                  action: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) => GenderScreen(),
                      ),
                      (Route<dynamic> route) => true,
                    );
                  },
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: ReusableCardContent(
                    icon: Icons.local_hospital_rounded,
                    label: 'Mental Health Counsellors',
                  ),
                  // action: () {
                  //   Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //       builder: (BuildContext context) => GenderScreen(),
                  //     ),
                  //   );
                  // },
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  List carouselimages = [
    "assets/images/image1.jpg",
    "assets/images/image2.jpg",
    "assets/images/image3.gif"
  ];

  timelyUpdates() {
    return CarouselSlider.builder(
      itemCount: carouselimages.length,
      itemBuilder: (BuildContext context, int itemIndex, _) => Container(
        padding: EdgeInsets.all(20),
        child: Image.asset(
          carouselimages[itemIndex],
          fit: BoxFit.fill,
          width: double.infinity,
        ),
      ),
      options: CarouselOptions(
        height: 400,
        scrollDirection: Axis.horizontal,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        initialPage: 0,
        enlargeCenterPage: true,
      ),
    );
  }
}
