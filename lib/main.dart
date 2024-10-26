import 'package:flutter/material.dart';
import 'package:party_app/router/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Party management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 23, 0, 46)),
        useMaterial3: true,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
