// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:party_app/pages/add_party.dart' as _i1;
import 'package:party_app/pages/error.dart' as _i2;
import 'package:party_app/pages/home.dart' as _i3;
import 'package:party_app/pages/loading.dart' as _i4;
import 'package:party_app/pages/login.dart' as _i5;
import 'package:party_app/pages/modify_party.dart' as _i6;
import 'package:party_app/pages/party.dart' as _i7;

/// generated route for
/// [_i1.AddPartyPage]
class AddPartyRoute extends _i8.PageRouteInfo<void> {
  const AddPartyRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AddPartyRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPartyRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddPartyPage();
    },
  );
}

/// generated route for
/// [_i2.ErrorPage]
class ErrorRoute extends _i8.PageRouteInfo<void> {
  const ErrorRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ErrorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ErrorRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.ErrorPage();
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.LoadingPage]
class LoadingRoute extends _i8.PageRouteInfo<void> {
  const LoadingRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoadingPage();
    },
  );
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoginPage();
    },
  );
}

/// generated route for
/// [_i6.ModifyPartyPage]
class ModifyPartyRoute extends _i8.PageRouteInfo<ModifyPartyRouteArgs> {
  ModifyPartyRoute({
    _i9.Key? key,
    required int partyId,
    required String partyName,
    required double partyBudget,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ModifyPartyRoute.name,
          args: ModifyPartyRouteArgs(
            key: key,
            partyId: partyId,
            partyName: partyName,
            partyBudget: partyBudget,
          ),
          rawPathParams: {'id': partyId},
          initialChildren: children,
        );

  static const String name = 'ModifyPartyRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ModifyPartyRouteArgs>();
      return _i6.ModifyPartyPage(
        key: args.key,
        partyId: args.partyId,
        partyName: args.partyName,
        partyBudget: args.partyBudget,
      );
    },
  );
}

class ModifyPartyRouteArgs {
  const ModifyPartyRouteArgs({
    this.key,
    required this.partyId,
    required this.partyName,
    required this.partyBudget,
  });

  final _i9.Key? key;

  final int partyId;

  final String partyName;

  final double partyBudget;

  @override
  String toString() {
    return 'ModifyPartyRouteArgs{key: $key, partyId: $partyId, partyName: $partyName, partyBudget: $partyBudget}';
  }
}

/// generated route for
/// [_i3.MyHomePage]
class MyHomeRoute extends _i8.PageRouteInfo<void> {
  const MyHomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          MyHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.MyHomePage();
    },
  );
}

/// generated route for
/// [_i7.PartyPage]
class PartyRoute extends _i8.PageRouteInfo<PartyRouteArgs> {
  PartyRoute({
    _i9.Key? key,
    required int partyId,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          PartyRoute.name,
          args: PartyRouteArgs(
            key: key,
            partyId: partyId,
          ),
          rawPathParams: {'id': partyId},
          initialChildren: children,
        );

  static const String name = 'PartyRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PartyRouteArgs>(
          orElse: () => PartyRouteArgs(partyId: pathParams.getInt('id')));
      return _i7.PartyPage(
        key: args.key,
        partyId: args.partyId,
      );
    },
  );
}

class PartyRouteArgs {
  const PartyRouteArgs({
    this.key,
    required this.partyId,
  });

  final _i9.Key? key;

  final int partyId;

  @override
  String toString() {
    return 'PartyRouteArgs{key: $key, partyId: $partyId}';
  }
}
