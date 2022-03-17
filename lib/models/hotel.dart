import 'package:cloud_firestore/cloud_firestore.dart';

class Hotel {
  String? nome;
  String? cidade;
  List<String>? fotos;
  String? descricao;
  double? avaliacao;

  Hotel();
  Hotel.fromdocument(DocumentSnapshot documentSnapshot) {
    nome = documentSnapshot['nome'];
    cidade = documentSnapshot['cidade'];
    descricao = documentSnapshot['descricao'];
    avaliacao = documentSnapshot['avaliacao'];
    fotos = List<String>.from(documentSnapshot['fotos']);
  }
}
