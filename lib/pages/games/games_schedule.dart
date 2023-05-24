import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nba_app/constants.dart';
import 'package:nba_app/services/api_service.dart';

class GamesSchedule extends StatefulWidget {
  const GamesSchedule({super.key});

  @override
  State<GamesSchedule> createState() => _GamesScheduleState();
}

class _GamesScheduleState extends State<GamesSchedule> {
  late ApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ApiService(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Jogos do dia'),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
        ),
        body: FutureBuilder(
          future: apiService.getTodayGames(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: apiService.jogosHoje.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DataTable(
                          columns: [
                            DataColumn(
                              label: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/nba-logos/${apiService.jogosHoje[index].homeTeam['abbreviation']}.svg',
                                    width: 40,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                      '${apiService.jogosHoje[index].homeTeam['abbreviation']}'),
                                ],
                              ),
                            ),
                            DataColumn(
                              label: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/nba-logos/${apiService.jogosHoje[index].visitorTeam['abbreviation']}.svg',
                                    width: 40,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                      '${apiService.jogosHoje[index].visitorTeam['abbreviation']}'),
                                ],
                              ),
                            )
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(
                                ListTile(
                                  title: Text(
                                      '${apiService.jogosHoje[index].homeTeamScore}'),
                                  // subtitle: Text('Engenheiro'),
                                ),
                              ),
                              DataCell(
                                ListTile(
                                  title: Text(
                                      '${apiService.jogosHoje[index].visitorTeamScore}'),
                                  // subtitle: Text('Engenheiro'),
                                ),
                              ),
                            ]),
                            // DataRow(cells: [
                            //   const DataCell(Text('teste')),
                            //   DataCell(
                            //     ListTile(
                            //       title: Text(
                            //           '${apiService.jogosHoje[index].visitorTeamScore}'),
                            //       // subtitle: Text('Engenheiro'),
                            //       leading: SvgPicture.asset(
                            //         'assets/nba-logos/${apiService.jogosHoje[index].visitorTeam['abbreviation']}.svg',
                            //         width: 50,
                            //       ),
                            //     ),
                            //   ),
                            // ]),
                            // DataRow(cells: [
                            //   DataCell(Text(
                            //       '${apiService.jogosHoje[index].homeTeamScore}')),
                            //   DataCell(Text(
                            //       '${apiService.jogosHoje[index].visitorTeamScore}'))
                            // ])
                          ],
                        )

                        // ListTile(
                        //   title: Text(
                        //       '${apiService.jogosHoje[index].homeTeam['abbreviation']} - ${apiService.jogosHoje[index].homeTeamScore}'),
                        //   subtitle: Text(
                        //       '${apiService.jogosHoje[index].visitorTeam['abbreviation']} - ${apiService.jogosHoje[index].visitorTeamScore}'),
                        //   // subtitle: Text(apiService.teamsEast[index].city),
                        // ),
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
        ));
  }
}
