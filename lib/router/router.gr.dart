// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:party_app/pages/add_party.dart' as _i1;
import 'package:party_app/pages/home.dart' as _i2;
import 'package:party_app/pages/login.dart' as _i3;
import 'package:party_app/pages/modify_party.dart' as _i4;
import 'package:party_app/pages/party.dart' as _i5;

/// generated route for
/// [_i1.AddPartyPage]
class AddPartyRoute extends _i6.PageRouteInfo<void> {
  const AddPartyRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AddPartyRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPartyRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddPartyPage();
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<LoginRouteArgs>(orElse: () => const LoginRouteArgs());
      return _i3.LoginPage(key: args.key);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.ModifyPartyPage]
class ModifyPartyRoute extends _i6.PageRouteInfo<ModifyPartyRouteArgs> {
  ModifyPartyRoute({
    _i7.Key? key,
    required int partyId,
    required String partyName,
    required double partyBudget,
    List<_i6.PageRouteInfo>? children,
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

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ModifyPartyRouteArgs>();
      return _i4.ModifyPartyPage(
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

  final _i7.Key? key;

  final int partyId;

  final String partyName;

  final double partyBudget;

  @override
  String toString() {
    return 'ModifyPartyRouteArgs{key: $key, partyId: $partyId, partyName: $partyName, partyBudget: $partyBudget}';
  }
}

/// generated route for
/// [_i2.MyHomePage]
class MyHomeRoute extends _i6.PageRouteInfo<void> {
  const MyHomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MyHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.MyHomePage();
    },
  );
}

/// generated route for
/// [_i5.PartyPage]
class PartyRoute extends _i6.PageRouteInfo<PartyRouteArgs> {
  PartyRoute({
    _i7.Key? key,
    required int partyId,
    List<_i6.PageRouteInfo>? children,
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

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PartyRouteArgs>(
          orElse: () => PartyRouteArgs(partyId: pathParams.getInt('id')));
      return _i5.PartyPage(
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

  final _i7.Key? key;

  final int partyId;

  @override
  String toString() {
    return 'PartyRouteArgs{key: $key, partyId: $partyId}';
  }
}
