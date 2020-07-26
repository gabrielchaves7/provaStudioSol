import 'package:flutter/material.dart';
import 'package:prova_studio_sol/provider/game_provider.dart';
import 'file:///C:/workfolder/prova_studio_sol/lib/widgets/game/game_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
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
          child: ChangeNotifierProvider(
              create: (_) => GameProvider(), child: GameWidget()),
        ),
      ),
    );
  }
}
