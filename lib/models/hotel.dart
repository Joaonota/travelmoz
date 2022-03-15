import 'package:cloud_firestore/cloud_firestore.dart';

class Hotel {
  String? nome;
  String? cidade;
  List<String>? fotos;

  Hotel();
  Hotel.fromdocument(DocumentSnapshot documentSnapshot) {
    nome = documentSnapshot['nome'];
    cidade = documentSnapshot['cidade'];
    List<String>.from(documentSnapshot['fotos']);
  }
}
