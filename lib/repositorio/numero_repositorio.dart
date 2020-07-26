import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prova_studio_sol/exception/custom_http_exception.dart';
import 'package:prova_studio_sol/model/numero_aleatorio_model.dart';

Future<NumeroAleatorioModel> obterNumeroAleatorio() async {
  final response = await http.get(
      'https://us-central1-ss-devops.cloudfunctions.net/rand?min=1&max=300');

  if (response.statusCode == 200) {
    Map decodedJson = json.decode(response.body);

    return NumeroAleatorioModel.fromJson(decodedJson);
  } else {
    throw CustomHttpException(
        "A chamada não retornou o status code 200", response.statusCode);
  }
}
