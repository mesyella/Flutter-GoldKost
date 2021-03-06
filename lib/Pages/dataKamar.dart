import 'package:flutter/material.dart';
import 'package:goldkost/Template/colors.dart';
import 'package:goldkost/Pages/edit.dart';

class lantaiPage extends StatefulWidget {
  final int lantaiberapa;
  List floorList;
  String gk;

  lantaiPage({this.lantaiberapa, this.floorList, this.gk});

  @override
  _lantaiPageState createState() => _lantaiPageState(floorList, gk);
}

class _lantaiPageState extends State<lantaiPage> {
  List floorList;
  List kamar = List(7);
  int index = 0;
  String gk;
  String nama;
  String nomorTelepon;
  String mulaiSewa;
  String status;
  String roomID;

  _lantaiPageState(this.floorList, this.gk);

  @override
  void initState() {
    nama = floorList[0]['name'].toString();
    nomorTelepon = floorList[0]['phone'].toString();
    mulaiSewa = floorList[0]['date'].toString();
    status = floorList[0]['status'].toString();
    roomID = floorList[0]['roomID'].toString();
    floorList = floorList;
    super.initState();
  }

  bool cekIsi(var status) {
    if (status == 'isi') {
      return true;
    } else {
      return false;
    }
  }

  changeData(int a) {
    index = a;
  }

  changeRoomID(String a) {
    setState(() {
      roomID = a;
    });
  }

  changeName(String a) {
    setState(() {
      nama = a;
    });
  }

  changePhone(String a) {
    setState(() {
      nomorTelepon = a;
    });
  }

  changeDate(String a) {
    setState(() {
      mulaiSewa = a;
    });
  }

  changeStatus(String a) {
    setState(() {
      status = a;
    });
  }

  Future moveToEdit() async {
    var _kamar = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => edit(kamar, gk)));
    updateKamar(_kamar);
  }

  void updateKamar(List _kamar) {
    setState(() {
      floorList[_kamar[6]]['name'] = _kamar[2];
      floorList[_kamar[6]]['phone'] = _kamar[3];
      floorList[_kamar[6]]['date'] = _kamar[4];
      floorList[_kamar[6]]['status'] = _kamar[5];
    });
    changeRoomID(floorList[_kamar[6]]['roomID'].toString());
    changeName(floorList[_kamar[6]]['name'].toString());
    changePhone(floorList[_kamar[6]]['phone'].toString());
    changeDate(floorList[_kamar[6]]['date'].toString());
  }

  Widget detailKamar(String floor, bool isi) {
    return Container(
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: navy,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: isi ? green : red, width: 5),
      ),
      child: Center(
        child: Text(
          '$floor',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: white,
          ),
        ),
      ),
    );
  }

  Widget name(String nama) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nama:',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: navy,
          ),
        ),
        Text(
          '$nama',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
            color: navy,
          ),
        ),
      ],
    );
  }

  Widget phone(String telpon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nomor Telepon:',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: navy,
          ),
        ),
        Text(
          '$telpon',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
            color: navy,
          ),
        ),
      ],
    );
  }

  Widget tanggal(String tgl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Mulai sewa:',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: navy,
          ),
        ),
        Text(
          '$tgl',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
            color: navy,
          ),
        ),
      ],
    );
  }

  Widget buttonRoom(int index, List floorList) {
    return FlatButton(
      child: detailKamar(floorList[index]['roomID'].toString(),
          cekIsi(floorList[index]['status'].toString())),
      onPressed: () {
        changeRoomID(floorList[index]['roomID'].toString());
        changeName(floorList[index]['name'].toString());
        changePhone(floorList[index]['phone'].toString());
        changeDate(floorList[index]['date'].toString());
        changeData(index);
      },
    );
  }

  List makeKamar(room) {
    kamar[0] = widget.lantaiberapa;
    kamar[1] = floorList[room]['roomID'];
    kamar[2] = floorList[room]['name'].toString();
    kamar[3] = floorList[room]['phone'].toString();
    kamar[4] = floorList[room]['date'].toString();
    kamar[5] = floorList[room]['status'].toString();
    kamar[6] = room;
    return kamar;
  }

  @override
  Widget build(BuildContext context) {
    kamar = makeKamar(index);
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
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: WillPopScope(
                      onWillPop: () async => false,
                      child: InkWell(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: white,
                          size: 25,
                        ),
                        onTap: () {
                          Navigator.pop(context, floorList);
                        },
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                    child: Text(
                      'Lantai ' + widget.lantaiberapa.toString(),
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: floorList.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (floorList.length > 0) {
                      return buttonRoom(index, floorList);
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                height: MediaQuery.of(context).size.height -
                    0.38 * MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(150),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                  child: Stack(
                    children: <Widget>[
                      Text(
                        '$roomID',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: navy,
                        ),
                      ),
                      Positioned(top: 80, child: name('$nama')),
                      Positioned(top: 170, child: phone('$nomorTelepon')),
                      Positioned(top: 260, child: tanggal('$mulaiSewa')),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: FloatingActionButton(
                          backgroundColor: navy,
                          child: Icon(Icons.edit),
                          onPressed: () {
                            moveToEdit();
                          },
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
