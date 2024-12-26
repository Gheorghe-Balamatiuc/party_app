import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:party_app/api/api.dart';
import 'package:party_app/router/router.gr.dart';

@RoutePage()
class AddPartyPage extends StatefulWidget {
  const AddPartyPage({super.key});

  @override
  State<AddPartyPage> createState() {
    return _AddPartyPageState();
  }
}

class _AddPartyPageState extends State<AddPartyPage> {
  late ApiService apiService;
  late TextEditingController _partyNameController;
  late TextEditingController _partyBudgetController;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
    _partyNameController = TextEditingController();
    _partyBudgetController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Party Example'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _partyNameController,
                    decoration: const InputDecoration(
                      labelText: 'Party Name',
                    ),
                  ),
                  TextField(
                    controller: _partyBudgetController,
                    decoration: const InputDecoration(
                      labelText: 'Party Budget',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final partyName = _partyNameController.text;
                      final partyBudget = double.parse(_partyBudgetController.text);
                      await apiService.createParty(partyName, partyBudget);
                      if (context.mounted) {
                        AutoRouter.of(context).navigate(const MyHomeRoute());
                      }
                    },
                    child: const Text('Create Party'),
                  ),
                ],
              )
            ),
            const Expanded(
              child: Center(child: Text("Logo")),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _partyNameController.dispose();
    _partyBudgetController.dispose();
    super.dispose();
  }
}