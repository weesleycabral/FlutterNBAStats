class Stats {
  final int gamesPlayed;
  final int playerId;
  final int season;
  final String min;
  final double fgm;
  final double fga;
  final double ftm;
  final double fta;
  final double oreb;
  final double dreb;
  final double reb;
  final double ast;
  final double stl;
  final double blk;
  final double turnover;
  final double pf;
  final double pts;
  final double fgPct;

  Stats(
      {required this.gamesPlayed,
      required this.playerId,
      required this.season,
      required this.min,
      required this.fgm,
      required this.fga,
      required this.ftm,
      required this.fta,
      required this.oreb,
      required this.dreb,
      required this.reb,
      required this.ast,
      required this.stl,
      required this.blk,
      required this.turnover,
      required this.pf,
      required this.pts,
      required this.fgPct});
}
