import 'package:flutter/material.dart';
import 'package:travelmoz/custimizado/cityBox.dart';
import 'package:travelmoz/teste/teste.dart';

import '../../custimizado/appbarcustimi.dart';

class HomePage extends StatelessWidget {
  Testezonha icnnn = Testezonha();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 252, 247, 247),
        appBar: const CustomAppBar(
          title: Text(
            "ESCOLHA UMA ZONA DO PAIS",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Helvetica Neue',
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
        ),
        drawer: Drawer(),
        body: ListView.builder(
          itemCount: icnnn.data.length,
          itemBuilder: (context, index) {
            var cidades = [];
            for (var city in icnnn.data[index]['provincias']) {
              cidades.addAll(city['cidade']);
            }
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "${icnnn.data[index]['nome']} (${icnnn.data[index]['provincias'].length})",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Ver Cidade"),
                    ),
                  ],
                ),
                Container(
                    height: 130,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: icnnn.data.length,
                      itemBuilder: (context, cidadeInx) {
                        return CityBox(
                          datas: cidades[cidadeInx],
                          onTap: () {},
                        );
                      },
                    ))
              ],
            );
          },
        ));
  }
}

/*Container(
                          width: 130,
                          height: 130,
                          color: Colors.yellow,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Text(cidades[cidadeInx]['nome']),
                        );*/