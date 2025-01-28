import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:party_app/api/api.dart';
import 'package:party_app/models/party.dart';
import 'package:party_app/router/router.gr.dart';
import 'package:party_app/services/auth_service.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

@RoutePage()
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  late ApiService apiService;
  late Future<List<Party>> futureParties;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
    futureParties = apiService.fetchParties();
  }

  void _refreshParties() {
    setState(() {
      futureParties = apiService.fetchParties();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text('It\'s time to party, ${AuthService.instance.credentials?.user.name ?? ""}'),
      actions: [
        ElevatedButton(
          onPressed: () async => AuthService.instance.logout(),
          child: const Text('Logout'),
        ),
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: _refreshParties,
        ),
        const SizedBox(width: 50),
      ],
    ),
    body: Container(
      color: Theme.of(context).colorScheme.primary.darker(30),
      child: Center(
        child: FutureBuilder<List<Party>>(
          future: futureParties,
          builder: (BuildContext context, AsyncSnapshot<List<Party>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}",
                  style: const TextStyle(color: Colors.white),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return GridView.builder(
                padding: const EdgeInsets.all(40),
                itemCount: snapshot.data?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 500,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 40,
                  childAspectRatio: 1.5,
                ), 
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context).colorScheme.inversePrimary.withValues(alpha: 0.5),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Center(
                                child: Text(
                                  snapshot.data?[index].name ?? "",
                                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                top: 10,
                                child: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () async {
                                    await apiService.deleteParty(snapshot.data?[index].id ?? 0);
                                    _refreshParties();
                                  },
                                ),
                              ),
                              Positioned(
                                left: 10,
                                top: 10,
                                child: IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    AutoRouter.of(context).navigate(
                                      ModifyPartyRoute(
                                        partyId: snapshot.data?[index].id ?? 0,
                                        partyName: snapshot.data?[index].name ?? "",
                                        partyBudget: snapshot.data?[index].budget ?? 0.0,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Center(child: Text("Budget: ${snapshot.data?[index].budget.toString() ?? ""}")),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                AutoRouter.of(context).navigate(PartyRoute(partyId: snapshot.data?[index].id ?? 0));
                              }, 
                              child: const Text("Press here!"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        ),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        AutoRouter.of(context).navigate(const AddPartyRoute());
      },
      tooltip: 'Add new party',
      child: const Icon(Icons.add),
    ),
  );
}