import 'package:firebase_database/firebase_database.dart';

class MyUser {
  late String uid;
  late String nom;
  late String prenoms;
  late String numero;

  MyUser(DataSnapshot snapshot) {
    uid = snapshot.key!;
    Map map = snapshot.value as Map;
    nom = map["nom"];
    prenoms = map["prenoms"];
    numero = map["numero"];
  }
  Map toMap() {
    return {"prenoms": prenoms, "numero": numero, "nom": nom, "uid": uid};
  }
}
