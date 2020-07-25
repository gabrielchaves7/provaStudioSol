import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prova_studio_sol/model/numero_em_led_model.dart';
import 'package:prova_studio_sol/widgets/led_widget.dart';

class LedUnitarioWidget extends StatelessWidget {
  LedUnitarioWidget(
      {Key key,
      this.corAtivado,
      this.corDesativado,
      @required this.tamanhoLinha,
      @required this.numeroEmLed})
      : super(key: key);

  final Color corAtivado;
  final Color corDesativado;
  final double tamanhoLinha;
  final NumeroEmLedModel numeroEmLed;

  @override
  Widget build(BuildContext context) {
    double widthLedVertical =
        ((MediaQuery.of(context).size.height * 0.01) * tamanhoLinha);
    double heightLedVertical = ((MediaQuery.of(context).size.height * 0.08));

    double widthLedHorizontal = (MediaQuery.of(context).size.height * 0.08);
    double heightLedHorizontal =
        ((MediaQuery.of(context).size.height * 0.01) * tamanhoLinha);

    double unidadeEspacamento = 5;

    return Container(
      width: (widthLedHorizontal + (widthLedVertical * 2)),
      height: ((heightLedHorizontal * 2) + (heightLedVertical * 2) + (unidadeEspacamento * 3)),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            right: widthLedVertical,
            child: LedHorizontal(
              corAtivado: corAtivado,
              corDesativado: corDesativado,
              tamanhoLinha: tamanhoLinha,
              ativado: numeroEmLed.ledHorizontalUm,
              widthLedHorizontal: widthLedHorizontal,
              heightLedHorizontal: heightLedHorizontal,
            ),
          ),
          Positioned(
            top: heightLedHorizontal + unidadeEspacamento,
            right: 0,
            child: LedVertical(
              corAtivado: corAtivado,
              corDesativado: corDesativado,
              tamanhoLinha: tamanhoLinha,
              ativado: numeroEmLed.ledVerticalDois,
              widthLedVertical: widthLedVertical,
              heightLedVertical: heightLedVertical,
            ),
          ),
          Positioned(
            top: (heightLedHorizontal +
                heightLedVertical +
                (unidadeEspacamento * 2)),
            right: 0,
            child: LedVertical(
              corAtivado: corAtivado,
              corDesativado: corDesativado,
              tamanhoLinha: tamanhoLinha,
              ativado: numeroEmLed.ledVerticalQuatro,
              widthLedVertical: widthLedVertical,
              heightLedVertical: heightLedVertical,
            ),
          ),
          Positioned(
            top: heightLedVertical + heightLedHorizontal,
            right: widthLedVertical,
            child: LedHorizontal(
              corAtivado: corAtivado,
              corDesativado: corDesativado,
              tamanhoLinha: tamanhoLinha,
              ativado: numeroEmLed.ledHorizontalDois,
              widthLedHorizontal: widthLedHorizontal,
              heightLedHorizontal: heightLedHorizontal,
            ),
          ),
          Positioned(
            top: heightLedHorizontal + unidadeEspacamento,
            right: (widthLedVertical + widthLedHorizontal),
            child: LedVertical(
              corAtivado: corAtivado,
              corDesativado: corDesativado,
              tamanhoLinha: tamanhoLinha,
              ativado: numeroEmLed.ledVerticalUm,
              widthLedVertical: widthLedVertical,
              heightLedVertical: heightLedVertical,
            ),
          ),
          Positioned(
            top: (heightLedHorizontal +
                heightLedVertical +
                (unidadeEspacamento * 2)),
            right: (widthLedVertical + widthLedHorizontal),
            child: LedVertical(
              corAtivado: corAtivado,
              corDesativado: corDesativado,
              tamanhoLinha: tamanhoLinha,
              ativado: numeroEmLed.ledVerticalTres,
              widthLedVertical: widthLedVertical,
              heightLedVertical: heightLedVertical,
            ),
          ),
          Positioned(
            top: (heightLedVertical * 2) +
                (heightLedHorizontal) +
                (unidadeEspacamento * 3),
            right: widthLedVertical,
            child: LedHorizontal(
              corAtivado: corAtivado,
              corDesativado: corDesativado,
              tamanhoLinha: tamanhoLinha,
              ativado: numeroEmLed.ledHorizontalTres,
              widthLedHorizontal: widthLedHorizontal,
              heightLedHorizontal: heightLedHorizontal,
            ),
          ),
        ],
      ),
    );
  }
}
