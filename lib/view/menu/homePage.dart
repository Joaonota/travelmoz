import 'package:flutter/material.dart';
import 'package:travelmoz/custimizado/Drawer/drawerCustimizado.dart';
import 'package:travelmoz/custimizado/cidade/cityBox.dart';

import 'package:travelmoz/teste/teste.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        drawer: drawerCutimizado(),
        body: const CityBox());
  }
}

/*
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
physics: const BouncingScrollPhysics(),
        itemCount: 15,
        itemExtent: 350,
        padding: EdgeInsets.symmetric(horizontal: 20),



Container(
                          width: 130,
                          height: 130,
                          color: Colors.yellow,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Text(cidades[cidadeInx]['nome']),
                        );*/