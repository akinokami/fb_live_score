class MatchHistoryModel {
  int? element;
  int? fixture;
  int? opponentTeam;
  int? totalPoints;
  bool? wasHome;
  String? kickoffTime;
  int? teamHScore;
  int? teamAScore;
  int? round;
  int? minutes;
  int? goalsScored;
  int? assists;
  int? cleanSheets;
  int? goalsConceded;
  int? ownGoals;
  int? penaltiesSaved;
  int? penaltiesMissed;
  int? yellowCards;
  int? redCards;
  int? saves;
  int? bonus;
  int? bps;
  String? influence;
  String? creativity;
  String? threat;
  String? ictIndex;
  int? starts;
  String? expectedGoals;
  String? expectedAssists;
  String? expectedGoalInvolvements;
  String? expectedGoalsConceded;
  int? value;
  int? transfersBalance;
  int? selected;
  int? transfersIn;
  int? transfersOut;

  MatchHistoryModel(
      {this.element,
      this.fixture,
      this.opponentTeam,
      this.totalPoints,
      this.wasHome,
      this.kickoffTime,
      this.teamHScore,
      this.teamAScore,
      this.round,
      this.minutes,
      this.goalsScored,
      this.assists,
      this.cleanSheets,
      this.goalsConceded,
      this.ownGoals,
      this.penaltiesSaved,
      this.penaltiesMissed,
      this.yellowCards,
      this.redCards,
      this.saves,
      this.bonus,
      this.bps,
      this.influence,
      this.creativity,
      this.threat,
      this.ictIndex,
      this.starts,
      this.expectedGoals,
      this.expectedAssists,
      this.expectedGoalInvolvements,
      this.expectedGoalsConceded,
      this.value,
      this.transfersBalance,
      this.selected,
      this.transfersIn,
      this.transfersOut});

  MatchHistoryModel.fromJson(Map<String, dynamic> json) {
    element = json['element'];
    fixture = json['fixture'];
    opponentTeam = json['opponent_team'];
    totalPoints = json['total_points'];
    wasHome = json['was_home'];
    kickoffTime = json['kickoff_time'];
    teamHScore = json['team_h_score'];
    teamAScore = json['team_a_score'];
    round = json['round'];
    minutes = json['minutes'];
    goalsScored = json['goals_scored'];
    assists = json['assists'];
    cleanSheets = json['clean_sheets'];
    goalsConceded = json['goals_conceded'];
    ownGoals = json['own_goals'];
    penaltiesSaved = json['penalties_saved'];
    penaltiesMissed = json['penalties_missed'];
    yellowCards = json['yellow_cards'];
    redCards = json['red_cards'];
    saves = json['saves'];
    bonus = json['bonus'];
    bps = json['bps'];
    influence = json['influence'];
    creativity = json['creativity'];
    threat = json['threat'];
    ictIndex = json['ict_index'];
    starts = json['starts'];
    expectedGoals = json['expected_goals'];
    expectedAssists = json['expected_assists'];
    expectedGoalInvolvements = json['expected_goal_involvements'];
    expectedGoalsConceded = json['expected_goals_conceded'];
    value = json['value'];
    transfersBalance = json['transfers_balance'];
    selected = json['selected'];
    transfersIn = json['transfers_in'];
    transfersOut = json['transfers_out'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['element'] = element;
    data['fixture'] = fixture;
    data['opponent_team'] = opponentTeam;
    data['total_points'] = totalPoints;
    data['was_home'] = wasHome;
    data['kickoff_time'] = kickoffTime;
    data['team_h_score'] = teamHScore;
    data['team_a_score'] = teamAScore;
    data['round'] = round;
    data['minutes'] = minutes;
    data['goals_scored'] = goalsScored;
    data['assists'] = assists;
    data['clean_sheets'] = cleanSheets;
    data['goals_conceded'] = goalsConceded;
    data['own_goals'] = ownGoals;
    data['penalties_saved'] = penaltiesSaved;
    data['penalties_missed'] = penaltiesMissed;
    data['yellow_cards'] = yellowCards;
    data['red_cards'] = redCards;
    data['saves'] = saves;
    data['bonus'] = bonus;
    data['bps'] = bps;
    data['influence'] = influence;
    data['creativity'] = creativity;
    data['threat'] = threat;
    data['ict_index'] = ictIndex;
    data['starts'] = starts;
    data['expected_goals'] = expectedGoals;
    data['expected_assists'] = expectedAssists;
    data['expected_goal_involvements'] = expectedGoalInvolvements;
    data['expected_goals_conceded'] = expectedGoalsConceded;
    data['value'] = value;
    data['transfers_balance'] = transfersBalance;
    data['selected'] = selected;
    data['transfers_in'] = transfersIn;
    data['transfers_out'] = transfersOut;
    return data;
  }
}
