import 'package:flutter/material.dart';
import 'package:goldkost/Template/colors.dart';
import 'package:goldkost/Pages/edit.dart';




Widget detailKamar(String floor, bool isi) {
  return Container(
    height: 130,
    width: 100,
    decoration: BoxDecoration(
      color: navy,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: isi ? green : red, width: 5),
    ),
    child: Center(
      child: Text(
        '$floor',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: white,
        ),
      ),
    ),
  );
}

Widget name(String nama){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Nama:',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: navy,
        ),
      ),
      Text(
        '$nama',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 25,
          color: navy,
        ),
      ),
    ],
  );
}

Widget phone(String telpon){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Nomor Telepon:',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: navy,
        ),
      ),
      Text(
        '$telpon',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 25,
          color: navy,
        ),
      ),
    ],
  );
}

Widget tanggal(String tgl){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Mulai sewa:',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: navy,
        ),
      ),
      Text(
        '$tgl',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 25,
          color: navy,
        ),
      ),
    ],
  );
}

Widget detailKamarChosen(floor) {
  return Container(
    height: 130,
    width: 100,
    decoration: BoxDecoration(
      color: white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: Text(
        '$floor',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: navy,
        ),
      ),
    ),
  );
}

class lantaiPage extends StatefulWidget {
  final String lantaiberapa;

  lantaiPage({this.lantaiberapa});

  @override
  _lantaiPageState createState() => _lantaiPageState();
}

class _lantaiPageState extends State<lantaiPage> {
  String number = '01';
  String nama = 'aaaaaa';
  String nomorTelepon = '11111111';
  String mulaiSewa = '1 Agustus 2020';

  changeData(String room) {
    setState(() {
      number = room;
    });
  }
  changeName(String a) {
    setState(() {
      nama = a;
    });
  }
  changePhone(String a) {
    setState(() {
      nomorTelepon = a;
    });
  }
  changeDate(String a){
    setState(() {
      mulaiSewa = a;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navy,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: InkWell(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: white,
                        size: 30,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                    child: Text(
                      'Lantai ' + widget.lantaiberapa,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          FlatButton(
                            child: detailKamar('01', true),
                            onPressed: () {
                              //db.child('floor').set('');
                              changeData('01');
                              changeName('aaa');
                              changePhone('1111');
                              changeDate('1 Agustus 2020');
                            },
                          ),
                          FlatButton(
                            child: detailKamar('02', false),
                            onPressed: () {
                              changeData('02');
                              changeName('bbb');
                              changePhone('2222');
                              changeDate('2 Agustus 2020');
                            },
                          ),
                          FlatButton(
                            child: detailKamar('03', true),
                            onPressed: () {
                              changeData('03');
                              changeName('ccc');
                              changePhone('333');
                              changeDate('3 Agustus 2020');
                            },
                          ),
                          FlatButton(
                            child: detailKamar('04', true),
                            onPressed: () {
                              changeData('04');
                              changeName('dddd');
                              changePhone('4444');
                              changeDate('4 Agustus 2020');
                            },
                          ),
                          FlatButton(
                            child: detailKamar('05', true),
                            onPressed: () {
                              changeData('05');
                              changeName('eee');
                              changePhone('5555');
                              changeDate('5 Agustus 2020');
                            },
                          ),
                          FlatButton(
                            child: detailKamar('06', false),
                            onPressed: () {
                              changeData('06');
                              changeName('fff');
                              changePhone('66666');
                              changeDate('6 Agustus 2020');
                            },
                          ),
                          FlatButton(
                            child: detailKamar('07', true),
                            onPressed: () {
                              changeData('07');
                              changeName('ggg');
                              changePhone('7777');
                              changeDate('7 Agustus 2020');
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                height: MediaQuery.of(context).size.height -
                    0.41 * MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(150),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30,20,0,0),
                  child: Stack(
                    children: <Widget>[
                      Text(
                        '$number',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: navy,
                        ),
                      ),
                      Positioned(top: 80,child: name('$nama')),
                      Positioned(top: 170,child: phone('$nomorTelepon')),
                      Positioned(top: 260,child: tanggal('$mulaiSewa')),
                      Positioned(
                        bottom: 20,
                        child: FloatingActionButton(
                          backgroundColor: navy,
                          child: Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      edit(widget.lantaiberapa, number)),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
