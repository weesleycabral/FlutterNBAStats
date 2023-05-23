import 'package:flutter/material.dart';

import 'package:nba_app/services/api_service.dart';

class AllTeams extends StatefulWidget {
  const AllTeams({super.key});

  @override
  State<AllTeams> createState() => _AllTeamsState();
}

class _AllTeamsState extends State<AllTeams> {
  late ApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ApiService(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getTeams(),
        builder: (context, snapshot) {
          // se ja terminou de carregar, mostre os dados
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: apiService.teams.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(apiService.teams[index].abbreviation),
                      subtitle: Text(apiService.teams[index].city),
                    ),
                  ),
                );
              },
            );
          }
          // senao, mostra um loading circle
          else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
