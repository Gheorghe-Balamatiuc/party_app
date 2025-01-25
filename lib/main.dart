import 'package:flutter/material.dart';
import 'package:party_app/router/router.dart';
import 'package:party_app/services/auth_service.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  AppRouter appRouter = AppRouter();

  WidgetsFlutterBinding.ensureInitialized();
  AuthService.instance.initializeAuth0(appRouter);
  setPathUrlStrategy();
  
  runApp(MyApp(appRouter: appRouter,));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required AppRouter appRouter,
  }) : _appRouter = appRouter;

  final AppRouter _appRouter;

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
