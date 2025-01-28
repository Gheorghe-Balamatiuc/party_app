import 'package:auto_route/auto_route.dart';
import 'package:party_app/router/router.gr.dart';
import 'package:party_app/services/auth_service.dart';

class CheckIfAuthenticated extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (AuthService.instance.credentials == null) {
      router.navigate(ErrorRoute());
    } else {
      resolver.next(true);
    }
  }
}