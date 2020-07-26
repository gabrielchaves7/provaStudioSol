import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prova_studio_sol/model/numero_aleatorio_model.dart';
import 'package:prova_studio_sol/repositorio/numero_repositorio.dart';
import 'file:///C:/workfolder/prova_studio_sol/lib/widgets/led/led_display_widget.dart';

class GameWidget extends StatefulWidget{
  GameWidget({Key key}) : super(key: key);

  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  Future<NumeroAleatorioModel> _futureObterNumeroAleatorio;
  bool acertouPalpite;
  int palpite;
  final palpiteController = TextEditingController();

  @override
  void initState() {
    acertouPalpite = false;
    _futureObterNumeroAleatorio = obterNumeroAleatorio();
    palpite = 0;
    super.initState();
  }

  @override
  void dispose() {
    palpiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NumeroAleatorioModel>(
      future:
      _futureObterNumeroAleatorio, // a previously-obtained Future<String> or null
      builder: (BuildContext context,
          AsyncSnapshot<NumeroAleatorioModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          int numeroAleatorio = snapshot.data.valor;
          String labelText;
          var children = <Widget>[];

          if (snapshot.hasError)
            labelText = "Erro";
          else if (acertouPalpite)
            labelText = "Acertou!";
          else if (!acertouPalpite &&
              palpite > numeroAleatorio &&
              palpiteController.text.isNotEmpty)
            labelText = "É menor";
          else if (!acertouPalpite &&
              palpite < numeroAleatorio &&
              palpiteController.text.isNotEmpty) labelText = "É maior";

          children.add(LedDisplayWidget(
            labelText: labelText,
            corAtivado: Colors.red,
            corDesativado: Colors.grey,
            tamanhoLinha: 1,
            numero: snapshot.hasError ? "502" : palpite.toString(),
          ));

          if (acertouPalpite) {
            children.add(FlatButton(
              color: Color.fromRGBO(224, 224, 224, 1),
              child: Text("Nova partida"),
              onPressed: () {
                setState(() {
                  _futureObterNumeroAleatorio = obterNumeroAleatorio();
                  palpite = 0;
                  palpiteController.text = "";
                  acertouPalpite = false;
                });
              },
            ));
          }

          children.add(
            Row(
              children: <Widget>[
                Flexible(
                  flex: 8,
                  child: TextFormField(
                    obscureText: false,
                    maxLength: 3,
                    decoration: InputDecoration(
                      labelText: 'Digite o palpite',
                    ),
                    keyboardType: TextInputType.number,
                    controller: palpiteController,
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: FlatButton(
                    color: Color.fromRGBO(224, 224, 224, 1),
                    disabledColor: Color.fromRGBO(154, 154, 154, 1),
                    child: Text("Enviar"),
                    onPressed: acertouPalpite
                        ? null
                        : () {
                      setState(() {
                        palpite = int.parse(palpiteController.text);
                        acertouPalpite = (palpiteController.text ==
                            numeroAleatorio.toString());
                      });
                    },
                  ),
                )
              ],
            ),
          );

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: children,
          );
        } else {
          return SizedBox(
            child: CircularProgressIndicator(),
            width: 60,
            height: 60,
          );
        }
      },
    );
  }
}
