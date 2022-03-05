import 'package:cloud_firestore/cloud_firestore.dart';

class Moz {
  String? cidade;
  String? descricao;
  String? fotoPM;
  String? presidenteM;
  List<String>? distritos;
  List<String>? fotos;
  List<String>? linguas;

  Moz();

  Moz.fromDocumentSnapShot(DocumentSnapshot documentSnapshot) {
    cidade = documentSnapshot['cidade'];
    fotoPM = documentSnapshot['fotoPM'];
    presidenteM = documentSnapshot['presidenteM'];
    fotos = List<String>.from(documentSnapshot['fotos']);
  }
}
