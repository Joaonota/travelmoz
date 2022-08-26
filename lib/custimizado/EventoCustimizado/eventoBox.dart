// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelmoz/fireBase/firestores.dart';
import 'package:travelmoz/models/eventos.dart';
import 'package:travelmoz/models/moz.dart';

import '../../view/detalhes/evento/detalheEvento.dart';

class EventoBox extends StatefulWidget {
  const EventoBox({Key? key, required this.moz}) : super(key: key);
  final Moz moz;

  @override
  State<EventoBox> createState() => _EventoBoxtate();
}

class _EventoBoxtate extends State<EventoBox> {
  Firestore firestore = Firestore();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.queryevento(widget.moz.cidade),
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
            child: Text("SEM DADOS ou ESSES DADOS FORAM EXCLUIDOS"),
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
              Eventos evento = Eventos.fromdocument(documentSnapshot);
              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(evento.fotos[0]),
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                        Colors.black26, BlendMode.darken),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(evento.nomeEvento,
                          style: GoogleFonts.abhayaLibre(
                              color: Colors.white, fontSize: 25)),
                    ),
                    const Spacer(
                      flex: 10,
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 147, 206, 255),
                            borderRadius: BorderRadius.circular(12)),
                        child: TextButton(
                          style: const ButtonStyle(),
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, animation, __) =>
                                    FadeTransition(
                                  opacity: animation,
                                  child: DetalheEvento(
                                    evento: evento,
                                    screnHeigh:
                                        MediaQuery.of(context).size.height,
                                  ),
                                ),
                              ),
                            );
                          },
                          child: const Text(" Mais Detalhes"),
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
