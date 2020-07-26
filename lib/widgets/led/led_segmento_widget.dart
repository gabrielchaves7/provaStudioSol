import 'package:flutter/material.dart';

class LedSegmentoWidget extends StatelessWidget {
  LedSegmentoWidget(
      {Key key,
      this.corAtivado,
      this.corDesativado,
      this.tamanhoLinha,
      this.ativado,
      this.width,
      this.height})
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
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: ativado ? corAtivado : corDesativado,
        ),
      ),
    );
  }
}
