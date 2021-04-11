import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:ogr_takip/homeworks/homeworkDetails.dart';
import 'package:ogr_takip/teacher/homeworkAdd.dart';
import 'package:ogr_takip/component/component.dart';

class StudentHomePage extends StatefulWidget {
  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[300],
          title: Text('Anasayfa'),
        ),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.pink[300],
          items: [
            TabItem(icon: Icons.home, title: 'Anasayfa'),
            TabItem(icon: Icons.add, title: 'Ödevi Yükle'),
            TabItem(icon: Icons.settings, title: 'Ayarlar'),
          ],
          initialActiveIndex: 1,
          onTap: (int i) => Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomeworkAddPage())),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: <Widget>[
                    Padding(padding: EdgeInsets.all(10.0)),
                    CardWidget(
                      title: 'Matematik',
                      colour: Colors.yellow[100],
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeworkDetailsPage()));
                      },
                    ),
                    CardWidget(
                        title: 'Fen Bilgisi',
                        colour: Colors.pink[100],
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeworkDetailsPage()));
                        }),
                    CardWidget(
                        title: 'Sosyal Bilimler',
                        colour: Colors.blue[100],
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeworkDetailsPage()));
                        }),
                    CardWidget(
                      colour: Colors.green[100],
                      title: 'Türkçe',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeworkDetailsPage()));
                      },
                    ),
                  ])),
            ],
          ),
        ));
  }
}
