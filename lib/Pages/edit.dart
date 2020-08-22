import 'package:flutter/material.dart';
import 'package:goldkost/Template/colors.dart';
import 'package:firebase_database/firebase_database.dart';

void saved(context) {
  showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (BuildContext bc) {
        return new Container(
            height: MediaQuery.of(context).size.height * 1 / 2,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.check_circle,
                      color: navy,
                      size: 100,
                    ),
                    Text(
                      "Data telah disimpan",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: navy,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FlatButton(
                      child: Container(
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: navy,
                        ),
                        child: Center(
                          child: Text(
                            'okay',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ));
      });
}

void deleted(context) {
  showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (BuildContext bc) {
        return new Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
            height: MediaQuery.of(context).size.height * 1 / 2,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.delete_sweep,
                      color: navy,
                      size: 100,
                    ),
                    Text(
                      "Data telah dihapus",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: navy,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FlatButton(
                      child: Container(
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: navy,
                        ),
                        child: Center(
                          child: Text(
                            'okay',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ));
      });
}

class edit extends StatefulWidget {
  final int lantaiberapa;
  int roomID;
  String nama;
  String nomorTelepon;
  String mulaiSewa;
  String status;

  edit(this.lantaiberapa, this.roomID, this.nama, this.nomorTelepon,
      this.mulaiSewa, this.status);

  @override
  _editState createState() =>
      _editState(nama, nomorTelepon, mulaiSewa, lantaiberapa, roomID);
}

class _editState extends State<edit> {
  String nama;
  String nomorTelepon;
  String mulaiSewa;
  int lantaiBerapa;
  int roomID;
  final key = new GlobalKey<FormState>();
  final FirebaseDatabase db = FirebaseDatabase.instance;

  _editState(this.nama, this.nomorTelepon, this.mulaiSewa, this.lantaiBerapa,
      this.roomID);

  @override
  void initState() {
    nama = nama;
    nomorTelepon = nomorTelepon;
    mulaiSewa = mulaiSewa;
    lantaiBerapa = lantaiBerapa - 1;
    roomID = roomID - 1;
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
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
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
                    padding: const EdgeInsets.fromLTRB(0, 10, 20, 20),
                    child: Text(
                      'Lantai ' + widget.lantaiberapa.toString(),
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
                  0.123 * MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: navy,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(150),
                ),
              ),
              child: Form(
                key: key,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                      child: Text(
                        '0' + widget.roomID.toString(),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: 30,
                      child: Text(
                        'Nama:',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 30,
                      right: 50,
                      child: TextFormField(
                        initialValue: nama,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25,
                          color: navy,
                        ),
                        decoration: InputDecoration(
                          fillColor: white,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value.length < 1)
                            return 'Invalid name';
                          else
                            return null;
                        },
                        onSaved: (value) {
                          nama = value;
                          db
                              .reference()
                              .child('floor/$lantaiBerapa/room/$roomID/name')
                              .set(value);
                        },
                      ),
                    ),
                    Positioned(
                      top: 210,
                      left: 30,
                      child: Text(
                        'Nomor Telepon:',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 250,
                      left: 30,
                      right: 50,
                      child: TextFormField(
                        initialValue: nomorTelepon,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25,
                          color: navy,
                        ),
                        decoration: InputDecoration(
                          fillColor: white,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value.length < 1)
                            return 'Invalid phone number';
                          else
                            return null;
                        },
                        onSaved: (value) {
                          nomorTelepon = value;
                          db
                              .reference()
                              .child('floor/$lantaiBerapa/room/$roomID/phone')
                              .set(value);
                        },
                      ),
                    ),
                    Positioned(
                      top: 330,
                      left: 30,
                      child: Text(
                        'Mulai Sewa:',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 370,
                      left: 30,
                      right: 50,
                      child: TextFormField(
                        initialValue: mulaiSewa,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25,
                          color: navy,
                        ),
                        decoration: InputDecoration(
                          fillColor: white,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value.length < 1)
                            return 'Invalid date';
                          else
                            return null;
                        },
                        onSaved: (value) {
                          mulaiSewa = value;
                          db
                              .reference()
                              .child('floor/$lantaiBerapa/room/$roomID/date')
                              .set(value);
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 90,
                      right: 170,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (key.currentState.validate()) {
                              key.currentState.save();
                              db
                                  .reference()
                                  .child('floor/$lantaiBerapa/room/$roomID/status')
                                  .set('isi');
                              saved(context);
                            }
                          });
                        },
                        child: Container(
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.save,
                              color: Colors.green,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 90,
                      right: 50,
                      child: InkWell(
                        onTap: () {
                          db
                              .reference()
                              .child('floor/$lantaiBerapa/room/$roomID/name')
                              .set('');
                          db
                              .reference()
                              .child('floor/$lantaiBerapa/room/$roomID/phone')
                              .set('');
                          db
                              .reference()
                              .child('floor/$lantaiBerapa/room/$roomID/date')
                              .set('');
                          db
                              .reference()
                              .child('floor/$lantaiBerapa/room/$roomID/status')
                              .set('kosong');
                          deleted(context);
                        },
                        child: Container(
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.delete,
                              color: red,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
