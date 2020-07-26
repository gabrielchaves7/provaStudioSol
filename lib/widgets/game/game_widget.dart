import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
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
  Future<void> _futureInicializarNovoJogo;
  TextEditingController palpiteController;
  Color corLed;
  double tamanhoLinhaLed;

  @override
  void initState() {
    _futureInicializarNovoJogo =
        Provider.of<GameProvider>(context, listen: false).inicializarNovoJogo();
    palpiteController =
        Provider.of<GameProvider>(context, listen: false).palpiteTextController;
    corLed = StudioSolColors.corPadrao;
    tamanhoLinhaLed = 2;
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
          child: FutureBuilder<void>(
            future: _futureInicializarNovoJogo,
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var children = <Widget>[];
                children.add(
                  Consumer<GameProvider>(
                    builder: (context, game, child) {
                      String palpite = game.palpite.toString();
                      return LedDisplayWidget(
                        corAtivado: corLed,
                        corDesativado: Colors.grey,
                        tamanhoLinha: tamanhoLinhaLed,
                        numero: palpite,
                      );
                    },
                  ),
                );

                children.add(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                              color: StudioSolColors.corBotaoHabilitado,
                              disabledColor:
                                  StudioSolColors.corBotaoDesabilitado,
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
                initialValue: tamanhoLinhaLed,
                onChanged: (value) {
                  setState(() {
                    tamanhoLinhaLed = value;
                  });
                },
              ),
            ));
  }

  showColorPickerDialog() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: ColorPicker(
                  color: corLed,
                  onChanged: (value) {
                    setState(() {
                      corLed = value;
                    });
                  }),
            ));
  }
}
