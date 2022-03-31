import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelmoz/custimizado/cidade/buildPersist.dart';
import 'package:travelmoz/custimizado/lazerCustimizado/DeatalhesAnimacaoLazer.dart';
import 'package:travelmoz/models/lazer.dart';

class DetalhesLazer extends StatefulWidget {
  const DetalhesLazer({Key? key, required this.lazer, required this.screnHeigh})
      : super(key: key);
  final Lazer lazer;
  final double screnHeigh;

  @override
  State<DetalhesLazer> createState() => _DetalhesLazerState();
}

class _DetalhesLazerState extends State<DetalhesLazer> {
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
                return DetalheAnimacaoLazer(
                  topPercet: ((1 - percent) / .7).clamp(0.0, 1.0),
                  bootmPercet: (percent / .3).clamp(0.0, 1.0),
                  lazer: widget.lazer,
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
                      child: Text(widget.lazer.nome,
                          style: GoogleFonts.allertaStencil()),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.lazer.descricao,
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
