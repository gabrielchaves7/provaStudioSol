import 'package:flutter/material.dart';
import 'package:prova_studio_sol/views/home_page.dart';

void main() {
  runApp(StudioSolApp());
}

class StudioSolApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
