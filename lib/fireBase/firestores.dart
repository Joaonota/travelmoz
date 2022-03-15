import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  //intanciar a colecao do fireSore
  CollectionReference moz = FirebaseFirestore.instance.collection("moz");
  CollectionReference hotelMoz = FirebaseFirestore.instance.collection("hotel");
  collection() => moz;

  Stream<QuerySnapshot> querySnapshotsss(query) {
    return hotelMoz.where('cidade', isEqualTo: query).snapshots();
  }
}
