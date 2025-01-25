import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:party_app/services/auth_service.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Login'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5,
        children: [
          ElevatedButton(
            onPressed: () async => await AuthService.instance.login(),
            child: const Text('Login'),
          ),
          ElevatedButton(
            onPressed: () async => await AuthService.instance.signup(),
            child: const Text('Signup'),
          ),
        ],
      ),
    ),
  );
}