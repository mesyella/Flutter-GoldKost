import 'package:flutter/material.dart';
import 'package:goldkost/Template/colors.dart';
import 'package:goldkost/Pages/detailKamar.dart';
import 'package:goldkost/Pages/cekKamarDetail.dart';

class cekKamar extends StatefulWidget {
  List floorList;
  cekKamar({this.floorList});
  @override
  _cekKamarState createState() => _cekKamarState(floorList);
}

class _cekKamarState extends State<cekKamar> {
  List floorList;
  List floorList1;
  List floorList2;
  List flootList3;
  _cekKamarState(this.floorList);
  List jumlahSemua = List(3);
  int isi;
  int kosong;

  Future moveToCekKamarDetail(context, i) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              cekKamarDetail(
                lantaiberapa: i, floorList: floorList[i - 1],
              )),
    );
  }


  @override
  void initState() {
     floorList1 = floorList[0];
     floorList2 = floorList[1];
     flootList3 = floorList[2];
    super.initState();
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
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 50),
                    child: InkWell(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: navy,
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
                      'Cek Kamar',
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
                        moveToCekKamarDetail(context, 1);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
                    child: InkWell(
                      child: pilihLantai('2'),
                      onTap: () {
                        moveToCekKamarDetail(context, 2);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
                    child: InkWell(
                      child: pilihLantai('3'),
                      onTap: () {
                        moveToCekKamarDetail(context, 3);
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


