import 'package:flutter/material.dart';

class LedVertical extends LedWidget {
  LedVertical(
      {Key key,
      this.corAtivado,
      this.corDesativado,
      @required this.tamanhoLinha,
      @required this.ativado,
      @required this.widthLedVertical,
      @required this.heightLedVertical})
      : super(key: key);

  final Color corAtivado;
  final Color corDesativado;
  final double tamanhoLinha;
  final bool ativado;
  final double widthLedVertical;
  final double heightLedVertical;

  @override
  Widget build(BuildContext context) {
    return LedWidget(
      corAtivado: corAtivado,
      corDesativado: corDesativado,
      tamanhoLinha: tamanhoLinha,
      ativado: ativado,
      width: widthLedVertical,
      height: heightLedVertical,
    );
  }
}

class LedHorizontal extends LedWidget {
  LedHorizontal(
      {Key key,
      this.corAtivado,
      this.corDesativado,
      @required this.tamanhoLinha,
      @required this.ativado,
      @required this.widthLedHorizontal,
      @required this.heightLedHorizontal})
      : super(key: key);

  final Color corAtivado;
  final Color corDesativado;
  final double tamanhoLinha;
  final bool ativado;
  final double widthLedHorizontal;
  final double heightLedHorizontal;

  @override
  Widget build(BuildContext context) {
    return LedWidget(
      corAtivado: corAtivado,
      corDesativado: corDesativado,
      tamanhoLinha: tamanhoLinha,
      ativado: ativado,
      width: widthLedHorizontal,
      height: heightLedHorizontal,
    );
  }
}

class LedWidget extends StatelessWidget {
  LedWidget(
      {Key key,
      this.corAtivado,
      this.corDesativado,
      @required this.tamanhoLinha,
      @required this.ativado,
      @required this.width,
      @required this.height})
      : super(key: key);

  final Color corAtivado;
  final Color corDesativado;
  final double tamanhoLinha;
  final bool ativado;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: ativado ? 1 : 0.1,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: ativado ? corAtivado : corDesativado,
        ),
      ),
    );
  }
}
