import 'package:flutter/material.dart';
import 'package:goldkost/Template/colors.dart';
import 'package:firebase_database/firebase_database.dart';

final db = FirebaseDatabase.instance.reference();

class edit extends StatefulWidget {
  final String lantaiberapa;
  final String nomorkamar;

  edit(this.lantaiberapa, this.nomorkamar);

  @override
  _editState createState() => _editState();
}

class _editState extends State<edit> {
  var apa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(270, 10, 0, 25),
              child: Text(
                'Lantai ' + widget.lantaiberapa,
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
                  0.131 * MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: navy,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(150),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                    child: Text(
                      widget.nomorkamar,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 100,
                    child: FlatButton(
                      onPressed: (){
                        db.child('1').once().then((DataSnapshot snapshot){
                          print('Data: ${snapshot.value}');
                          print(snapshot.key);
                          setState(() {
                            Map<dynamic,dynamic> values = snapshot.value;
                            values.forEach((key, value) { lists.add(values)})
                          });
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'save',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: navy,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    apa ?? '1', style: TextStyle(color: white),
                  ),
                  Positioned(
                    bottom: 30,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'cancel',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: navy,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
