import 'package:flutter/material.dart';
import 'package:goldkost/Template/colors.dart';
import 'package:goldkost/Pages/cekKamarDetail.dart';

class cekKamar extends StatefulWidget {
  List floorList;

  cekKamar({this.floorList});

  @override
  _cekKamarState createState() => _cekKamarState(floorList);
}

class _cekKamarState extends State<cekKamar> {
  List floorList;

  _cekKamarState(this.floorList);

  Future moveToCekKamarDetail(context, i) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => cekKamarDetail(
                lantaiberapa: i,
                floorList: floorList[i - 1]['room'],
              )),
    );
  }

  Widget pilihLantai(int lantai) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 70, 0),
      child: InkWell(
        child: Container(
          child: Center(
            child: Text(
              'Lantai $lantai',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20,
                color: navy,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          height: 40,
          width: 270,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(150),
                bottomRight: Radius.circular(150)),
          ),
        ),
        onTap: () {
          moveToCekKamarDetail(context, lantai);
        },
      ),
    );
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
                        size: 25,
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
                  0.16 * MediaQuery.of(context).size.height,
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
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      itemCount: floorList.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (floorList.length > 0) {
                          return pilihLantai(index + 1);
                        }
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
