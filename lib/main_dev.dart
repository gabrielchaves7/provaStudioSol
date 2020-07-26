import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:prova_studio_sol/views/home_page.dart';

void main() {
  FlavorConfig(environment: FlavorEnvironment.DEV, variables: {
    "apiRandNumber": "https://us-central1-ss-devops.cloudfunctions.net"
  });
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
