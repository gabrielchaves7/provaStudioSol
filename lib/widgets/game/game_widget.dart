import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:prova_studio_sol/provider/game_provider.dart';
import 'package:prova_studio_sol/util/colors.dart';
import 'package:prova_studio_sol/widgets/led/led_display_widget.dart';
import 'package:prova_studio_sol/widgets/slider/custom_slider_widget.dart';
import 'package:provider/provider.dart';

class GameWidget extends StatefulWidget {
  GameWidget({Key key}) : super(key: key);

  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  TextEditingController palpiteController;
  Future<void> futureInicializarNovoJogo;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    futureInicializarNovoJogo =
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StudioSolColors.corPadrao,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('Qual é o número?'),
            InkWell(
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Icon(Icons.text_fields),
              ),
              onTap: () {
                showLedSizePickerDialog();
              },
            ),
            InkWell(
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Icon(Icons.color_lens),
              ),
              onTap: () {
                showColorPickerDialog();
              },
            )
          ],
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: FractionallySizedBox(
          widthFactor: 0.95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FutureBuilder<void>(
                future: futureInicializarNovoJogo,
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Consumer<GameProvider>(
                      builder: (context, game, child) {
                        String palpite = game.palpite.toString();
                        return LedDisplayWidget(
                          corAtivado: game.corLed,
                          corDesativado: StudioSolColors.corLedDesabilitado,
                          labelLed: game.labelLed,
                          novaPartidaHabilitada: game.novaPartidaHabilitada,
                          tamanhoLinha: game.tamanhoLinhaLed,
                          numero: palpite,
                          novoJogo: () {
                            setState(() {
                              futureInicializarNovoJogo =
                                  Provider.of<GameProvider>(context,
                                          listen: false)
                                      .inicializarNovoJogo();
                            });
                          },
                        );
                      },
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 8,
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        obscureText: false,
                        maxLength: 3,
                        decoration: InputDecoration(
                          labelText: 'Digite o palpite',
                        ),
                        keyboardType: TextInputType.number,
                        controller: palpiteController,
                        validator: (value) {
                          if (int.parse(value) > 300) {
                            return "Digite um número entre 1 e 300";
                          }

                          return null;
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child:
                        Consumer<GameProvider>(builder: (context, game, child) {
                      return FlatButton(
                        color: StudioSolColors.corBotaoHabilitado,
                        disabledColor: StudioSolColors.corBotaoDesabilitado,
                        child: Text("Enviar"),
                        onPressed: game.botaoEnviarHabilitado
                            ? () {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    game.enviarPalpite(
                                        int.parse(palpiteController.text));
                                  });
                                }
                              }
                            : null,
                      );
                    }),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  showLedSizePickerDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: CustomSlider(
          initialValue:
              Provider.of<GameProvider>(context, listen: false).tamanhoLinhaLed,
          onChanged: (value) {
            Provider.of<GameProvider>(context, listen: false)
                .alterarTamanhoLinhaLed(value);
          },
        ),
      ),
    );
  }

  showColorPickerDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: CircleColorPicker(
          initialColor:
              Provider.of<GameProvider>(context, listen: false).corLed,
          onChanged: (color) {
            Provider.of<GameProvider>(context, listen: false)
                .alterarCorLed(color);
          },
          size: const Size(240, 240),
          strokeWidth: 4,
          thumbSize: 36,
        ),
      ),
    );
  }
}
