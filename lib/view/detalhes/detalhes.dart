import 'package:flutter/material.dart';
import 'package:travelmoz/custimizado/buildPersist.dart';
import 'package:travelmoz/custimizado/detalheAnimacao.dart';
import 'package:travelmoz/models/moz.dart';

class Detalhes extends StatefulWidget {
  const Detalhes({Key? key, required this.moz, required this.screnHeigh})
      : super(key: key);
  final Moz moz;
  final double screnHeigh;

  @override
  State<Detalhes> createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  late ScrollController _controller;
  @override
  void initState() {
    // TODO: implement initState
    _controller = ScrollController(initialScrollOffset: widget.screnHeigh * .3);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
                  return DetalheAnimacao(
                    topPercet: ((1 - percent) / .7).clamp(0.0, 1.0),
                    bootmPercet: (percent / .3).clamp(0.0, 1.0),
                    mozs: widget.moz,
                  );
                }),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.black26,
                    ),
                    Flexible(
                      child: Text(
                        "${widget.moz.cidade}",
                        style: const TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("${widget.moz.descricao}")
              ],
            ),
          )),
        ],
      ),
    );
  }
}
