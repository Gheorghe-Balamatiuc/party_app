import 'package:auto_route/auto_route.dart';
import 'package:party_app/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/login', 
      page: LoginRoute.page,
      initial: true,
    ),
    AutoRoute(
      path: '/home',
      page: HomeRoute.page,
      children: [
        AutoRoute(path: '', page: MyHomeRoute.page),
        AutoRoute(path: 'add', page: AddPartyRoute.page),
        AutoRoute(path: 'party/:id', page: PartyRoute.page),
        AutoRoute(path: 'modify-party/:id', page: ModifyPartyRoute.page),
      ],
    ),
  ];
}