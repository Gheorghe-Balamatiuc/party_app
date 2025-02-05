import 'package:flutter/material.dart';
import 'package:party_app/router/router.dart';
import 'package:party_app/services/auth_service.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    AuthService.instance.initializeAuth0(_appRouter);
  }

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
