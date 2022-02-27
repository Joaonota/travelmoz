import 'package:flutter/material.dart';
import 'package:travelmoz/custimizado/cityBox.dart';
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
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 15,
        itemExtent: 350,
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          return CityBox();
        },
      ),
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