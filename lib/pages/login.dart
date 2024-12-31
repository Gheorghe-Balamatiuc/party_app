import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final auth0Web = Auth0Web('dev-vzcitzqbovf1yw7t.eu.auth0.com', 'EPRxqUn5cQoPhasuhZLDVNqbKX3h9wsJ');

  @override
  Widget build(BuildContext context) {
    auth0Web.onLoad();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => auth0Web.loginWithRedirect(redirectUrl: 'http://localhost:3000/#/home'),
          child: const Text('Login'),
        ),
      ),
    );
  }
}