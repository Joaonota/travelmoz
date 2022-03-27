// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import 'package:travelmoz/api/key/keys.dart';
import 'dart:convert' as convert;

import 'package:travelmoz/models/temperatura.dart';

class ApiTemperatura {
  Future<Temperatura> apiTemp() async {
    final resposta = await http.get(Uri.parse(apitete));

    if (resposta.statusCode == 200) {
      final response = convert.jsonDecode(resposta.body);
      //final lista = response['main'];
      final main = response['main'];
      // print(lista2);

      return Temperatura.fromJson(main);
    } else {
      throw Exception("Falha Ao Traser a temperatura");
    }
  }
}
