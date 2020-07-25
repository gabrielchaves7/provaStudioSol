import 'package:flutter/material.dart';
import 'package:prova_studio_sol/views/home_page.dart';

void main() {
  runApp(StudioSolApp());
}

class StudioSolApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
