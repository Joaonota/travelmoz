import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  //intanciar a colecao do fireSore
  CollectionReference moz = FirebaseFirestore.instance.collection("moz");
  collection() => moz;
}
