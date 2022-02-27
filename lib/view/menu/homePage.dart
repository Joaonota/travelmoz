import 'package:flutter/material.dart';
import 'package:travelmoz/teste/teste.dart';

class HomePage extends StatelessWidget {
  Testezonha icnnn = Testezonha();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 247, 247),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color.fromARGB(255, 252, 247, 247),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Feed",
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: const Drawer(),
    );
  }
}

/*Container(
                          width: 130,
                          height: 130,
                          color: Colors.yellow,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Text(cidades[cidadeInx]['nome']),
                        );*/