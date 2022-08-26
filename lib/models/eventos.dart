import 'package:cloud_firestore/cloud_firestore.dart';

class Eventos {
  late String nomeEvento;
  late String localEvento;
  late List<String> fotos;
  late String descricao;
  late String propetario;
  late String vendaNolocal;
  late String cidade;
  late String prevenda;
  late String fotoPro;
  late String data;

  Eventos();
  Eventos.fromdocument(DocumentSnapshot documentSnapshot) {
    nomeEvento = documentSnapshot['nomeEvento'];
    localEvento = documentSnapshot['localEvento'];
    descricao = documentSnapshot['descricao'];
    propetario = documentSnapshot['propetario'];
    vendaNolocal = documentSnapshot['vendaNolocal'];
    prevenda = documentSnapshot['prevenda'];
    fotoPro = documentSnapshot['fotoPro'];
    data = documentSnapshot['data'];
    fotos = List<String>.from(documentSnapshot['fotos']);
  }
}
