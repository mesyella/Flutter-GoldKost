import 'package:flutter/material.dart';
import 'package:goldkost/Template/colors.dart';
import 'package:goldkost/Pages/homePage.dart';
import 'package:goldkost/Pages/cekKamarDetail.dart';

class cekKamar extends StatelessWidget {
  List floorList1;
  List floorList2;
  List flootList3;
  int isi1 = 0;
  int isi2 =0;
  int isi3 =0;
  int kosong1 = 0;
  int kosong2 = 0;
  int kosong3 = 0;
  cekKamar({this.floorList1, this.floorList2, this.flootList3,this.isi1, this.isi2, this.isi3, this.kosong1, this.kosong2, this.kosong3});
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => cekKamarDetail(
                                lantaiberapa: '1', floorList: floorList1,isi: isi1, kosong: kosong1,
                              )),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
                    child: InkWell(
                      child: pilihLantai('2'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => cekKamarDetail(
                                lantaiberapa: '2',floorList: floorList2 ,isi: isi2, kosong: kosong2,
                              )),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
                    child: InkWell(
                      child: pilihLantai('3'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => cekKamarDetail(
                                lantaiberapa: '3',floorList: flootList3, isi: isi3, kosong: kosong3,
                              )),
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
