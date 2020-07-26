import 'dart:convert';

import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:http/http.dart' as http;
import 'package:prova_studio_sol/model/numero_aleatorio_model.dart';

Future<NumeroAleatorioModel> obterNumeroAleatorio() async {
  final response = await http.get(
      '${FlavorConfig.instance.variables["apiRandNumber"]}/rand?min=1&max=300');

  if (response.statusCode == 200) {
    Map decodedJson = json.decode(response.body);

    return NumeroAleatorioModel.fromJson(decodedJson);
  } else {
    throw Exception('Ocorreu um erro ao gerar o número aleatório.');
  }
}
