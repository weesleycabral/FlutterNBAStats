class Games {
  final int id;
  final String date;
  final int homeTeamScore;
  final int visitorTeamScore;
  final int season;
  final int period;
  final String status;
  final String time;
  final bool postseason;
  final Map<String, dynamic> homeTeam;
  final Map<String, dynamic> visitorTeam;

  Games(
      {required this.id,
      required this.date,
      required this.homeTeamScore,
      required this.visitorTeamScore,
      this.season = 2023,
      required this.period,
      required this.status,
      required this.time,
      required this.postseason,
      required this.homeTeam,
      required this.visitorTeam});

  // home_team:{
  //   id
  //   abbreviation
  //   city
  //   conference"
  //   division"
  //   full_name
  //   name
  // }
}

class HomeTeam {
  final int id;
  final String abbreviation;
  final String city;
  final String conference;
  final String division;
  final String fullName;
  final String name;

  HomeTeam({
    required this.id,
    required this.abbreviation,
    required this.city,
    required this.conference,
    required this.division,
    required this.fullName,
    required this.name,
  });
}
