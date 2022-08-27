import 'package:flutter/material.dart';

class Historia extends StatefulWidget {
  const Historia({Key? key}) : super(key: key);

  @override
  State<Historia> createState() => _HistoriaState();
}

class _HistoriaState extends State<Historia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 252, 247, 247),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Data Historicas",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      height: 60,
                      width: 60,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text("dia da Independicia"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text("dia da Independicia"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      height: 60,
                      width: 60,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text("dia da Independicia"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text("25 de Setembro"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
