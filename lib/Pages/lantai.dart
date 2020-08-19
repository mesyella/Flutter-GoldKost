import 'package:flutter/material.dart';
import 'package:goldkost/Template/colors.dart';
import 'package:goldkost/Pages/edit.dart';
import 'package:firebase_database/firebase_database.dart';

final  db = FirebaseDatabase.instance.reference();

Widget detailKamarisi(floor) {
  return Container(
    height: 130,
    width: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: green, width: 5),
    ),
    child: Center(
      child: Text(
        '$floor',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: white,
        ),
      ),
    ),
  );
}

Widget detailKamarkosong(floor) {
  return Container(
    height: 130,
    width: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: red, width: 5),
    ),
    child: Center(
      child: Text(
        '$floor',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: white,
        ),
      ),
    ),
  );
}

Widget detailKamarChosen(floor) {
  return Container(
    height: 130,
    width: 100,
    decoration: BoxDecoration(
      color: white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: Text(
        '$floor',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: navy,
        ),
      ),
    ),
  );
}

class lantaiPage extends StatefulWidget {
  final String lantaiberapa;
  lantaiPage({this.lantaiberapa});
  @override
  _lantaiPageState createState() => _lantaiPageState();
}

class _lantaiPageState extends State<lantaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navy,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20,10,0,0),
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
                    padding: const EdgeInsets.fromLTRB(0,10,20,0),
                    child: Text(
                      'Lantai '+ widget.lantaiberapa,
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
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          FlatButton(
                            child: detailKamarisi('01'),
                            onPressed: (){
                              db.child("floor").push();
                              print('aaa');
                            },
                          ),
                          FlatButton(
                            child: detailKamarkosong('02'),
                          ),
                          FlatButton(
                            child: detailKamarChosen('03'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                height: MediaQuery.of(context).size.height -
                    0.41 * MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(150),
                      bottomRight: Radius.circular(150)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                  child: Stack(
                    children: <Widget>[
                      Text(
                        '03',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: navy,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: navy,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        child: FloatingActionButton(
                          backgroundColor: navy,
                          child: Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => edit(widget.lantaiberapa)),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}


