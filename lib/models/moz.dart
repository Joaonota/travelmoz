import 'package:cloud_firestore/cloud_firestore.dart';

class Moz {
  String? cidade;
  String? descricao;
  String? fotoPM;
  String? presidenteM;
  List<String>? distritos;
  List<String>? fotos;
  List<String>? linguas;
  Map? lugares;

  Moz();

  Moz.fromDocumentSnapShot(DocumentSnapshot documentSnapshot) {
    cidade = documentSnapshot['cidade'];
    fotoPM = documentSnapshot['fotoPM'];
    descricao = documentSnapshot['descricao'];
    presidenteM = documentSnapshot['presidenteM'];
    //lugares = Map<String, String>.from(documentSnapshot['lugares']);
    fotos = List<String>.from(documentSnapshot['fotos']);
    linguas = List<String>.from(documentSnapshot['linguas']);
  }
}
