import 'package:firebase_database/firebase_database.dart';

class Floor{
  String key;
  List room;

  Floor({this.room});
  Floor.fromSnapshot(DataSnapshot snapshot)
      :key = snapshot.key,
        room = snapshot.value["room"];

  toJson(){
    return{
      "room": room,
    };
  }
}