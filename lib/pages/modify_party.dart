import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:party_app/api/api.dart';
import 'package:party_app/router/router.gr.dart';

@RoutePage()
class ModifyPartyPage extends StatefulWidget {
  const ModifyPartyPage({
    super.key,
    @PathParam('id') required this.partyId,
    required this.partyName,
    required this.partyBudget,
  });

  final int partyId;
  final String partyName;
  final double partyBudget;

  @override
  State<ModifyPartyPage> createState() {
    return _ModifyPartyPageState();
  }
}

class _ModifyPartyPageState extends State<ModifyPartyPage> {
  late ApiService apiService;
  late TextEditingController _partyNameController;
  late TextEditingController _partyBudgetController;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
    _partyNameController = TextEditingController(text: widget.partyName);
    _partyBudgetController = TextEditingController(text: widget.partyBudget.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modify Party'),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        final partyName = _partyNameController.text;
                        final partyBudget = double.parse(_partyBudgetController.text);
                        await apiService.modifyParty(widget.partyId, partyName, partyBudget);
                        if (context.mounted) {
                          AutoRouter.of(context).navigate(const MyHomeRoute());
                        }
                      },
                      child: const Text('Modify Party'),
                    ),
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