import 'dart:convert';

import 'package:http/http.dart' as http;

Future<int> obterNumeroAleatorio() async {
  final response = await http.get(
      'https://us-central1-ss-devops.cloudfunctions.net/rand?min=1&max=300');

  if (response.statusCode == 200) {
    return json.decode(response.body)["value"];
  } else {
    throw Exception('Failed to load album');
  }
}
