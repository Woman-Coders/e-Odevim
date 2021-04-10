import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ogr_takip/teacher/teacherHomePage.dart';

class HomeworkAddPage extends StatefulWidget {
  @override
  _HomeworkAddPageState createState() => _HomeworkAddPageState();
}

class _HomeworkAddPageState extends State<HomeworkAddPage> {
  final _detailConroller = TextEditingController();
  final _selectedDateTime = TextEditingController();
  String newValue;
  String _dropdownValue = '5. Sınıf';
  String _dropdownValue2 = 'Türkçe';
  final _formKey = GlobalKey<FormState>();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void dispose() {
    _detailConroller.dispose();
    _selectedDateTime.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Ödev Ekle'),
        ),
        body: Stack(children: <Widget>[
/////////////////////  ARKADAKİ RENK VE ÖNPLANDAKİ BEYAZ CONTAINER  ////////////////////////
          Container(
            color: Colors.yellow[200],
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
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Form(
                            key: _formKey,
                            child:
                                Padding(padding: const EdgeInsets.all(30.0))),
                        TextField(
                          keyboardType: TextInputType.text,
                          maxLines: null,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            prefixIcon: Icon(Icons.edit),
                            labelText: 'Ödev Detayı Giriniz...',
                          ),
                          controller: _detailConroller,
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                        ),
                        DateTimeFormField(
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.black45),
                            errorStyle: TextStyle(color: Colors.redAccent),
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.event_note),
                            labelText: 'Ödev teslim tarihi giriniz...',
                          ),
                          autovalidateMode: AutovalidateMode.always,
                          validator: (e) => (e?.day ?? 0) == 1
                              ? 'yeniden tarih seçiniz...'
                              : null,
                          onDateSelected: (DateTime selectDateController) {
                            print(selectDateController);
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                        ),
                        Row(
                          children: [
                            Text('Sınıf Seçiniz : '),
                            Padding(
                              padding: EdgeInsets.only(right: 20.0),
                            ),
                            DropdownButton<String>(
                              value: _dropdownValue,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  _dropdownValue = newValue;
                                });
                              },
                              items: <String>[
                                '5. Sınıf',
                                '6. Sınıf',
                                '7. Sınıf',
                                '8. Sınıf'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                        ),
                        Row(
                          children: [
                            Text('Ders Seçiniz : '),
                            Padding(
                              padding: EdgeInsets.only(right: 20.0),
                            ),
                            DropdownButton<String>(
                              value: _dropdownValue2,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String newValue2) {
                                setState(() {
                                  _dropdownValue2 = newValue2;
                                });
                              },
                              items: <String>[
                                'Türkçe',
                                'Matematik',
                                'Sosyal Bilimler',
                                'Fen Bilimler'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        /*       SignInButtonBuilder(
                          key: ,
                            icon: Icons.add,
                            iconColor: Colors.black,
                            text: 'Doküman Ekle',
                            textColor: Colors.black,
                            onPressed: () => {

                            },
                            backgroundColor: Colors.pink[100]),
                 */
                        Padding(
                          padding: EdgeInsets.all(15.0),
                        ),
                        RaisedButton(
                            child: Text('Ödevi Gönder'),
                            textColor: Colors.white,
                            color: Colors.indigo,
                            onPressed: () {}),
                      ],
                    ),
                  ),
                ),
              )),
            ),
          )
        ]));
  }

  void homeworkAdd() async {
    var veriEkle = <String, dynamic>{};
    veriEkle['odevDetayi'] = _detailConroller.text;
    veriEkle['teslimTarihi'] = _selectedDateTime.toString();
    veriEkle['sinif'] = _dropdownValue;
    veriEkle['ders'] = _dropdownValue2;
    //    veriEkle['dokuman'] = newValue;
    debugPrint('buraya kadar sorun yok');

    if (_detailConroller.text == _detailConroller.text) {
      _firestore.collection('odevler').doc().set(veriEkle);

      debugPrint('odev eklendi');
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => TeacherHomePage()));
    } else {
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('ödev eklenemedi'),
                content: Text('bir sorun oluştu tekrar dene'),
                actions: <Widget>[
                  FlatButton(
                      child: Text('Kapat'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      })
                ]);
          });
    }
  }
}
