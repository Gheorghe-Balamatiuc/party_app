// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:party_app/pages/add_party.dart' as _i1;
import 'package:party_app/pages/home.dart' as _i2;
import 'package:party_app/pages/party.dart' as _i3;

/// generated route for
/// [_i1.AddPartyPage]
class AddPartyRoute extends _i4.PageRouteInfo<void> {
  const AddPartyRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AddPartyRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPartyRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddPartyPage();
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i2.MyHomePage]
class MyHomeRoute extends _i4.PageRouteInfo<void> {
  const MyHomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          MyHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.MyHomePage();
    },
  );
}

/// generated route for
/// [_i3.PartyPage]
class PartyRoute extends _i4.PageRouteInfo<PartyRouteArgs> {
  PartyRoute({
    _i5.Key? key,
    required int partyId,
    List<_i4.PageRouteInfo>? children,
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

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PartyRouteArgs>(
          orElse: () => PartyRouteArgs(partyId: pathParams.getInt('id')));
      return _i3.PartyPage(
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

  final _i5.Key? key;

  final int partyId;

  @override
  String toString() {
    return 'PartyRouteArgs{key: $key, partyId: $partyId}';
  }
}
