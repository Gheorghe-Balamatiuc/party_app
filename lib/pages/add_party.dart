import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:party_app/api/api.dart';

@RoutePage()
class AddPartyPage extends StatefulWidget {
  const AddPartyPage({super.key});

  @override
  State<AddPartyPage> createState() {
    return _AddPartyPageState();
  }
}

class _AddPartyPageState extends State<AddPartyPage> {
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
      ),
    );
  }
}