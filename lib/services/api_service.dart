import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nba_app/models/games.dart';
import 'package:nba_app/models/players.dart';
import 'package:nba_app/models/team.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final BuildContext context;
  ApiService(this.context);

  List<Team> teams = [];
  List<Team> teamsEast = [];
  List<Team> teamsWest = [];
  List<Players> players = [];
  List<Games> jogos = [];
  List<Games> jogosHoje = [];

  String getCurrentDate() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(now);
  }

  Future getTeams() async {
    var response = await http.get(Uri.https('balldontlie.io', 'api/v1/teams'));
    var jsonData = jsonDecode(response.body);

    for (var eachTeam in jsonData['data']) {
      final team = Team(
        abbreviation: eachTeam['abbreviation'],
        city: eachTeam['city'],
        conference: eachTeam['conference'],
        fullName: eachTeam['full_name'],
      );
      teams.add(team);
      print(team.conference);
    }
  }

  Future getTeamsWest() async {
    var response = await http.get(Uri.https('balldontlie.io', 'api/v1/teams'));
    var jsonData = jsonDecode(response.body);
    for (var eachTeam in jsonData['data']) {
      final team = Team(
        abbreviation: eachTeam['abbreviation'],
        city: eachTeam['city'],
        conference: eachTeam['conference'],
        fullName: eachTeam['full_name'],
      );
      if (team.conference == 'West') {
        teamsWest.sort((a, b) {
          return a.toString().compareTo(b.toString());
        });
        teamsWest.add(team);
        print(team.abbreviation);
      }
    }
  }

  Future getTeamsEast() async {
    var response = await http.get(Uri.https('balldontlie.io', 'api/v1/teams'));
    var jsonData = jsonDecode(response.body);
    for (var eachTeam in jsonData['data']) {
      final team = Team(
        abbreviation: eachTeam['abbreviation'],
        city: eachTeam['city'],
        conference: eachTeam['conference'],
        fullName: eachTeam['full_name'],
      );
      if (team.conference == 'East') {
        teamsEast.sort((a, b) {
          return a.toString().compareTo(b.toString());
        });
        teamsEast.add(team);
        print(team.abbreviation);
      }
    }
  }

  // Future getGames() async {
  //   var response = await http.get(Uri.https('balldontlie.io', 'api/v1/games'));
  //   var jsonData = jsonDecode(response.body);

  //   for (var eachGame in jsonData['data']) {
  //     final games = Games(
  //         id: eachGame['id'],
  //         date: eachGame['date'],
  //         homeTeamScore: eachGame['home_team_score'],
  //         visitorTeamScore: eachGame['visitor_team_score'],
  //         season: eachGame['season'],
  //         period: eachGame['period'],
  //         status: eachGame['status'],
  //         time: eachGame['time'],
  //         postseason: eachGame['postseason'],
  //         homeTeam: eachGame['home_team'],
  //         visitorTeam: eachGame['visitor_team']);
  //     eachGame['season'] = 2023;
  //     jogos.add(games);
  //     print(games.season);
  //   }
  // }

  Future getTodayGames() async {
    String currentDate = getCurrentDate();
    var response = await http.get(
        Uri.https('balldontlie.io', 'api/v1/games', {'dates[]': '2023-05-23'}));
    // print(response.statusCode);
    var jsonData = jsonDecode(response.body);
    print(jsonData);

    for (var eachGame in jsonData['data']) {
      final games = Games(
          id: eachGame['id'],
          date: eachGame['date'],
          homeTeamScore: eachGame['home_team_score'],
          visitorTeamScore: eachGame['visitor_team_score'],
          season: eachGame['season'],
          period: eachGame['period'],
          status: eachGame['status'],
          time: eachGame['time'],
          postseason: eachGame['postseason'],
          homeTeam: eachGame['home_team'],
          visitorTeam: eachGame['visitor_team'],
          abbreviation: eachGame['abbreviation'],
          city: eachGame['city'],
          fullName: eachGame['full_name']);
      jogosHoje.add(games);
    }
  }

  Future getPlayers() async {
    var response =
        await http.get(Uri.https('balldontlie.io', 'api/v1/players'));
    var jsonData = jsonDecode(response.body);

    for (var eachPlayer in jsonData['data']) {
      final player = Players(
          firstName: eachPlayer['first_name'],
          lastName: eachPlayer['last_name'],
          position: eachPlayer['position']);
      players.add(player);
    }
    print(players.length);
  }
}
