import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelmoz/custimizado/buildPersist.dart';
import 'package:travelmoz/custimizado/detalheAnimacao.dart';
import 'package:travelmoz/models/moz.dart';

class Detalhes extends StatefulWidget {
  const Detalhes(
      {Key? key, required this.moz, required this.screnHeigh, this.imageurl})
      : super(key: key);
  final Moz moz;
  final double screnHeigh;
  final List<String>? imageurl;

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
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.abc_sharp),
          label: "hotel",
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.hotel),
          label: "hotel",
        ),
      ]),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.black26,
                      ),
                      Flexible(
                        child: Text("${widget.moz.cidade}",
                            style: GoogleFonts.allertaStencil()),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${widget.moz.descricao}",
                    style: GoogleFonts.actor(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 147, 206, 255),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.hotel_outlined,
                                color: Colors.black,
                              ),
                              label: Row(
                                children: [
                                  Text(
                                    "Hotel (${widget.moz.fotos?.length})",
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  const Icon(Icons.arrow_forward),
                                ],
                              ))),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 147, 206, 255),
                            borderRadius: BorderRadius.circular(12)),
                        child: TextButton(
                          autofocus: true,
                          onPressed: () {},
                          child: Text(
                            "Lugares de Laser (${widget.moz.fotos?.length})",
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


 /*SliverToBoxAdapter(
            child: SizedBox(
              height: 180,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemExtent: 150,
                  itemCount: widget.moz.fotos?.length,
                  itemBuilder: (context, index) {
                    final lugares = widget.moz.fotos?[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          lugares!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
            ),
          ),*/