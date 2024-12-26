import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:party_app/api/api.dart';
import 'package:party_app/models/party.dart';

@RoutePage()
class PartyPage extends StatelessWidget {
  PartyPage({
    super.key,
    @PathParam('id') required this.partyId,
  });

  final int partyId;
  final apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    final party = apiService.fetchParty(partyId);

    return FutureBuilder<PartyWithMembers>(
      future: party,
      builder: (BuildContext context, AsyncSnapshot<PartyWithMembers> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Something wrong with message: ${snapshot.error.toString()}",
              style: const TextStyle(color: Colors.white),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: Text(snapshot.data?.name ?? ""),
            ),
            body: ListView.builder(
              itemCount: snapshot.data?.members.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(snapshot.data?.members[index].firstName ?? ""),
                  subtitle: Text(snapshot.data?.members[index].lastName ?? ""),
                );
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}