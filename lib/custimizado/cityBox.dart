import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travelmoz/models/moz.dart';

import '../fireBase/firestores.dart';

class CityBox extends StatefulWidget {
  const CityBox({Key? key}) : super(key: key);

  @override
  State<CityBox> createState() => _CityBoxState();
}

class _CityBoxState extends State<CityBox> {
  Firestore firestore = Firestore();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.moz.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Errro Ao Carregar Dados"),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData) {
          return const Center(
            child: Text("SEM DADOS"),
          );
        }

        return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              List<DocumentSnapshot> mozs = snapshot.data!.docs.toList();
              DocumentSnapshot documentSnapshot = mozs[index];
              Moz moz = Moz.fromDocumentSnapShot(documentSnapshot);
              return Container(
                child: Text("${moz.cidade}"),
              );
            });
      },
    );
  }
}







/*
return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
            image: NetworkImage(
              "https://upload.wikimedia.org/wikipedia/commons/6/6b/Bridge_over_the_Zambezi_at_Tete%2C_Mozambique.jpg",
            ),
            fit: BoxFit.cover,
            colorFilter:
                const ColorFilter.mode(Colors.black26, BlendMode.darken)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://s.rfi.fr/media/display/f9c0e24a-109e-11ea-8211-005056a99247/w:1024/p:16x9/01CESAR_DE_CARVALHO_31X07X625X230.webp"),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    "Cesar de Carvalho",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "skjskjd",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ))
            ],
          ),
          const Spacer(),
          const Text(
            "Cidade de Tete",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
*/