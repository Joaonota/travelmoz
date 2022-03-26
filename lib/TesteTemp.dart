import 'dart:convert' as convert;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travelmoz/models/temperatura.dart';
import 'package:http/http.dart' as http;

class TesteTemp extends StatefulWidget {
  const TesteTemp({Key? key}) : super(key: key);

  @override
  State<TesteTemp> createState() => _TesteTempState();
}

class _TesteTempState extends State<TesteTemp> {
  late Future<Temperatura> futureTemp;
  Future<Temperatura> tempApi() async {
    final resposta = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Tete,MZ&units=metric&lang=pt%27&appid=ff1ebd1bd18070938c751d8f6c625bbd'));
    if (resposta.statusCode == 200) {
      // final jsonResponse = convert.jsonDecode(resposta.body);
//final vvv = Temperatura.fromJson(jsonDecode(resposta.body));
      //   final lista = jsonResponse['main'];
      //print("esta lista" + jsonResponse);
      //return Temperatura.fromJson(jsonDecode(resposta.body));

      final jsonResponse = convert.jsonDecode(resposta.body);
      final lista = jsonResponse['main'];
      print(lista);
      return Temperatura.fromJson(lista);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    futureTemp = tempApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder<Temperatura>(
          future: futureTemp,
          builder: (context, snap) {
            if (snap.hasData) {
              return Column(
                children: [
                  Text("${snap.data!.tempmax?.toInt()}"),
                  Text("${snap.data!.tempmin}"),
                ],
              );
            } else if (snap.hasError) {
              return Text('${snap.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
/*
 body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

*/