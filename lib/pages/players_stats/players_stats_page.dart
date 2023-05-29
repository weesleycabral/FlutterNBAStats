import 'package:flutter/material.dart';
import 'package:nba_app/pages/app_bar/app_bar.dart';
import 'package:nba_app/pages/drawer/drawer_widget_page.dart';
import 'package:nba_app/services/api_service.dart';

class PlayersStatsPage extends StatefulWidget {
  const PlayersStatsPage({super.key});

  @override
  State<PlayersStatsPage> createState() => _PlayersStatsPageState();
}

class _PlayersStatsPageState extends State<PlayersStatsPage> {
  late ApiService apiService;
  final playerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    apiService = ApiService(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Stats',
      ),
      drawer: const DrawerWidget(),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          // const SizedBox(
          //   height: 75,
          // ),
          // const Padding(
          //     padding: EdgeInsets.only(left: 25),
          //     child: Text(
          //       'Pesquise seu jogador',
          //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          //     )),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      height: 30,
                      child: Icon(Icons.search, color: Colors.grey[600]),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: playerController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Pesquise por um jogador...'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                apiService.getSpecificPlayers(playerController.text.trim());
              },
              child: const Text('Pesquisar')),
        ],
      ),
    );
  }
}
