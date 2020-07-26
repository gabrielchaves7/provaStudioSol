import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prova_studio_sol/provider/game_provider.dart';
import 'package:prova_studio_sol/widgets/led/led_display_widget.dart';
import 'package:provider/provider.dart';

class GameWidget extends StatefulWidget {
  GameWidget({Key key}) : super(key: key);

  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  Future<void> _futureInicializarNovoJogo;
  TextEditingController palpiteController;

  @override
  void initState() {
    _futureInicializarNovoJogo =
        Provider.of<GameProvider>(context, listen: false).inicializarNovoJogo();
    palpiteController =
        Provider.of<GameProvider>(context, listen: false).palpiteTextController;
    super.initState();
  }

  @override
  void dispose() {
    palpiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future:
          _futureInicializarNovoJogo,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var children = <Widget>[];
          children.add(
            Consumer<GameProvider>(
              builder: (context, game, child) {
                String palpite = game.palpite.toString();
                return LedDisplayWidget(
                  corAtivado: Colors.red,
                  corDesativado: Colors.grey,
                  tamanhoLinha: 1,
                  numero: palpite,
                );
              },
            ),
          );

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
                  child: Consumer<GameProvider>(
                    builder: (context, game, child) {
                      return FlatButton(
                        color: Color.fromRGBO(224, 224, 224, 1),
                        disabledColor: Color.fromRGBO(154, 154, 154, 1),
                        child: Text("Enviar"),
                        onPressed: game.acertouPalpite
                            ? null
                            : () {
                                setState(() {
                                  game.enviarPalpite(
                                      int.parse(palpiteController.text));
                                });
                              },
                      );
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
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
            ],
          );
        }
      },
    );
  }
}
