// ignore_for_file: file_names
 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelmoz/custimizado/HotelCustimizado/DetalheAnimacaoHotel.dart';
import 'package:travelmoz/custimizado/cidade/buildPersist.dart';
import 'package:travelmoz/models/hotel.dart';

class DetalheHotel extends StatefulWidget {
  const DetalheHotel({Key? key, required this.hotel, required this.screnHeigh})
      : super(key: key);
  final Hotel hotel;
  final double screnHeigh;

  @override
  State<DetalheHotel> createState() => _DetalheHotelState();
}

class _DetalheHotelState extends State<DetalheHotel> {
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
                return DetalheAnimacaoHotel(
                  topPercet: ((1 - percent) / .7).clamp(0.0, 1.0),
                  bootmPercet: (percent / .3).clamp(0.0, 1.0),
                  hotel: widget.hotel,
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
                      child: Text(widget.hotel.nome,
                          style: GoogleFonts.allertaStencil()),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.hotel.descricao,
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
