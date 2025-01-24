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
        children: [
          ElevatedButton(
            onPressed: () async => AuthService.instance.login(),
            child: const Text('Login'),
          ),
          ElevatedButton(
            onPressed: () async => AuthService.instance.signup(),
            child: const Text('Signup'),
          ),
          ElevatedButton(
            onPressed: () async {
              final credentials = await AuthService.instance.auth0.credentials();
              print(credentials);
            },
            child: const Text('Get'),
          ),
        ],
      ),
    ),
  );
}