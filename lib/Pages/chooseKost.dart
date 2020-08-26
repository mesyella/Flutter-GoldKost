import 'dart:async';
import 'package:flutter/material.dart';
import 'package:goldkost/Template/colors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:goldkost/Template/Kost.dart';
import 'package:goldkost/Pages/homePage.dart';

final FirebaseDatabase db = FirebaseDatabase.instance;

class chooseKost extends StatefulWidget {
  @override
  _chooseKostState createState() => _chooseKostState();
}

class _chooseKostState extends State<chooseKost> {
  List<Kost> _kostList;
  Query _kostQuery;
  StreamSubscription<Event> _onKostAddedSubscription;

  onEntryAdded(Event kost) {
    setState(() {
      _kostList.add(Kost.fromSnapshot(kost.snapshot));
    });
  }

  @override
  void initState() {
    _kostList = new List();
    _kostQuery = db.reference().child("kost").orderByChild("kostID");
    _onKostAddedSubscription = _kostQuery.onChildAdded.listen(onEntryAdded);
    super.initState();
  }

  Future moveToHome(context, kostlist, gk) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => homePage(
          floorList: kostlist,
          gk: gk,
        ),
      ),
    );
  }

  Widget showKost() {
    if (_kostList.length > 0)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Text(
                'Pilih Kost',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: navy,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: FlatButton(
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: navy, borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Gold Kost 1',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  moveToHome(context, _kostList[0].floor, 'GK1');
                },
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: FlatButton(
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: navy, borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Gold Kost 2',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  moveToHome(context, _kostList[1].floor, 'GK2');
                },
              ),
            ),
          )
        ],
      );
    else
      return Padding(
        padding: const EdgeInsets.only(top: 180.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Icon(
                Icons.refresh,
                color: navy,
                size: 70,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Loading Data',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: navy,
                ),
              ),
            ],
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navy,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(220, 10, 0, 30),
              child: Text(
                'Gold Kost',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: white,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height -
                  0.1303 * MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(150),
                ),
              ),
              child: showKost(),
            )
          ],
        ),
      ),
    );
  }
}
