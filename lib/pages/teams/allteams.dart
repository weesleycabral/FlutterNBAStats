import 'package:flutter/material.dart';
import 'package:nba_app/constants.dart';
import 'package:nba_app/pages/drawer/drawer_widget_page.dart';
import 'package:nba_app/pages/teams/east_conference.dart';
import 'package:nba_app/pages/teams/west_conference.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Times'),
            centerTitle: true,
            backgroundColor: kPrimaryColor,
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Conferência Oeste',
                ),
                Tab(
                  text: 'Conferência Leste',
                ),
              ],
            ),
            // title: const Text('Tabs Demo'),
          ),
          backgroundColor: Colors.grey[300],
          drawer: const DrawerWidget(),
          body: const TabBarView(
            children: [
              WestConference(),
              EastConference(),
            ],
          ),
        ),
      ),
    );
  }
}
