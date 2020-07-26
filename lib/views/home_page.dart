import 'package:flutter/material.dart';
import 'package:prova_studio_sol/provider/game_provider.dart';
import 'package:prova_studio_sol/widgets/game/game_widget.dart';
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
      body: ChangeNotifierProvider(
          create: (_) => GameProvider(), child: GameWidget()),
    );
  }
}
