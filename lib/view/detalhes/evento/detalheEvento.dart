// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelmoz/custimizado/EventoCustimizado/DetalheAnimacaoEvento.dart';
import 'package:travelmoz/custimizado/cidade/buildPersist.dart';
import 'package:travelmoz/models/eventos.dart';

class DetalheEvento extends StatefulWidget {
  const DetalheEvento(
      {Key? key, required this.evento, required this.screnHeigh})
      : super(key: key);
  final Eventos evento;
  final double screnHeigh;

  @override
  State<DetalheEvento> createState() => _DetalheEventolState();
}

class _DetalheEventolState extends State<DetalheEvento> {
  late ScrollController _controller;
  @override
  void initState() {
    super.initState();
    _controller = ScrollController(initialScrollOffset: widget.screnHeigh * .3);
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      controller: _controller,
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: BuldPesisTets(
              maxExtent: MediaQuery.of(context).size.height,
              minExtent: 240,
              builder: (percent) {
                return DetalheAnimacaoEvento(
                  topPercet: ((1 - percent) / .7).clamp(0.0, 1.0),
                  bootmPercet: (percent / .3).clamp(0.0, 1.0),
                  evento: widget.evento,
                );
              }),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.black26,
                    ),
                    Flexible(
                      child: Text(widget.evento.nomeEvento,
                          style: GoogleFonts.allertaStencil()),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Data do Evento " + widget.evento.data,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Pre-Venda " + widget.evento.prevenda,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Na Porta " + widget.evento.vendaNolocal,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.evento.descricao,
                  style: GoogleFonts.oswald(),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Mais Detalhes"),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
