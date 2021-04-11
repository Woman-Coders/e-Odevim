import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ogr_takip/main.dart';

class LoginAndRegisterTheme extends StatefulWidget {
  @override
  _LoginAndRegisterThemeState createState() => _LoginAndRegisterThemeState();
}

class _LoginAndRegisterThemeState extends State<LoginAndRegisterTheme> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final kayitEmailController = TextEditingController();
  final kayitParolaController = TextEditingController();
  final isimController = TextEditingController();
  final parolaTekrarController = TextEditingController();
  bool hidePass = true;
  String forgotPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          /////////////////////  ARKADAKİ RENK VE ÖNPLANDAKİ BEYAZ CONTAINER  ////////////////////////
          Container(
            color: Colors.blue,
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
                ///////////////////////////////     CONTAINER ÜZERİNDEKİ KOMPONENTLER     /////////////////////////////////
                child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 50, bottom: 15),
                          child: Text(forgotPassword,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic),
                              textAlign: TextAlign.center),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 20, left: 30, right: 30),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Kullanıcı Adı *',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            controller: isimController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Kullanıcı adı Boş bırakılamaz!';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, bottom: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'E-mail *',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            controller: kayitEmailController,
                            validator: (value) {
                              if (value.isEmpty) {
                                Pattern pattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regex = new RegExp(pattern);
                                if (!regex.hasMatch(value))
                                  return 'Lütfen geçerli mail adresi giriniz!';
                                else
                                  return null;
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, bottom: 20),
                          child: TextFormField(
                            obscureText: hidePass,
                            decoration: InputDecoration(
                                hintText: 'Parola *',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            controller: kayitParolaController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Parola boş bırakılamaz!';
                              } else if (value.length < 6) {
                                return 'Parolanız en az 6 karakter uzunluğunda olmalıdır!';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, bottom: 20),
                          child: TextFormField(
                            obscureText: hidePass,
                            decoration: InputDecoration(
                                hintText: 'Parola Tekrar *',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            controller: parolaTekrarController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Parola boş bırakılamaz!';
                              } else if (value.length < 6) {
                                return 'Parolanız en az 6 karakter uzunluğunda olmalıdır!';
                              } else if (kayitParolaController.text != value) {
                                return 'Parolalar eşleşmiyor, lütfen kontrol ediniz.';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, bottom: 20),
                            child: ListTile(
                              leading: Icon(Icons.remove_red_eye),
                              title: Text('Şifreyi Göster'),
                              onTap: () {
                                setState(() {
                                  hidePass = false;
                                });
                              },
                            )),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 130, right: 130),
                          child: RaisedButton(
                            color: Colors.blue[500],
                            child: Text('Kayıt ol'),
                            onPressed: () {
                              
                            },
                          ),
                        )
                      ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
