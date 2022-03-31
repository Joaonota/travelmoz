// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import 'package:travelmoz/api/key/keys.dart';
import 'dart:convert' as convert;

import 'package:travelmoz/models/temperatura.dart';

class ApiTemperatura {
  Apikey apikey = Apikey();
  Future<Temperatura> apiTemp(cidade) async {
    final resposta = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$cidade,MZ&units=metric&lang=pt%27&appid=ff1ebd1bd18070938c751d8f6c625bbd"));

    if (resposta.statusCode == 200) {
      final response = convert.jsonDecode(resposta.body);
      //final lista = response['main'];
      final main = response['main'];
      print(main);

      /* var tems = [];
      for (var tempx in response['weathe']) {
        tems.addAll(tempx);
      }
*/
      return Temperatura.fromJson(main);
    } else {
      throw Exception("Falha Ao Traser a temperatura");
    }
  }
}
