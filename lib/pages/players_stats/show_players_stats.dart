// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:nba_app/services/api_service.dart';

// class ShowPlayerStats extends StatefulWidget {
//   const ShowPlayerStats({super.key});

//   @override
//   State<ShowPlayerStats> createState() => _ShowPlayerStatsState();
// }

// class _ShowPlayerStatsState extends State<ShowPlayerStats> {
//    late ApiService apiService;

//   @override
//   void initState() {
//     super.initState();
//     apiService = ApiService(context);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:  FutureBuilder(
//             future: apiService.getSpecificPlayers(),
//             builder: (context, snapshot) {
//               // se ja terminou de carregar, mostre os dados
//               if (snapshot.connectionState == ConnectionState.done) {
//                 return ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: apiService.players.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: ListTile(
//                           title: Text(apiService.players[index].firstName),
//                           subtitle: Text(apiService.players[index].position),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               } else {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             },
//           ),,
//     );
//   }
// }