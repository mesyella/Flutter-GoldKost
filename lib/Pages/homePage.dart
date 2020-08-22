import 'dart:async';

import 'package:flutter/material.dart';
import 'package:goldkost/Template/colors.dart';
import 'package:goldkost/Pages/detailKamar.dart';
import 'package:goldkost/Pages/cekKamar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:goldkost/Template/Floor.dart';

final FirebaseDatabase db = FirebaseDatabase.instance;

Widget pilihLantai(lantai) {
  return Container(
    child: Center(
      child: Text(
        'Lantai $lantai',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 25,
          color: navy,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    height: 50,
    width: 320,
    decoration: BoxDecoration(
      color: white,
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(150), bottomRight: Radius.circular(150)),
    ),
  );
}

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<Floor> _floorList;
  Query _floorQuery;
  StreamSubscription<Event> _onFloorAddedSubscription;
  int totalIsi = 0;
  int totalKosong = 0;

  onEntryAdded(Event floor) {
    setState(() {
      _floorList.add(Floor.fromSnapshot(floor.snapshot));
    });
  }

  @override
  void initState() {
    _floorList = new List();
    _floorQuery = db.reference().child("floor").orderByChild("floorID");
    _onFloorAddedSubscription = _floorQuery.onChildAdded.listen(onEntryAdded);
    super.initState();
  }

  int countIsi(List room, int isi, int kosong) {
    isi = 0;
    for (var dt in room) {
      if (dt['status'] == 'isi') {
        isi++;
      } else if (dt['status'] == 'kosong') {
        kosong++;
      }
    }
    return isi;
  }

  int countKosong(List room, int kosong) {
    kosong = 0;
    for (var dt in room) {
      if (dt['status'] == 'kosong') {
        kosong++;
      }
    }
    return kosong;
  }

  int banyakIsi(a) {
    if (a.length > 0) {
      totalIsi = 0;
      for (int i = 0; i < 3; i++) {
        for (var dt in a[i]) {
          if (dt['status'] == 'isi') {
            totalIsi++;
          }
        }
      }
    }
    return totalIsi;
  }

  int banyakKosong(a) {
    if (a.length > 0) {
      totalKosong = 0;
      for (int i = 0; i < 3; i++) {
        for (var dt in a[i]) {
          if (dt['status'] == 'kosong') {
            totalKosong++;
          }
        }
      }
    }
    return totalKosong;
  }

  Future moveToDetail(context, datas) async {
    var _datas = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => detailKamar(
          datas: datas,
        ),
      ),
    );
    updateData(_datas);
  }

  void updateData(List _datas) {
    setState(() {
      _floorList = _datas;
      totalIsi = banyakIsi(_datas);
      totalKosong = banyakKosong(_datas);
    });
  }

  @override
  Widget build(BuildContext context) {
    List floorList1 = _floorList[0].room;
    List floorList2 = _floorList[1].room;
    List floorList3 = _floorList[2].room;
    var datas = List(3);
    datas[0] = floorList1;
    datas[1] = floorList2;
    datas[2] = floorList3;
    totalIsi = banyakIsi(datas);
    totalKosong = banyakKosong(datas);
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(220, 10, 0, 25),
              child: Text(
                'Gold Kost',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: navy,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height -
                  0.131 * MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: navy,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(150),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 30, 0, 15),
                    child: Text(
                      'Kamar',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(70, 0, 60, 0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              '$totalIsi',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: green,
                              ),
                            ),
                            Text(
                              'terisi',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: green,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            '$totalKosong',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: red,
                            ),
                          ),
                          Text(
                            'kosong',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: red,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 40, 0, 0),
                    child: FlatButton(
                      child: Container(
                        height: 100,
                        width: 300,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Cek Kamar',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: navy,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => cekKamar(
                              floorList: datas,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 40, 0, 0),
                    child: FlatButton(
                      child: Container(
                        height: 100,
                        width: 300,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Detail Kamar',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: navy,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => detailKamar(
                              datas: datas,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
