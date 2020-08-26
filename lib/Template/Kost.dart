import 'package:firebase_database/firebase_database.dart';

class Kost{
  String key;
  List floor;

  Kost({this.floor});
  Kost.fromSnapshot(DataSnapshot snapshot)
      :key = snapshot.key,
        floor = snapshot.value["floor"];

  toJson(){
    return{
      "floor": floor,
    };
  }
}