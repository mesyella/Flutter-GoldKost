import 'package:flutter/material.dart';
import 'package:goldkost/Template/colors.dart';
import 'package:goldkost/Pages/homePage.dart';
import 'package:goldkost/Pages/dataKamar.dart';

class detailKamar extends StatefulWidget {
  List datas;

  detailKamar({this.datas});

  @override
  _detailKamarState createState() => _detailKamarState(datas);
}

class _detailKamarState extends State<detailKamar> {
  List datas;

  _detailKamarState(this.datas);

  Future moveToData(context, lantai) async {
    var _datas = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => lantaiPage(
                lantaiberapa: lantai,
                floorList: datas[lantai-1],
              )),
    );
    updateData(_datas, lantai);
  }

  void updateData(List _datas, lantai) {
    setState(() {
      datas[lantai-1] = _datas;
    });
  }

  @override
  Widget build(BuildContext context) {
    String a = datas[0][0]['name'].toString();
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
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 50),
                    child: InkWell(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: navy,
                        size: 30,
                      ),
                      onTap: () {
                        Navigator.pop(context, datas);
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 20, 50),
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
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height -
                  0.167 * MediaQuery.of(context).size.height,
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
                    padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
                    child: Text(
                      'Daftar Kamar',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
                    child: InkWell(
                      child: pilihLantai('1'),
                      onTap: () {
                        moveToData(context, 1);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
                    child: InkWell(
                      child: pilihLantai('2'),
                      onTap: () {
                       moveToData(context, 2);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
                    child: InkWell(
                      child: pilihLantai('3'),
                      onTap: () {
                       moveToData(context, 3);
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
