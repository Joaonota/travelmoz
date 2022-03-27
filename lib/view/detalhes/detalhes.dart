import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelmoz/custimizado/cidade/buildPersist.dart';
import 'package:travelmoz/models/moz.dart';
import 'package:travelmoz/models/temperatura.dart';
import 'package:travelmoz/view/detalhes/lista_hotel.dart';
import 'package:http/http.dart' as http;

import '../../custimizado/cidade/detalheAnimacao.dart';
import 'lista_Laser.dart';

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
  late PageController pc;
  int conrentInt = 1;

  @override
  void initState() {
    _controller = ScrollController(initialScrollOffset: widget.screnHeigh * .3);
    pc = PageController(initialPage: conrentInt);
    //consuApi();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  onchanged(pagina) {
    setState(() {
      conrentInt = pagina;
    });
  }
/*
  Future<Temperatura> tempApi() async {
    final resposta = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=Tete,MZ&units=metric&lang=pt%27&appid=ff1ebd1bd18070938c751d8f6c625bbd'));
    if (resposta.statusCode == 200) {
      return Temperatura.fromJson(jsonDecode(resposta.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
*/
  //
  /*

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

  Future consuApi() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    print(response.body);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return print(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }*/
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (pag) {
          pc.animateToPage(pag,
              duration: const Duration(milliseconds: 500),
              curve: Curves.bounceOut);
        },
        currentIndex: conrentInt,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.cocktail),
            label: "LAZER",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.hotel,
              size: 20,
            ),
            label: "HOTEL",
          ),
        ],
      ),
      body: PageView(
        controller: pc,
        onPageChanged: onchanged,
        children: [
          const ListaLaser(),
          CustomScrollView(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
          Listahotel(
            moz: widget.moz,
          )
        ],
      ),
    );
  }
}


/*
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




*/

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