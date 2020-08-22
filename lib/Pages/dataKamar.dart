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

Widget name(String nama) {
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

Widget phone(String telpon) {
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

Widget tanggal(String tgl) {
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

class lantaiPage extends StatefulWidget {
  final int lantaiberapa;
  List floorList;

  lantaiPage({this.lantaiberapa, this.floorList});

  @override
  _lantaiPageState createState() => _lantaiPageState(floorList);
}

class _lantaiPageState extends State<lantaiPage> {
  List kamar = List(6);
  int room = 1;
  List floorList;

  _lantaiPageState(this.floorList);

  String nama;
  String nomorTelepon;
  String mulaiSewa;
  String status;

  @override
  void initState() {
    nama = floorList[0]['name'].toString();
    nomorTelepon = floorList[0]['phone'].toString();
    mulaiSewa = floorList[0]['date'].toString();
    status = floorList[0]['status'].toString();
    floorList = floorList;
    super.initState();
  }

  bool cekIsi(var status) {
    if (status == 'isi') {
      return true;
    } else {
      return false;
    }
  }

  changeData(int a) {
    setState(() {
      room = a;
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

  changeDate(String a) {
    setState(() {
      mulaiSewa = a;
    });
  }

  changeStatus(String a) {
    setState(() {
      status = a;
    });
  }

  Future moveToEdit() async {
    var _kamar = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => edit(kamar)));
    updateKamar(_kamar);
  }

  void updateKamar(List _kamar) {
    setState(() {
      floorList[_kamar[1] - 1]['name'] = _kamar[2];
      floorList[_kamar[1] - 1]['phone'] = _kamar[3];
      floorList[_kamar[1] - 1]['date'] = _kamar[4];
      floorList[_kamar[1] - 1]['status'] = _kamar[5];
    });
    changeData(_kamar[1]);
    changeName(floorList[_kamar[1] - 1]['name'].toString());
    changePhone(floorList[_kamar[1] - 1]['phone'].toString());
    changeDate(floorList[_kamar[1] - 1]['date'].toString());
  }

  @override
  Widget build(BuildContext context) {
    kamar[0] = widget.lantaiberapa;
    kamar[1] = floorList[room - 1]['roomID'];
    kamar[2] = floorList[room - 1]['name'].toString();
    kamar[3] = floorList[room - 1]['phone'].toString();
    kamar[4] = floorList[room - 1]['date'].toString();
    kamar[5] = floorList[room - 1]['status'].toString();
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
                        Navigator.pop(context, floorList);
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                    child: Text(
                      'Lantai ' + widget.lantaiberapa.toString(),
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
                            child: detailKamar(
                                '0' + floorList[0]['roomID'].toString(),
                                cekIsi(floorList[0]['status'].toString())),
                            onPressed: () {
                              changeData(1);
                              changeName(floorList[0]['name'].toString());
                              changePhone(floorList[0]['phone'].toString());
                              changeDate(floorList[0]['date'].toString());
                            },
                          ),
                          FlatButton(
                            child: detailKamar(
                                '0' + floorList[1]['roomID'].toString(),
                                cekIsi(floorList[1]['status'].toString())),
                            onPressed: () {
                              changeData(2);
                              changeName(floorList[1]['name'].toString());
                              changePhone(floorList[1]['phone'].toString());
                              changeDate(floorList[1]['date'].toString());
                            },
                          ),
                          FlatButton(
                            child: detailKamar(
                                '0' + floorList[2]['roomID'].toString(),
                                cekIsi(floorList[2]['status'].toString())),
                            onPressed: () {
                              changeData(3);
                              changeName(floorList[2]['name'].toString());
                              changePhone(floorList[2]['phone'].toString());
                              changeDate(floorList[2]['date'].toString());
                            },
                          ),
                          FlatButton(
                            child: detailKamar(
                                '0' + floorList[3]['roomID'].toString(),
                                cekIsi(floorList[3]['status'].toString())),
                            onPressed: () {
                              changeData(4);
                              changeName(floorList[3]['name'].toString());
                              changePhone(floorList[3]['phone'].toString());
                              changeDate(floorList[3]['date'].toString());
                            },
                          ),
                          FlatButton(
                            child: detailKamar(
                                '0' + floorList[4]['roomID'].toString(),
                                cekIsi(floorList[4]['status'].toString())),
                            onPressed: () {
                              changeData(5);
                              changeName(floorList[4]['name'].toString());
                              changePhone(floorList[4]['phone'].toString());
                              changeDate(floorList[4]['date'].toString());
                            },
                          ),
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
                  padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                  child: Stack(
                    children: <Widget>[
                      Text(
                        '0' + room.toString(),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: navy,
                        ),
                      ),
                      Positioned(top: 80, child: name('$nama')),
                      Positioned(top: 170, child: phone('$nomorTelepon')),
                      Positioned(top: 260, child: tanggal('$mulaiSewa')),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: FloatingActionButton(
                          backgroundColor: navy,
                          child: Icon(Icons.edit),
                          onPressed: () {
                            moveToEdit();
                          },
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
