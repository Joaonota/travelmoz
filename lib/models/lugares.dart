import 'package:cloud_firestore/cloud_firestore.dart';

class LugaresLaser {
  String? nome;
  List<String>? fotos;

  LugaresLaser.fromDocumetsSnap(DocumentSnapshot documentSnapshot) {
    nome = documentSnapshot['nome'];
    fotos = List<String>.from(documentSnapshot['fotos']);
  }
}
