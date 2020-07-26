import 'package:flutter/material.dart';
import 'package:prova_studio_sol/exception/custom_http_exception.dart';

import 'package:prova_studio_sol/repositorio/numero_repositorio.dart';

class GameProvider extends ChangeNotifier {
  int _numeroAleatorio;
  int _palpiteAtual;
  String _labelLed;
  bool _novaPartidaHabilitada = true;
  TextEditingController _palpiteTextController = TextEditingController();

  int get numeroAleatorio => _numeroAleatorio;
  int get palpite => _palpiteAtual;
  bool get acertouPalpite => (_palpiteAtual == numeroAleatorio);
  String get labelLed => _labelLed;
  bool get novaPartidaHabilitada => _novaPartidaHabilitada;
  TextEditingController get palpiteTextController => _palpiteTextController;

  Future<void> inicializarNovoJogo() async {
    try {
      _palpiteAtual = 0;
      _labelLed = "";
      _palpiteTextController.text = "";
      var novoNumeroAleatorio = await obterNumeroAleatorio();
      _novaPartidaHabilitada = false;
      _numeroAleatorio = novoNumeroAleatorio.valor;
    } catch (error) {
      if (error is CustomHttpException) {
        _palpiteAtual = error.statusCode;
        _labelLed = "Erro";
      } else {
        _palpiteAtual = 0;
        _labelLed = "Erro desconhecido";
      }

      _novaPartidaHabilitada = true;
    }

    notifyListeners();
  }

  void enviarPalpite(int novoPalpite) {
    this._palpiteAtual = novoPalpite;

    if (acertouPalpite){
      _novaPartidaHabilitada = true;
      _labelLed = "Acertou!";
    } else {
      if(_palpiteAtual > numeroAleatorio)
        _labelLed = "É menor";
      if( _palpiteAtual < numeroAleatorio)
        _labelLed = "É maior";

      _novaPartidaHabilitada = false;
    }

    notifyListeners();
  }
}
