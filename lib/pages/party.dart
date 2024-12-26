import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PartyPage extends StatelessWidget {
  const PartyPage({
    super.key,
    @PathParam('id') required this.partyId,
  });

  final int partyId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Party $partyId'),
      ),
    );
  }
}