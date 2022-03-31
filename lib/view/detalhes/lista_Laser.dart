// ignore: file_names
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../custimizado/lazerCustimizado/lazerBox.dart';
import '../../models/moz.dart';

class ListaLaser extends StatelessWidget {
  const ListaLaser({Key? key, required this.moz}) : super(key: key);
  final Moz moz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: const [
            Text(
              "LOCAIS DE LAZER",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 4,
            ),
            Icon(
              FontAwesomeIcons.cocktail,
              size: 20,
              color: Colors.green,
            )
          ],
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 252, 247, 247),
      ),
      body: LazerBox(
        moz: moz,
      ),
    );
  }
}
