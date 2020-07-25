import 'package:flutter/material.dart';
import 'package:prova_studio_sol/repositorio/numero_repositorio.dart';
import 'package:prova_studio_sol/widgets/led_display_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool acertouPalpite;
  Future<int> _futureObterNumeroAleatorio;
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('Qual é o número?'),
            Icon(Icons.text_fields),
            Icon(Icons.color_lens)
          ],
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: FutureBuilder<int>(
            future:
                _futureObterNumeroAleatorio, // a previously-obtained Future<String> or null
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                int numeroAleatorio = snapshot.data;
                var children = <Widget>[];

                if (snapshot.hasError) {
                  children.add(
                    Text("Erro"),
                  );
                } else if (acertouPalpite) {
                  children.add(
                    Text("Acertou!"),
                  );
                } else if ((!acertouPalpite &&
                    palpite > numeroAleatorio &&
                    palpiteController.text.isNotEmpty)) {
                  children.add(
                    Text("É menor"),
                  );
                } else if ((!acertouPalpite &&
                    palpite < numeroAleatorio &&
                    palpiteController.text.isNotEmpty)) {
                  children.add(
                    Text("É maior"),
                  );
                }

                children.add(LedDisplayWidget(
                  corAtivado: Colors.red,
                  corDesativado: Colors.grey,
                  tamanhoLinha: 1,
                  numero: snapshot.hasError ? "502" : palpite.toString(),
                ));

                if (acertouPalpite) {
                  children.add(FlatButton(
                    color: Color.fromRGBO(224, 224, 224, 1),
                    child: Text("Novo jogo"),
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
                          controller: palpiteController,
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: FlatButton(
                          color: Color.fromRGBO(224, 224, 224, 1),
                          disabledColor: Color.fromRGBO(154, 154, 154, 1),
                          child: Text("Enviar"),
                          onPressed: acertouPalpite ? null : () {
                            setState(() {
                              palpite = int.parse(palpiteController.text);
                              acertouPalpite =
                              (palpiteController.text == numeroAleatorio.toString());
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
          ),
        ),
      ),
    );
  }
}
