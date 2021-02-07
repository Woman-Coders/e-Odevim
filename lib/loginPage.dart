import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:ogr_takip/student/studentLoginPage.dart';
import 'package:ogr_takip/teacher/teacherLoginPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final parolaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
/////////////////////  ARKADAKİ RENK VE ÖNPLANDAKİ BEYAZ CONTAINER  ////////////////////////
      Container(
        color: Colors.lightBlueAccent,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
              child: Container(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      child: Image.asset('assets/13.png'),
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Text('e-Ödevim Uygulamasına  Hoş Geldiniz...',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        textAlign: TextAlign.center),
                  ),
                  SignInButtonBuilder(
                      icon: Icons.person,
                      text: 'Öğretmen Girişi',
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TeacherLoginPage())),
                      backgroundColor: Colors.indigo),
                  SignInButtonBuilder(
                      icon: Icons.person_pin,
                      text: 'Öğrenci Girişi',
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentLoginPage())),
                      backgroundColor: Colors.pink[400]),
                ],
              ),
            ),
          )),
        ),
      ),
    ]));
  }
}
