import 'package:flutter/material.dart';
import 'package:party_app/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Party management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 23, 0, 46)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'It\'s time to party!'),
    );
  }
}
