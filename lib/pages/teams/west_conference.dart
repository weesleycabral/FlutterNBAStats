import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nba_app/services/api_service.dart';

class WestConference extends StatefulWidget {
  const WestConference({super.key});

  @override
  State<WestConference> createState() => _WestConferenceState();
}

class _WestConferenceState extends State<WestConference> {
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
        future: apiService.getTeamsWest(),
        builder: (context, snapshot) {
          // se ja terminou de carregar, mostre os dados
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: apiService.teamsWest.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: SvgPicture.asset(
                        'assets/nba-logos/${apiService.teamsWest[index].abbreviation}.svg',
                        width: 50,
                      ),
                      title: Text(
                          '${apiService.teamsWest[index].fullName} -  ${apiService.teamsWest[index].abbreviation}'),
                      subtitle: Text(apiService.teamsWest[index].city),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
