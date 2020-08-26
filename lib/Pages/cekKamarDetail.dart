import 'package:flutter/material.dart';
import 'package:goldkost/Template/colors.dart';

class cekKamarDetail extends StatefulWidget {
  final int lantaiberapa;
  List floorList;

  cekKamarDetail({this.floorList, this.lantaiberapa});

  @override
  _cekKamarDetailState createState() => _cekKamarDetailState(floorList);
}

class _cekKamarDetailState extends State<cekKamarDetail> {
  int isi = 0;
  int kosong = 0;
  List floorList;

  _cekKamarDetailState(this.floorList);

  void banyak(List a) {
    isi = 0;
    kosong = 0;
    for (var dt in a)
      if (dt['status'] == 'isi')
        isi++;
      else
        kosong++;
  }

  bool cekIsi(var status) {
    if (status == 'isi') {
      return true;
    } else {
      return false;
    }
  }

  Widget kamarCek(String nomor, bool isi) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          color: navy,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 40,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Kamar $nomor",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: isi ? green : red,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    banyak(floorList);
    return Scaffold(
      backgroundColor: navy,
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
                        color: white,
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
                      'Lantai ' + widget.lantaiberapa.toString(),
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '$isi',
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
                      '$kosong',
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
            SizedBox(
              height: 40,
            ),
            Container(
              height: MediaQuery.of(context).size.height -
                  0.323 * MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(150),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 60, 90, 30),
                child: Container(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      itemCount: floorList.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (floorList.length > 0) {
                          return kamarCek(floorList[index]['roomID'].toString(),
                              cekIsi(floorList[index]['status'].toString()));
                        } else {
                          return Container();
                        }
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
