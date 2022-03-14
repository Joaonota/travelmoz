import 'package:flutter/material.dart';

import '../../custimizado/hotelBox.dart';

class Listahotel extends StatelessWidget {
  const Listahotel({Key? key}) : super(key: key);

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
      body: const HotelBox(),
    );
  }
}
