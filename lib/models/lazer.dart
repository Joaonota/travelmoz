import 'package:cloud_firestore/cloud_firestore.dart';

class Lazer {
  late String nome;
  late String cidade;
  late List<String> fotos;
  late String descricao;
  late double avaliacao;
  late bool verificado;

  Lazer();

  Lazer.fromDocumentSnapShot(DocumentSnapshot documentSnapshot) {
    nome = documentSnapshot['nome'];
    cidade = documentSnapshot['cidade'];
    descricao = documentSnapshot['descricao'];
    avaliacao = documentSnapshot['avaliacao'];
    verificado = documentSnapshot['verificado'];
    fotos = List<String>.from(documentSnapshot['fotos']);
  }
}
