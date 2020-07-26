import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prova_studio_sol/model/numero_em_led_model.dart';
import 'package:prova_studio_sol/provider/game_provider.dart';
import 'package:prova_studio_sol/widgets/led/led_unitario_widget.dart';
import 'package:provider/provider.dart';

class LedDisplayWidget extends StatelessWidget {
  LedDisplayWidget(
      {Key key,
      this.corAtivado,
      this.corDesativado,
      @required this.tamanhoLinha,
      @required this.numero})
      : super(key: key);

  final Color corAtivado;
  final Color corDesativado;
  final double tamanhoLinha;
  final String numero;

  @override
  Widget build(BuildContext context) {
    var listaNumeroEmLed = converterNumeroEmLed(numero);
    var children = <Widget>[];

    listaNumeroEmLed.forEach((numeroEmLed) {
      children.add(Padding(
        padding: EdgeInsets.all(4),
        child: LedUnitarioWidget(
          corAtivado: corAtivado,
          tamanhoLinha: tamanhoLinha,
          corDesativado: corDesativado,
          numeroEmLed: numeroEmLed,
        ),
      ));
    });

    return Column(
      children: <Widget>[
        Consumer<GameProvider>(
          builder: (context, game, child) {
            if (game.labelLed.isNotEmpty)
              return Text(game.labelLed);
            else
              return Container();
          },
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
        Consumer<GameProvider>(
          builder: (context, game, child) {
            if (game.novaPartidaHabilitada) {
              return FlatButton(
                color: Color.fromRGBO(224, 224, 224, 1),
                child: Text("Nova partida"),
                onPressed: () {
                  game.inicializarNovoJogo();
                },
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }

  List<NumeroEmLedModel> converterNumeroEmLed(String numero) {
    var resultado = List<NumeroEmLedModel>();

    for (var i = 0; i < numero.length; i++) {
      if (numero[i] == 0.toString()) {
        resultado.add(NumeroEmLedModel.numeroZero());
      }
      if (numero[i] == 1.toString()) {
        resultado.add(NumeroEmLedModel.numeroUm());
      }
      if (numero[i] == 2.toString()) {
        resultado.add(NumeroEmLedModel.numeroDois());
      }
      if (numero[i] == 3.toString()) {
        resultado.add(NumeroEmLedModel.numeroTres());
      }
      if (numero[i] == 4.toString()) {
        resultado.add(NumeroEmLedModel.numeroQuatro());
      }
      if (numero[i] == 5.toString()) {
        resultado.add(NumeroEmLedModel.numeroCinco());
      }
      if (numero[i] == 6.toString()) {
        resultado.add(NumeroEmLedModel.numeroSeis());
      }
      if (numero[i] == 7.toString()) {
        resultado.add(NumeroEmLedModel.numeroSete());
      }
      if (numero[i] == 8.toString()) {
        resultado.add(NumeroEmLedModel.numeroOito());
      }
      if (numero[i] == 9.toString()) {
        resultado.add(NumeroEmLedModel.numeroNove());
      }
    }

    return resultado;
  }
}
