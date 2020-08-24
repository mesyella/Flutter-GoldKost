import 'dart:async';

import 'package:flutter/material.dart';
import 'package:goldkost/Template/colors.dart';
import 'package:goldkost/Pages/detailKamar.dart';
import 'package:goldkost/Pages/cekKamar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:goldkost/Template/Floor.dart';

final FirebaseDatabase db = FirebaseDatabase.instance;

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
  List Datas;

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

  int countIsi(a) {
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

  int countKosong(a) {
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

  Widget showData() {
    if (_floorList.length > 0) {
      Datas = makeDatas(_floorList);
      totalIsi = countIsi(Datas);
      totalKosong = countKosong(Datas);
      return Column(
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
                    builder: (context) =>
                        cekKamar(
                          floorList: Datas,
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
                moveToDetail(context);
              },
            ),
          ),
        ],
      );
    }
    else
      return Padding(
        padding: const EdgeInsets.only(top: 180.0),
        child: Center(
            child: Column(
          children: <Widget>[
            Icon(
              Icons.refresh,
              color: white,
              size: 70,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Loading Data',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: white,
              ),
            ),
          ],
        ),),
      );
  }

  Future moveToDetail(context) async {
    var _datas = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => detailKamar(
          datas: Datas,
        ),
      ),
    );
    updateData(_datas);
  }

  void updateData(List _datas) {
    setState(() {
      Datas = _datas;
      totalIsi = countIsi(_datas);
      totalKosong = countKosong(_datas);
    });
  }

  List makeDatas(_floorList) {
    List floorList1 = _floorList[0].room;
    List floorList2 = _floorList[1].room;
    List floorList3 = _floorList[2].room;
    List datas = List(3);
    datas[0] = floorList1;
    datas[1] = floorList2;
    datas[2] = floorList3;
    return datas;
  }

  @override
  Widget build(BuildContext context) {
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
                  0.1303 * MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: navy,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(150),
                ),
              ),
              child: showData(),
            )
          ],
        ),
      ),
    );
  }
}
