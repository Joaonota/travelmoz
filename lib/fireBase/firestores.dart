import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  //intanciar a colecao do fireSore
  CollectionReference moz = FirebaseFirestore.instance.collection("moz");
  CollectionReference hotelMoz = FirebaseFirestore.instance.collection("hotel");
  CollectionReference LazerMoz = FirebaseFirestore.instance.collection("lazer");
  collection() => moz;

  Stream<QuerySnapshot> queryHotel(query) {
    return hotelMoz.where('cidade', isEqualTo: query).snapshots();
  }

  Stream<QuerySnapshot> queryLazer(query) {
    return LazerMoz.where('cidade', isEqualTo: query).snapshots();
  }
}
