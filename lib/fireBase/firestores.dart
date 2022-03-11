import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  //intanciar a colecao do fireSore
  CollectionReference moz = FirebaseFirestore.instance.collection("moz");
  CollectionReference lugarmoz =
      FirebaseFirestore.instance.collection("lugares");
  collection() => moz;

  Future<QuerySnapshot> querySnapshotsss(query) async {
    return await lugarmoz.where('nome', isEqualTo: "Cidade de Tete").get();
  }
}
