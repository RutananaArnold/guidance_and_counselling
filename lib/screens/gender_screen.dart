import 'package:flutter/material.dart';
import 'package:guidance_and_counselling/components/TabLabel.dart';

class GenderScreen extends StatefulWidget {
  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5.0,
            ),
            TabLabel(
              label: 'Brief Description',
              color: Colors.orange,
              align: Alignment.center,
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
              child: Text(
                'Welcome to the Gender Mainstreaming Directorate, Makerere University.The Gender Mainstreaming Directorate is the Secretariat for the Makerere University Gender Mainstreaming Programme.The Makerere University Gender Mainstreaming Programme was approved by Senate and Council in 2000/2001. Since 2000, institutionalization of gender as a cross cutting theme, has been a priority area in the University’s Strategic Plans. The University’s Strategic Plan (2007/08- 2018/19), recognizes that the cross cutting themes (Quality Assurance, Gender Mainstreaming and ICT) impact on the activities of the University and form the basis of investment in higher education at all levels. Therefore, Makerere University has made deliberate efforts to integrate the cross cutting themes into both her core and support functions and at the same time providing an environment that ensures their growth and consolidation. The mandate of the Gender Mainstreaming Directorate is to mainstream gender in the University functions of teaching and learning; research and innovations; knowledge transfer partnerships and networking and support services.',
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TabLabel(
              label: 'Get in touch',
              color: Colors.orange,
              align: Alignment.center,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
              child: Text(
                'Level 4, Senate Building, Makerere Unviersity Kampala \n Contact:  +25675 5797130  \n E-mail: director@gendermainstreaming.mak.ac.ug',
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TabLabel(
              label: 'Raise your Issue',
              color: Colors.orange,
              align: Alignment.center,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Write your Issue',
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 3.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Column(
                    children: [
                      FloatingActionButton(
                          onPressed: () {
                            print('send button tapped');
                          },
                          child: const Icon(Icons.send))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
