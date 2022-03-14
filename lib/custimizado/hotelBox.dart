import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelmoz/models/moz.dart';
import 'package:travelmoz/view/detalhes/detalhes.dart';

import '../fireBase/firestores.dart';

class HotelBox extends StatefulWidget {
  const HotelBox({Key? key}) : super(key: key);

  @override
  State<HotelBox> createState() => _HotelBoxtate();
}

class _HotelBoxtate extends State<HotelBox> {
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemExtent: 350,
            physics: const BouncingScrollPhysics(),
            itemCount: snapshot.data!.size,
            itemBuilder: (context, index) {
              List<DocumentSnapshot> mozs = snapshot.data!.docs.toList();
              DocumentSnapshot documentSnapshot = mozs[index];
              Moz moz = Moz.fromDocumentSnapShot(documentSnapshot);

              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      moz.fotos![0],
                    ),
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                        Colors.black26, BlendMode.darken),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text("${moz.cidade}",
                          style: GoogleFonts.abhayaLibre(
                              color: Colors.white, fontSize: 25)),
                    ),
                    const Spacer(),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 147, 206, 255),
                            borderRadius: BorderRadius.circular(12)),
                        child: TextButton.icon(
                          icon: FaIcon(FontAwesomeIcons.tiktok),
                          style: const ButtonStyle(),
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, animation, __) =>
                                    FadeTransition(
                                  opacity: animation,
                                  child: Detalhes(
                                    moz: moz,
                                    screnHeigh:
                                        MediaQuery.of(context).size.height,
                                  ),
                                ),
                              ),
                            );
                          },
                          label: const Text("FAzer Reserva"),
                          /*  child: Text(
                            "Fazer Reserva",
                            style: GoogleFonts.abrilFatface(
                                color: const Color.fromARGB(255, 27, 27, 27)),
                          ),*/
                        ),
                      ),
                    ),
                    const Spacer(),
                    TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.heart,
                          color: Colors.red,
                        ),
                        label: const Text("0"))
                  ],
                ),
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