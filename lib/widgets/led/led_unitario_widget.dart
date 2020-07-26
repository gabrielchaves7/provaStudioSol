import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prova_studio_sol/model/numero_em_led_model.dart';
import 'package:prova_studio_sol/widgets/led/led_segmento_widget.dart';

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
        ((MediaQuery.of(context).size.width * 0.01) * tamanhoLinha);
    double heightLedVertical = ((MediaQuery.of(context).size.height * 0.08));

    double widthLedHorizontal = (MediaQuery.of(context).size.height * 0.08);
    double heightLedHorizontal =
        ((MediaQuery.of(context).size.width * 0.01) * tamanhoLinha);

    double unidadeEspacamento = 5;

    return Container(
      width: (widthLedHorizontal + (widthLedVertical * 2)),
      height: ((heightLedHorizontal * 2) +
          (heightLedVertical * 2) +
          (unidadeEspacamento * 3)),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            right: widthLedVertical,
            child: LedSegmentoWidget(
              corAtivado: corAtivado,
              corDesativado: corDesativado,
              tamanhoLinha: tamanhoLinha,
              ativado: numeroEmLed.ledHorizontalUm,
              width: widthLedHorizontal,
              height: heightLedHorizontal,
            ),
          ),
          Positioned(
            top: heightLedHorizontal + unidadeEspacamento,
            right: 0,
            child: LedSegmentoWidget(
              corAtivado: corAtivado,
              corDesativado: corDesativado,
              tamanhoLinha: tamanhoLinha,
              ativado: numeroEmLed.ledVerticalDois,
              width: widthLedVertical,
              height: heightLedVertical,
            ),
          ),
          Positioned(
            top: (heightLedHorizontal +
                heightLedVertical +
                (unidadeEspacamento * 2)),
            right: 0,
            child: LedSegmentoWidget(
              corAtivado: corAtivado,
              corDesativado: corDesativado,
              tamanhoLinha: tamanhoLinha,
              ativado: numeroEmLed.ledVerticalQuatro,
              width: widthLedVertical,
              height: heightLedVertical,
            ),
          ),
          Positioned(
            top: heightLedVertical +
                heightLedHorizontal +
                (unidadeEspacamento) -
                ((heightLedHorizontal - unidadeEspacamento) / 2),
            right: widthLedVertical,
            child: LedSegmentoWidget(
              corAtivado: corAtivado,
              corDesativado: corDesativado,
              tamanhoLinha: tamanhoLinha,
              ativado: numeroEmLed.ledHorizontalDois,
              width: widthLedHorizontal,
              height: heightLedHorizontal,
            ),
          ),
          Positioned(
            top: heightLedHorizontal + unidadeEspacamento,
            right: (widthLedVertical + widthLedHorizontal),
            child: LedSegmentoWidget(
              corAtivado: corAtivado,
              corDesativado: corDesativado,
              tamanhoLinha: tamanhoLinha,
              ativado: numeroEmLed.ledVerticalUm,
              width: widthLedVertical,
              height: heightLedVertical,
            ),
          ),
          Positioned(
            top: (heightLedHorizontal +
                heightLedVertical +
                (unidadeEspacamento * 2)),
            right: (widthLedVertical + widthLedHorizontal),
            child: LedSegmentoWidget(
              corAtivado: corAtivado,
              corDesativado: corDesativado,
              tamanhoLinha: tamanhoLinha,
              ativado: numeroEmLed.ledVerticalTres,
              width: widthLedVertical,
              height: heightLedVertical,
            ),
          ),
          Positioned(
            top: (heightLedVertical * 2) +
                (heightLedHorizontal) +
                (unidadeEspacamento * 3),
            right: widthLedVertical,
            child: LedSegmentoWidget(
              corAtivado: corAtivado,
              corDesativado: corDesativado,
              tamanhoLinha: tamanhoLinha,
              ativado: numeroEmLed.ledHorizontalTres,
              width: widthLedHorizontal,
              height: heightLedHorizontal,
            ),
          ),
        ],
      ),
    );
  }
}
