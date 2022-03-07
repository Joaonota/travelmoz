import 'package:flutter/material.dart';
import 'package:travelmoz/custimizado/buildPersist.dart';
import 'package:travelmoz/custimizado/detalheAnimacao.dart';
import 'package:travelmoz/models/moz.dart';

class Detalhes extends StatelessWidget {
  const Detalhes({Key? key, required this.moz}) : super(key: key);
  final Moz moz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
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
                    mozs: moz,
                  );
                }),
          ),
          const SliverToBoxAdapter(child: Placeholder()),
          const SliverToBoxAdapter(child: Placeholder()),
          const SliverToBoxAdapter(child: Placeholder()),
        ],
      ),
    );
  }
}
