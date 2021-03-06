import 'package:cloud_firestore/cloud_firestore.dart';

class Moz {
  String? cidade;
  String? descricao;
  String? fotoPM;
  String? presidenteM;
  String? cityTemp;

  List<String>? distritos;
  List<String>? fotos;
  List<String>? linguas;
  List<String>? likes;

  Moz();

  Moz.fromDocumentSnapShot(DocumentSnapshot documentSnapshot) {
    cidade = documentSnapshot['cidade'];
    fotoPM = documentSnapshot['fotoPM'];
    descricao = documentSnapshot['descricao'];
    cityTemp = documentSnapshot['cityTemp'];
    presidenteM = documentSnapshot['presidenteM'];
    fotos = List<String>.from(documentSnapshot['fotos']);
    likes = List<String>.from(documentSnapshot['likes']);
    linguas = List<String>.from(documentSnapshot['linguas']);
  }
}
