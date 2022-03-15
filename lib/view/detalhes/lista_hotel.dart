import 'package:flutter/material.dart';
import 'package:travelmoz/models/moz.dart';

import '../../custimizado/hotelBox.dart';

// ignore: must_be_immutable
class Listahotel extends StatelessWidget {
  Listahotel({Key? key, required this.moz}) : super(key: key);
  Moz moz;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "HOTEIS",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 252, 247, 247),
      ),
      body: HotelBox(
        moz: moz,
      ),
    );
  }
}
