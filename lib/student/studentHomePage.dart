import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:ogr_takip/homeworks/homeworkDetails.dart';
import 'package:ogr_takip/teacher/homeworkAdd.dart';

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
                    Card(
                      elevation: 5.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeworkDetailsPage()));
                        },
                        child: Container(
                            color: Colors.yellow[100],
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Matematik',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                                ),
                              ),
                            )),
                      ),
                    ),
                    Card(
                      elevation: 5.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeworkDetailsPage()));
                        },
                        child: Container(
                            color: Colors.pink[100],
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Fen Bilgisi',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                                ),
                              ),
                            )),
                      ),
                    ),
                    Card(
                      elevation: 5.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeworkDetailsPage()));
                        },
                        child: Container(
                            color: Colors.blue[100],
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Sosyal Bilimler',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                                ),
                              ),
                            )),
                      ),
                    ),
                    Card(
                      elevation: 5.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeworkDetailsPage()));
                        },
                        child: Container(
                            color: Colors.green[100],
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Türkçe',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                                ),
                              ),
                            )),
                      ),
                    ),
                  ])),
            ],
          ),
        ));
  }
}
