import 'package:flutter/material.dart';
import 'package:prova_studio_sol/exception/custom_http_exception.dart';

import 'package:prova_studio_sol/repositorio/numero_repositorio.dart';
import 'package:prova_studio_sol/util/colors.dart';

class GameProvider extends ChangeNotifier {
  int _numeroAleatorio;
  int _palpiteAtual;
  String _labelLed;
  bool _novaPartidaHabilitada = true;
  TextEditingController _palpiteTextController = TextEditingController();
  Color _corLed = StudioSolColors.corPadrao;
  double _tamanhoLinhaLed = 2;

  int get numeroAleatorio => _numeroAleatorio;
  int get palpite => _palpiteAtual;
  bool get acertouPalpite => (_palpiteAtual == numeroAleatorio);
  String get labelLed => _labelLed;
  bool get novaPartidaHabilitada => _novaPartidaHabilitada;
  TextEditingController get palpiteTextController => _palpiteTextController;
  Color get corLed => _corLed;
  double get tamanhoLinhaLed => _tamanhoLinhaLed;

  Future<void> inicializarNovoJogo() async {
    try {
      var novoNumeroAleatorio = await obterNumeroAleatorio();
      _numeroAleatorio = novoNumeroAleatorio.valor;

      _palpiteAtual = 0;
      _labelLed = "";
      _palpiteTextController.text = "";
      _novaPartidaHabilitada = false;
    } catch (error) {
      if (error is CustomHttpException) {
        _palpiteAtual = error.statusCode;
        _labelLed = "Erro";
      } else {
        _palpiteAtual = 0;
        _labelLed = "Erro desconhecido";
      }
      _palpiteTextController.text = "";
      _novaPartidaHabilitada = true;
    }

    notifyListeners();
  }

  void enviarPalpite(int novoPalpite) {
    this._palpiteAtual = novoPalpite;

    if (acertouPalpite) {
      _novaPartidaHabilitada = true;
      _labelLed = "Acertou!";
    } else {
      if (_palpiteAtual > numeroAleatorio) _labelLed = "É menor";
      if (_palpiteAtual < numeroAleatorio) _labelLed = "É maior";

      _novaPartidaHabilitada = false;
    }

    notifyListeners();
  }

  void alterarCorLed(Color novaCor) {
    _corLed = novaCor;
    notifyListeners();
  }

  void alterarTamanhoLinhaLed(double novoTamanho) {
    _tamanhoLinhaLed = novoTamanho;
    notifyListeners();
  }
}
