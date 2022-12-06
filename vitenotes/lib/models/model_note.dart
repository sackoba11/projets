import 'package:firebase_database/firebase_database.dart';

class ModelNote {
  late String uid;
  late String title;
  late String texte;
  late String date;
  late String status;

  ModelNote(DataSnapshot snapshot) {
    uid = snapshot.key!;
    texte = snapshot.child("texte").value.toString();
    title = snapshot.child("title").value.toString();
    date = snapshot.child("date").value.toString();
    status = snapshot.child("status").value.toString();
  }
}
