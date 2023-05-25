import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:nba_app/constants.dart';
import 'package:nba_app/pages/account/login_page.dart';
import 'package:nba_app/services/api_service.dart';

class GamesSchedule extends StatefulWidget {
  const GamesSchedule({super.key});

  @override
  State<GamesSchedule> createState() => _GamesScheduleState();
}

class _GamesScheduleState extends State<GamesSchedule> {
  late ApiService apiService;
  late String dataApi;

  @override
  void initState() {
    super.initState();
    apiService = ApiService(context);
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Colors.white,
          title: const Text(
            'Confirmação',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Tem certeza de que deseja sair?',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Sim',
                style: TextStyle(
                  color: Color(0xffFC8B21),
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Jogos do dia'),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: kPrimaryLightColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Olá, nome',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Sair'),
                onTap: () {
                  showAlertDialog(context);
                },
              )
            ],
          ),
        ),
        body: FutureBuilder(
          future: apiService.getTodayGames(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Exibe um indicador de carregamento enquanto os dados estão sendo buscados
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Exibe uma mensagem de erro caso ocorra algum erro na busca dos dados
              return const Text('Ocorreu um erro ao buscar os jogos.');
            }
            //  else if (snapshot.data == null || snapshot.data!.isEmpty) {

            //   // Exibe uma mensagem quando a lista de jogos estiver vazia
            //   return Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Center(
            //         child: RichText(
            //           text: const TextSpan(
            //               text: 'Nenhum jogo encontrado',
            //               style: TextStyle(color: Colors.black, fontSize: 20),
            //               children: <TextSpan>[
            //                 TextSpan(
            //                   text: ' hoje.',
            //                   style: TextStyle(
            //                       fontSize: 20, fontWeight: FontWeight.w700),
            //                 )
            //               ]),
            //         ),
            //         //     Text(
            //         //   'Nenhum jogo encontrado hoje.',
            //         //   style: TextStyle(fontSize: 20),
            //         // ),
            //       ),
            //       Lottie.asset('assets/relax.json', height: 350),
            //     ],
            //   );
            // }
            else {
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
                        child: Column(
                          children: [
                            Text(DateFormat('dd/MM/yyyy').format(DateTime.parse(
                                apiService.jogosHoje[index].date))),
                            DataTable(
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
                                      const SizedBox(width: 60),
                                      // dataApi = 'apiService.jogosHoje[index].date
                                      Text(DateFormat('hh:mm').format(
                                          DateTime.parse(apiService
                                              .jogosHoje[index].status))),
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      // Text(DateFormat('hh:MM:ss').format(
                                      //     DateTime.parse(
                                      //         apiService.jogosHoje[index].status)))
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
                              ],
                            ),
                          ],
                        )),
                  );
                },
              );
            }
          },
        ));
  }
}
