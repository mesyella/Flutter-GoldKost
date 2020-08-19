import 'package:flutter/material.dart';
import 'package:goldkost/Template/colors.dart';
import 'package:goldkost/Pages/lantai.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(220, 10, 0, 5),
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
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height -
                  0.131 * MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: navy,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(150),
                    bottomRight: Radius.circular(150)),
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
                              '25',
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
                            '5',
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
                    padding: const EdgeInsets.fromLTRB(30, 30, 0, 30),
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
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 30),
                    child: InkWell(
                      child: pilihLantai('1'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => lantaiPage(lantaiberapa: '1',)),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 30),
                    child: InkWell(
                      child: pilihLantai('2'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => lantaiPage(lantaiberapa: '2',)),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 30),
                    child: InkWell(
                      child: pilihLantai('3'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => lantaiPage(lantaiberapa: '3',)),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 30),
                    child: InkWell(
                      child: pilihLantai('4'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => lantaiPage(lantaiberapa: '4',)),
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
