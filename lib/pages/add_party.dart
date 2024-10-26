import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:party_app/api/api.dart';
import 'package:party_app/models/party.dart';

@RoutePage()
class AddPartyPage extends StatefulWidget {
  const AddPartyPage({super.key});

  @override
  State<AddPartyPage> createState() {
    return _AddPartyPageState();
  }
}

class _AddPartyPageState extends State<AddPartyPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  Future<Party>? _futureParty;
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Party Example'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: (_futureParty == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(hintText: 'Enter Party Name'),
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: _budgetController,
          decoration: const InputDecoration(hintText: 'Enter Budget'),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureParty = apiService.createParty(
                _nameController.text,
                _budgetController.text,
              );
            });
          },
          child: const Text('Create Party'),
        ),
      ],
    );
  }

  FutureBuilder<Party> buildFutureBuilder() {
    return FutureBuilder<Party>(
      future: _futureParty,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text('Party Created: ${snapshot.data!.name}');
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}