import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:party_app/api/api.dart';
import 'package:party_app/models/party.dart';

@RoutePage()
class PartyPage extends StatefulWidget {
  const PartyPage({
    super.key,
    @PathParam('id') required this.partyId,
  });

  final int partyId;

  @override
  State<PartyPage> createState() {
    return _PartyPageState();
  }
}

class _PartyPageState extends State<PartyPage> {
  late ApiService apiService;
  late TextEditingController _memberFirstNameController;
  late TextEditingController _memberLastNameController;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
    _memberFirstNameController = TextEditingController();
    _memberLastNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final party = apiService.fetchParty(widget.partyId);

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
            body: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data?.members.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(snapshot.data?.members[index].firstName ?? ""),
                        subtitle: Text(snapshot.data?.members[index].lastName ?? ""),
                        leading: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            await apiService.deleteMember(snapshot.data?.members[index].id ?? 0);
                            if (context.mounted) {
                              setState(() {});
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: _memberFirstNameController,
                          decoration: const InputDecoration(
                            labelText: 'First Name',
                          ),
                        ),
                        TextField(
                          controller: _memberLastNameController,
                          decoration: const InputDecoration(
                            labelText: 'Last Name',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              final firstName = _memberFirstNameController.text;
                              final lastName = _memberLastNameController.text;
                              await apiService.addMember(firstName, lastName, widget.partyId);
                              if (context.mounted) {
                                setState(() {
                                  _memberFirstNameController.clear();
                                  _memberLastNameController.clear();
                                });
                              }
                            },
                            child: const Text('Add Member'),
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              ],
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

  @override
  void dispose() {
    _memberFirstNameController.dispose();
    _memberLastNameController.dispose();
    super.dispose();
  }
}