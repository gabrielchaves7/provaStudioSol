import 'package:flutter/material.dart';
import 'package:prova_studio_sol/widgets/led_display_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            LedDisplayWidget(
              corAtivado: Colors.red,
              corDesativado: Colors.grey,
              tamanhoLinha: 1,
              numero: "200",
            ),
          ],
        ),
      ),
    );
  }
}
