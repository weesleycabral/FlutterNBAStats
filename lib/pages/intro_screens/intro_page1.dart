import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroPage1 extends StatefulWidget {
  const IntroPage1({super.key});

  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Opa...seja bem-vindo ao',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'NBAapp',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Aqui você pode: ',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '- Ficar por dentro das datas e horario dos jogos \n do seu time favorito',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 200,
            child: SvgPicture.asset('assets/gameday.svg'),
          ),
        ],
      ),
    );
  }
}
