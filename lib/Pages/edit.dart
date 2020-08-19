import 'package:flutter/material.dart';
import 'package:goldkost/Template/colors.dart';

class edit extends StatefulWidget {
  final String lantaiberapa;
  edit(this.lantaiberapa);
  @override
  _editState createState() => _editState();

}

class _editState extends State<edit> {
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
                    bottomRight: Radius.circular(150)),
              ),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30,20,0,0),
                    child: Text(
                      '03',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 100,
                    child: FlatButton(
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
                  Positioned(
                    bottom: 30,
                    child: FlatButton(
                      onPressed: (){
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
