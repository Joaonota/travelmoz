import 'package:flutter/material.dart';

class Prereload extends StatefulWidget {
  const Prereload({Key? key}) : super(key: key);

  @override
  _PrereloadState createState() => _PrereloadState();
}

class _PrereloadState extends State<Prereload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xfff8f9fa),
              Color(0xfff8f9fa),
            ])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo/logo.png",
                width: 300,
              ),
              const Text(
                "TRAVEL MOZ",
                style: TextStyle(
                    fontSize: 30,
                    color: Color(0xff336b87),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
