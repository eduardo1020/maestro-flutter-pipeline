import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MaestroApp());
}

class MaestroApp extends StatelessWidget {
  const MaestroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maestro POC',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}