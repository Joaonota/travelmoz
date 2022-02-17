import 'package:flutter/material.dart';

import '../../custimizado/appbarcustimi.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 247, 247),
      appBar: const CustomAppBar(
        title: Text(
          "ESCOLHA  ZONA DO PAIS",
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Helvetica Neue',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text("Zona Norte (3)"),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Ver Cidades"),
              ),
            ],
          ),
          Container(
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  color: Colors.red,
                  width: 130,
                  height: 130,
                  margin: EdgeInsets.only(left: 10, right: 10),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
