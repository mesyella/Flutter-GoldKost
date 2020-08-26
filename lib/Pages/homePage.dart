import 'dart:async';
import 'package:flutter/material.dart';
import 'package:goldkost/Template/colors.dart';
import 'package:goldkost/Pages/detailKamar.dart';
import 'package:goldkost/Pages/cekKamar.dart';
import 'package:firebase_database/firebase_database.dart';

final FirebaseDatabase db = FirebaseDatabase.instance;

class homePage extends StatefulWidget {
  List floorList;
  String gk;

  homePage({this.floorList, this.gk});

  @override
  _homePageState createState() => _homePageState(floorList, gk);
}

class _homePageState extends State<homePage> {
  List _floorList;
  String gk;
  int totalIsi = 0;
  int totalKosong = 0;

  _homePageState(this._floorList, this.gk);

  int countIsi(a) {
    totalIsi = 0;
    for (int i = 0; i < a.length; i++) {
      for (var dt in a[i]['room']) {
        if (dt['status'] == 'isi') {
          totalIsi++;
        }
      }
    }
    return totalIsi;
  }

  int countKosong(a) {
    totalKosong = 0;
    for (int i = 0; i < a.length; i++) {
      for (var dt in a[i]['room']) {
        if (dt['status'] == 'kosong') {
          totalKosong++;
        }
      }
    }
    return totalKosong;
  }

  Widget showData() {
    totalIsi = countIsi(_floorList);
    totalKosong = countKosong(_floorList);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 0, 15),
          child: Text(
            'Kamar',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 25,
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
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: green,
                    ),
                  ),
                  Text(
                    'terisi',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 10,
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
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: red,
                  ),
                ),
                Text(
                  'kosong',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 10,
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
              height: 70,
              width: 270,
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
                    floorList: _floorList,
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
              height: 70,
              width: 270,
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

  Future moveToDetail(context) async {
    var _datas = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => detailKamar(
          datas: _floorList,
          gk: gk,
        ),
      ),
    );
    updateData(_datas);
  }

  void updateData(List _datas) {
    setState(() {
      _floorList = _datas;
      totalIsi = countIsi(_datas);
      totalKosong = countKosong(_datas);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 30),
                    child: InkWell(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: navy,
                        size: 20,
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
                    padding: const EdgeInsets.fromLTRB(0, 10, 20, 30),
                    child: Text(
                      'Gold Kost',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: navy,
                      ),
                    ),
                  ),
                ),
              ],
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
