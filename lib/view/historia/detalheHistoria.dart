import 'package:flutter/material.dart';

class DetalheHistoria extends StatefulWidget {
  const DetalheHistoria({Key? key}) : super(key: key);

  @override
  State<DetalheHistoria> createState() => _DetalheHistoriaState();
}

class _DetalheHistoriaState extends State<DetalheHistoria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        SizedBox(
          height: 250,
          width: 250,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                "https://media.springernature.com/w580h326/nature-cms/uploads/collections/Networks-Collection-img-final-f2c265a59e457f48645e2aa3ff90e942.jpg",
              )),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Column(
            children: [
              Container(
                child: Text("25 de Setembro "),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text("Dia da Luta Armada "),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
