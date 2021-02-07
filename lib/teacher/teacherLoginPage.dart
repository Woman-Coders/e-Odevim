import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ogr_takip/registerPage.dart';
import 'package:ogr_takip/teacher/teacherHomePage.dart';

class TeacherLoginPage extends StatefulWidget {
  @override
  _TeacherLoginPageState createState() => _TeacherLoginPageState();
}

class _TeacherLoginPageState extends State<TeacherLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final parolaController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    parolaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
/////////////////////  ARKADAKİ RENK VE ÖNPLANDAKİ BEYAZ CONTAINER  ////////////////////////
      Container(
        color: Colors.indigo,
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
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(' Öğretmen Girişine Hoş Geldiniz...',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                              textAlign: TextAlign.center),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40, bottom: 40, right: 20, left: 20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  maxLength: 25,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.account_circle),
                                      hintText: 'E-posta giriniz',
                                      labelText: 'E-posta',
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      filled: true,
                                      fillColor: Colors.indigo.shade100),
                                  controller: emailController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      Pattern pattern =
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                      RegExp regex = new RegExp(pattern);
                                      if (!regex.hasMatch(value))
                                        return 'Lütfen geçerli mail adresinizi giriniz!';
                                      else
                                        return null;
                                    }
                                  },
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  obscureText: true,
                                  maxLength: 16,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.vpn_key),
                                      hintText: 'Parolanızı giriniz',
                                      labelText: 'Parola',
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      filled: true,
                                      fillColor: Colors.indigo.shade100),
                                  controller: parolaController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Parola boş bırakılamaz!';
                                    } else if (value.length < 6) {
                                      return 'Parolanız 6 karakter veya daha uzun olmalıdır.';
                                    }
                                    return null;
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                      child: Text(
                                        'Şifremi Unuttum!',
                                        style: TextStyle(
                                            color: Colors.indigo[900],
                                            fontStyle: FontStyle.italic),
                                        textAlign: TextAlign.center,
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegisterPage()));
                                      }),
                                ),
                                RaisedButton(
                                  child: Text('Giriş yap'),
                                  textColor: Colors.white,
                                  color: Colors.indigo,
                                  onPressed: () {
                                    ///////////////////////////////     BUTON CLICK'TEKi AUTH DURUMU    /////////////////////////////////
                                    var formState = _formKey.currentState;

                                    if (formState.validate()) {
                                      _auth
                                          .signInWithEmailAndPassword(
                                              email: emailController.text,
                                              password: parolaController.text)
                                          .then((oturumAcildi) {
                                        debugPrint('Giriş başarılı');

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TeacherHomePage()));
                                        formState.reset();
                                      });
                                    }
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: InkWell(
                                      child: Text(
                                        'Üye değil misiniz? Hemen kayıt olun!',
                                        style: TextStyle(
                                            color: Colors.indigo[900],
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegisterPage()));
                                      }),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ))
    ]));
  }
}
