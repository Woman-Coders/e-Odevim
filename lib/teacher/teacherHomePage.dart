import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:ogr_takip/homeworks/5ClassDetail.dart';
import 'package:ogr_takip/homeworks/6ClassDetail.dart';
import 'package:ogr_takip/homeworks/7ClassDetail.dart';
import 'package:ogr_takip/homeworks/8ClassDetail.dart';
import 'package:ogr_takip/teacher/homeworkAdd.dart';
import 'package:ogr_takip/component/component.dart';

class TeacherHomePage extends StatefulWidget {
  @override
  _TeacherHomePageState createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Anasayfa'),
        ),
        bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(icon: Icons.home, title: 'Anasayfa'),
            TabItem(icon: Icons.add, title: 'Ödev Ekle'),
            TabItem(icon: Icons.settings, title: 'Ayarlar'),
          ],
          initialActiveIndex: 2,
          onTap: (int i) async => Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomeworkAddPage())),
        ),
        body: Container(
          color: Colors.white,
          child: Stack(
            children: [
              SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: <Widget>[
                    Padding(padding: EdgeInsets.all(32.0)),
                    Card(
                      elevation: 5.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FiveClassDetailsPage()));
                        },
                        child: Container(
                            color: Colors.yellow[100],
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '5. Sınıf',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                                ),
                              ),
                            )),
                      ),
                    ),
                    CardWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SixClassDetailsPage()));
                        },
                        colour: Colors.pink[100],
                        title: '6. Sınıf'),
                    CardWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SevenClassDetailsPage()));
                        },
                        colour: Colors.blue[100],
                        title: '7. Sınıf'),
                    CardWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EightClassDetailsPage()));
                        },
                        colour: Colors.green[100],
                        title: '8. Sınıf'),
                  ])),
            ],
          ),
        ));
  }
}
