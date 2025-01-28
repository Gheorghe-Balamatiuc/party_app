import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:party_app/helpers/constants.dart';
import 'package:party_app/router/router.dart';
import 'package:party_app/router/router.gr.dart';

class AuthService {
  static final AuthService instance = AuthService._internal();
  factory AuthService() => instance;

  Auth0Web auth0 = Auth0Web(auth0Domain, auth0ClientId);
  final String _redirectUrlLogin = 'http://localhost:3000/loading';
  final String _redirectUrlLogout = 'http://localhost:3000/login';

  AuthService._internal();

  Credentials? credentials;

  Future initializeAuth0(AppRouter appRouter) async {
    await auth0.onLoad().then((credentials) {
      if (credentials != null) {
        this.credentials = credentials;
        appRouter.push(const HomeRoute());
      }
    });
  }

  Future login() async {
    await auth0.loginWithRedirect(redirectUrl: _redirectUrlLogin);
  }

  Future signup() async {
    await auth0.loginWithRedirect(
      redirectUrl: _redirectUrlLogin,
      parameters: {'screen_hint': 'signup'},
    );
  }

  Future logout() async {
    await auth0.logout(returnToUrl: _redirectUrlLogout);
  }
}