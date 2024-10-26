import 'package:auto_route/auto_route.dart';
import 'package:party_app/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/home',
      page: HomeRoute.page, 
      initial: true,
      children: [
        AutoRoute(path: '', page: MyHomeRoute.page),
        AutoRoute(path: 'add', page: AddPartyRoute.page),
      ],
    ),
  ];
}