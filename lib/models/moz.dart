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
    this.cidade = documentSnapshot['cidade'];
  }
}
