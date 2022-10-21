class TeamData{
  final List<dynamic> teamDataJson;

  TeamData({
    required this.teamDataJson
  });

  List<dynamic> getTeamDataWhereMatchId(int matchId) {
    return teamDataJson[matchId];
  }
}