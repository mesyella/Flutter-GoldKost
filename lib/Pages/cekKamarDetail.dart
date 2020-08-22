import 'package:flutter/material.dart';
import 'package:goldkost/Template/colors.dart';

Widget kamarCek(String nomor, bool isi) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Container(
      decoration: BoxDecoration(
        color: navy,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 70,
      width: 320,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 100, 0),
            child: Text(
              "Kamar $nomor",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: white,
              ),
            ),
          ),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: isi ? green : red,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ],
      ),
    ),
  );
}


class cekKamarDetail extends StatefulWidget {
  final String lantaiberapa;
  int isi;
  int kosong;
  List floorList;

  cekKamarDetail({this.floorList, this.lantaiberapa, this.isi, this.kosong});

  @override
  _cekKamarDetailState createState() => _cekKamarDetailState();
}

class _cekKamarDetailState extends State<cekKamarDetail> {
  bool cekIsi(var status){
    if(status == 'isi'){
      return true;
    }
    else{
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.fromLTRB(0, 10, 20, 30),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Column(
                    children: <Widget>[
                      Text(
                        widget.isi.toString(),
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
                      widget.kosong.toString(),
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
            SizedBox(
              height: 40,
            ),
            Container(
              height: MediaQuery.of(context).size.height -
                  0.293 * MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(150),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 70, 0, 0),
                child: Container(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          kamarCek('0' + widget.floorList[0]['roomID'].toString(), cekIsi(widget.floorList[0]['status'].toString())),
                          kamarCek('0' + widget.floorList[1]['roomID'].toString(), cekIsi(widget.floorList[1]['status'].toString())),
                          kamarCek('0' + widget.floorList[2]['roomID'].toString(), cekIsi(widget.floorList[2]['status'].toString())),
                          kamarCek('0' + widget.floorList[3]['roomID'].toString(), cekIsi(widget.floorList[3]['status'].toString())),
                          kamarCek('0' + widget.floorList[4]['roomID'].toString(), cekIsi(widget.floorList[4]['status'].toString())),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
