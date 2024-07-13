class StatusModel {
  List<Events>? events;
  // GameSettings? gameSettings;
  List<Phases>? phases;
  List<Teams>? teams;
  num? totalPlayers;
  List<Elements>? elements = [];
  List<ElementStats>? elementStats;
  List<ElementTypes>? elementTypes;

  StatusModel(
      {this.events,
      //this.gameSettings,
      this.phases,
      this.teams,
      this.totalPlayers,
      this.elements,
      this.elementStats,
      this.elementTypes});

  StatusModel.fromJson(Map<String, dynamic> json) {
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(Events.fromJson(v));
      });
    }
    // gameSettings = json['game_settings'] != null
    //     ? GameSettings.fromJson(json['game_settings'])
    //     : null;
    if (json['phases'] != null) {
      phases = <Phases>[];
      json['phases'].forEach((v) {
        phases!.add(Phases.fromJson(v));
      });
    }
    if (json['teams'] != null) {
      teams = <Teams>[];
      json['teams'].forEach((v) {
        teams!.add(Teams.fromJson(v));
      });
    }
    totalPlayers = json['total_players'];
    if (json['elements'] != null) {
      elements = <Elements>[];
      json['elements'].forEach((v) {
        elements!.add(Elements.fromJson(v));
      });
    }
    if (json['element_stats'] != null) {
      elementStats = <ElementStats>[];
      json['element_stats'].forEach((v) {
        elementStats!.add(ElementStats.fromJson(v));
      });
    }
    if (json['element_types'] != null) {
      elementTypes = <ElementTypes>[];
      json['element_types'].forEach((v) {
        elementTypes!.add(ElementTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (events != null) {
      data['events'] = events!.map((v) => v.toJson()).toList();
    }
    // if (gameSettings != null) {
    //   data['game_settings'] = gameSettings!.toJson();
    // }
    if (phases != null) {
      data['phases'] = phases!.map((v) => v.toJson()).toList();
    }
    if (teams != null) {
      data['teams'] = teams!.map((v) => v.toJson()).toList();
    }
    data['total_players'] = totalPlayers;
    if (elements != null) {
      data['elements'] = elements!.map((v) => v.toJson()).toList();
    }
    if (elementStats != null) {
      data['element_stats'] = elementStats!.map((v) => v.toJson()).toList();
    }
    if (elementTypes != null) {
      data['element_types'] = elementTypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Events {
  num? id;
  String? name;
  String? deadlineTime;
//  Null? releaseTime;
  num? averageEntryScore;
  bool? finished;
  bool? dataChecked;
  num? highestScoringEntry;
  num? deadlineTimeEpoch;
  num? deadlineTimeGameOffset;
  num? highestScore;
  bool? isPrevious;
  bool? isCurrent;
  bool? isNext;
  bool? cupLeaguesCreated;
  bool? h2hKoMatchesCreated;
  num? rankedCount;
  List<ChipPlays>? chipPlays;
  num? mostSelected;
  num? mostTransferredIn;
  num? topElement;
  TopElementInfo? topElementInfo;
  num? transfersMade;
  num? mostCaptained;
  num? mostViceCaptained;

  Events(
      {this.id,
      this.name,
      this.deadlineTime,
      // this.releaseTime,
      this.averageEntryScore,
      this.finished,
      this.dataChecked,
      this.highestScoringEntry,
      this.deadlineTimeEpoch,
      this.deadlineTimeGameOffset,
      this.highestScore,
      this.isPrevious,
      this.isCurrent,
      this.isNext,
      this.cupLeaguesCreated,
      this.h2hKoMatchesCreated,
      this.rankedCount,
      this.chipPlays,
      this.mostSelected,
      this.mostTransferredIn,
      this.topElement,
      this.topElementInfo,
      this.transfersMade,
      this.mostCaptained,
      this.mostViceCaptained});

  Events.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    deadlineTime = json['deadline_time'];
    //releaseTime = json['release_time'];
    averageEntryScore = json['average_entry_score'];
    finished = json['finished'];
    dataChecked = json['data_checked'];
    highestScoringEntry = json['highest_scoring_entry'];
    deadlineTimeEpoch = json['deadline_time_epoch'];
    deadlineTimeGameOffset = json['deadline_time_game_offset'];
    highestScore = json['highest_score'];
    isPrevious = json['is_previous'];
    isCurrent = json['is_current'];
    isNext = json['is_next'];
    cupLeaguesCreated = json['cup_leagues_created'];
    h2hKoMatchesCreated = json['h2h_ko_matches_created'];
    rankedCount = json['ranked_count'];
    if (json['chip_plays'] != null) {
      chipPlays = <ChipPlays>[];
      json['chip_plays'].forEach((v) {
        chipPlays!.add(ChipPlays.fromJson(v));
      });
    }
    mostSelected = json['most_selected'];
    mostTransferredIn = json['most_transferred_in'];
    topElement = json['top_element'];
    topElementInfo = json['top_element_info'] != null
        ? TopElementInfo.fromJson(json['top_element_info'])
        : null;
    transfersMade = json['transfers_made'];
    mostCaptained = json['most_captained'];
    mostViceCaptained = json['most_vice_captained'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['deadline_time'] = deadlineTime;
    // data['release_time'] = releaseTime;
    data['average_entry_score'] = averageEntryScore;
    data['finished'] = finished;
    data['data_checked'] = dataChecked;
    data['highest_scoring_entry'] = highestScoringEntry;
    data['deadline_time_epoch'] = deadlineTimeEpoch;
    data['deadline_time_game_offset'] = deadlineTimeGameOffset;
    data['highest_score'] = highestScore;
    data['is_previous'] = isPrevious;
    data['is_current'] = isCurrent;
    data['is_next'] = isNext;
    data['cup_leagues_created'] = cupLeaguesCreated;
    data['h2h_ko_matches_created'] = h2hKoMatchesCreated;
    data['ranked_count'] = rankedCount;
    if (chipPlays != null) {
      data['chip_plays'] = chipPlays!.map((v) => v.toJson()).toList();
    }
    data['most_selected'] = mostSelected;
    data['most_transferred_in'] = mostTransferredIn;
    data['top_element'] = topElement;
    if (topElementInfo != null) {
      data['top_element_info'] = topElementInfo!.toJson();
    }
    data['transfers_made'] = transfersMade;
    data['most_captained'] = mostCaptained;
    data['most_vice_captained'] = mostViceCaptained;
    return data;
  }
}

class ChipPlays {
  String? chipName;
  num? numPlayed;

  ChipPlays({this.chipName, this.numPlayed});

  ChipPlays.fromJson(Map<String, dynamic> json) {
    chipName = json['chip_name'];
    numPlayed = json['num_played'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chip_name'] = chipName;
    data['num_played'] = numPlayed;
    return data;
  }
}

class TopElementInfo {
  num? id;
  num? points;

  TopElementInfo({this.id, this.points});

  TopElementInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['points'] = points;
    return data;
  }
}

// class GameSettings {
//   num? leagueJoinPrivateMax;
//   num? leagueJoinPublicMax;
//   num? leagueMaxSizePublicClassic;
//   num? leagueMaxSizePublicH2h;
//   num? leagueMaxSizePrivateH2h;
//   num? leagueMaxKoRoundsPrivateH2h;
//   String? leaguePrefixPublic;
//   num? leaguepointsH2hWin;
//   num? leaguepointsH2hLose;
//   num? leaguepointsH2hDraw;
//   bool? leagueKoFirstInsteadOfRandom;
//   Null? cupStartEventId;
//   Null? cupStopEventId;
//   Null? cupQualifyingMethod;
//   Null? cupType;
//   List<Null>? featuredEntries;
//   List<num>? percentileRanks;
//   num? squadSquadplay;
//   num? squadSquadsize;
//   num? squadTeamLimit;
//   num? squadTotalSpend;
//   num? uiCurrencyMultiplier;
//   bool? uiUseSpecialShirts;
//   List<Null>? uiSpecialShirtExclusions;
//   num? statsFormDays;
//   bool? sysViceCaptainEnabled;
//   num? transfersCap;
//   num? transfersSellOnFee;
//   num? maxExtraFreeTransfers;
//   List<String>? leagueH2hTiebreakStats;
//   String? timezone;

//   GameSettings(
//       {this.leagueJoinPrivateMax,
//       this.leagueJoinPublicMax,
//       this.leagueMaxSizePublicClassic,
//       this.leagueMaxSizePublicH2h,
//       this.leagueMaxSizePrivateH2h,
//       this.leagueMaxKoRoundsPrivateH2h,
//       this.leaguePrefixPublic,
//       this.leaguepointsH2hWin,
//       this.leaguepointsH2hLose,
//       this.leaguepointsH2hDraw,
//       this.leagueKoFirstInsteadOfRandom,
//       this.cupStartEventId,
//       this.cupStopEventId,
//       this.cupQualifyingMethod,
//       this.cupType,
//       this.featuredEntries,
//       this.percentileRanks,
//       this.squadSquadplay,
//       this.squadSquadsize,
//       this.squadTeamLimit,
//       this.squadTotalSpend,
//       this.uiCurrencyMultiplier,
//       this.uiUseSpecialShirts,
//       this.uiSpecialShirtExclusions,
//       this.statsFormDays,
//       this.sysViceCaptainEnabled,
//       this.transfersCap,
//       this.transfersSellOnFee,
//       this.maxExtraFreeTransfers,
//       this.leagueH2hTiebreakStats,
//       this.timezone});

//   GameSettings.fromJson(Map<String, dynamic> json) {
//     leagueJoinPrivateMax = json['league_join_private_max'];
//     leagueJoinPublicMax = json['league_join_public_max'];
//     leagueMaxSizePublicClassic = json['league_max_size_public_classic'];
//     leagueMaxSizePublicH2h = json['league_max_size_public_h2h'];
//     leagueMaxSizePrivateH2h = json['league_max_size_private_h2h'];
//     leagueMaxKoRoundsPrivateH2h = json['league_max_ko_rounds_private_h2h'];
//     leaguePrefixPublic = json['league_prefix_public'];
//     leaguepointsH2hWin = json['league_points_h2h_win'];
//     leaguepointsH2hLose = json['league_points_h2h_lose'];
//     leaguepointsH2hDraw = json['league_points_h2h_draw'];
//     leagueKoFirstInsteadOfRandom = json['league_ko_first_instead_of_random'];
//     cupStartEventId = json['cup_start_event_id'];
//     cupStopEventId = json['cup_stop_event_id'];
//     cupQualifyingMethod = json['cup_qualifying_method'];
//     cupType = json['cup_type'];
//     if (json['featured_entries'] != null) {
//       featuredEntries = <Null>[];
//       json['featured_entries'].forEach((v) {
//         featuredEntries!.add(Null.fromJson(v));
//       });
//     }
//     percentileRanks = json['percentile_ranks'].cast<num>();
//     squadSquadplay = json['squad_squadplay'];
//     squadSquadsize = json['squad_squadsize'];
//     squadTeamLimit = json['squad_team_limit'];
//     squadTotalSpend = json['squad_total_spend'];
//     uiCurrencyMultiplier = json['ui_currency_multiplier'];
//     uiUseSpecialShirts = json['ui_use_special_shirts'];
//     if (json['ui_special_shirt_exclusions'] != null) {
//       uiSpecialShirtExclusions = <Null>[];
//       json['ui_special_shirt_exclusions'].forEach((v) {
//         uiSpecialShirtExclusions!.add(Null.fromJson(v));
//       });
//     }
//     statsFormDays = json['stats_form_days'];
//     sysViceCaptainEnabled = json['sys_vice_captain_enabled'];
//     transfersCap = json['transfers_cap'];
//     transfersSellOnFee = json['transfers_sell_on_fee'];
//     maxExtraFreeTransfers = json['max_extra_free_transfers'];
//     leagueH2hTiebreakStats = json['league_h2h_tiebreak_stats'].cast<String>();
//     timezone = json['timezone'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['league_join_private_max'] = leagueJoinPrivateMax;
//     data['league_join_public_max'] = leagueJoinPublicMax;
//     data['league_max_size_public_classic'] = leagueMaxSizePublicClassic;
//     data['league_max_size_public_h2h'] = leagueMaxSizePublicH2h;
//     data['league_max_size_private_h2h'] = leagueMaxSizePrivateH2h;
//     data['league_max_ko_rounds_private_h2h'] = leagueMaxKoRoundsPrivateH2h;
//     data['league_prefix_public'] = leaguePrefixPublic;
//     data['league_points_h2h_win'] = leaguepointsH2hWin;
//     data['league_points_h2h_lose'] = leaguepointsH2hLose;
//     data['league_points_h2h_draw'] = leaguepointsH2hDraw;
//     data['league_ko_first_instead_of_random'] = leagueKoFirstInsteadOfRandom;
//     data['cup_start_event_id'] = cupStartEventId;
//     data['cup_stop_event_id'] = cupStopEventId;
//     data['cup_qualifying_method'] = cupQualifyingMethod;
//     data['cup_type'] = cupType;
//     if (featuredEntries != null) {
//       data['featured_entries'] =
//           featuredEntries!.map((v) => v.toJson()).toList();
//     }
//     data['percentile_ranks'] = percentileRanks;
//     data['squad_squadplay'] = squadSquadplay;
//     data['squad_squadsize'] = squadSquadsize;
//     data['squad_team_limit'] = squadTeamLimit;
//     data['squad_total_spend'] = squadTotalSpend;
//     data['ui_currency_multiplier'] = uiCurrencyMultiplier;
//     data['ui_use_special_shirts'] = uiUseSpecialShirts;
//     if (uiSpecialShirtExclusions != null) {
//       data['ui_special_shirt_exclusions'] =
//           uiSpecialShirtExclusions!.map((v) => v.toJson()).toList();
//     }
//     data['stats_form_days'] = statsFormDays;
//     data['sys_vice_captain_enabled'] = sysViceCaptainEnabled;
//     data['transfers_cap'] = transfersCap;
//     data['transfers_sell_on_fee'] = transfersSellOnFee;
//     data['max_extra_free_transfers'] = maxExtraFreeTransfers;
//     data['league_h2h_tiebreak_stats'] = leagueH2hTiebreakStats;
//     data['timezone'] = timezone;
//     return data;
//   }
// }

class Phases {
  num? id;
  String? name;
  num? startEvent;
  num? stopEvent;

  Phases({this.id, this.name, this.startEvent, this.stopEvent});

  Phases.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startEvent = json['start_event'];
    stopEvent = json['stop_event'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['start_event'] = startEvent;
    data['stop_event'] = stopEvent;
    return data;
  }
}

class Teams {
  num? code;
  num? draw;
  //Null? form;
  num? id;
  num? loss;
  String? name;
  num? played;
  num? points;
  num? position;
  String? shortName;
  num? strength;
  // Null? teamDivision;
  bool? unavailable;
  num? win;
  num? strengthOverallHome;
  num? strengthOverallAway;
  num? strengthAttackHome;
  num? strengthAttackAway;
  num? strengthDefenceHome;
  num? strengthDefenceAway;
  num? pulseId;

  Teams(
      {this.code,
      this.draw,
      // this.form,
      this.id,
      this.loss,
      this.name,
      this.played,
      this.points,
      this.position,
      this.shortName,
      this.strength,
      //  this.teamDivision,
      this.unavailable,
      this.win,
      this.strengthOverallHome,
      this.strengthOverallAway,
      this.strengthAttackHome,
      this.strengthAttackAway,
      this.strengthDefenceHome,
      this.strengthDefenceAway,
      this.pulseId});

  Teams.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    draw = json['draw'];
    // form = json['form'];
    id = json['id'];
    loss = json['loss'];
    name = json['name'];
    played = json['played'];
    points = json['points'];
    position = json['position'];
    shortName = json['short_name'];
    strength = json['strength'];
    //teamDivision = json['team_division'];
    unavailable = json['unavailable'];
    win = json['win'];
    strengthOverallHome = json['strength_overall_home'];
    strengthOverallAway = json['strength_overall_away'];
    strengthAttackHome = json['strength_attack_home'];
    strengthAttackAway = json['strength_attack_away'];
    strengthDefenceHome = json['strength_defence_home'];
    strengthDefenceAway = json['strength_defence_away'];
    pulseId = json['pulse_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['draw'] = draw;
    // data['form'] = form;
    data['id'] = id;
    data['loss'] = loss;
    data['name'] = name;
    data['played'] = played;
    data['points'] = points;
    data['position'] = position;
    data['short_name'] = shortName;
    data['strength'] = strength;
    // data['team_division'] = teamDivision;
    data['unavailable'] = unavailable;
    data['win'] = win;
    data['strength_overall_home'] = strengthOverallHome;
    data['strength_overall_away'] = strengthOverallAway;
    data['strength_attack_home'] = strengthAttackHome;
    data['strength_attack_away'] = strengthAttackAway;
    data['strength_defence_home'] = strengthDefenceHome;
    data['strength_defence_away'] = strengthDefenceAway;
    data['pulse_id'] = pulseId;
    return data;
  }
}

class Elements {
  num? chanceOfPlayingNextRound;
  num? chanceOfPlayingThisRound;
  num? code;
  num? costChangeEvent;
  num? costChangeEventFall;
  num? costChangeStart;
  num? costChangeStartFall;
  num? dreamteamCount;
  num? elementType;
  String? epNext;
  String? epThis;
  num? eventPoints;
  String? firstName;
  String? form;
  num? id;
  bool? inDreamteam;
  String? news;
  String? newsAdded;
  num? nowCost;
  String? photo;
  String? pointsPerGame;
  String? secondName;
  String? selectedByPercent;
  bool? special;
  // Null? squadNumber;
  String? status;
  num? team;
  num? teamCode;
  num? totalpoints;
  num? transfersIn;
  num? transfersInEvent;
  num? transfersOut;
  num? transfersOutEvent;
  String? valueForm;
  String? valueSeason;
  String? webName;
  num? minutes;
  num? goalsScored;
  num? assists;
  num? cleanSheets;
  num? goalsConceded;
  num? ownGoals;
  num? penaltiesSaved;
  num? penaltiesMissed;
  num? yellowCards;
  num? redCards;
  num? saves;
  num? bonus;
  num? bps;
  String? influence;
  String? creativity;
  String? threat;
  String? ictIndex;
  num? starts;
  String? expectedGoals;
  String? expectedAssists;
  String? expectedGoalInvolvements;
  String? expectedGoalsConceded;
  num? influenceRank;
  num? influenceRankType;
  num? creativityRank;
  num? creativityRankType;
  num? threatRank;
  num? threatRankType;
  num? ictIndexRank;
  num? ictIndexRankType;
  num? cornersAndIndirectFreekicksOrder;
  String? cornersAndIndirectFreekicksText;
  num? directFreekicksOrder;
  String? directFreekicksText;
  num? penaltiesOrder;
  String? penaltiesText;
  num? expectedGoalsPer90;
  num? savesPer90;
  num? expectedAssistsPer90;
  num? expectedGoalInvolvementsPer90;
  num? expectedGoalsConcededPer90;
  num? goalsConcededPer90;
  num? nowCostRank;
  num? nowCostRankType;
  num? formRank;
  num? formRankType;
  num? pointsPerGameRank;
  num? pointsPerGameRankType;
  num? selectedRank;
  num? selectedRankType;
  num? startsPer90;
  num? cleanSheetsPer90;

  Elements(
      {this.chanceOfPlayingNextRound,
      this.chanceOfPlayingThisRound,
      this.code,
      this.costChangeEvent,
      this.costChangeEventFall,
      this.costChangeStart,
      this.costChangeStartFall,
      this.dreamteamCount,
      this.elementType,
      this.epNext,
      this.epThis,
      this.eventPoints,
      this.firstName,
      this.form,
      this.id,
      this.inDreamteam,
      this.news,
      this.newsAdded,
      this.nowCost,
      this.photo,
      this.pointsPerGame,
      this.secondName,
      this.selectedByPercent,
      this.special,
      //this.squadNumber,
      this.status,
      this.team,
      this.teamCode,
      this.totalpoints,
      this.transfersIn,
      this.transfersInEvent,
      this.transfersOut,
      this.transfersOutEvent,
      this.valueForm,
      this.valueSeason,
      this.webName,
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
      this.influenceRank,
      this.influenceRankType,
      this.creativityRank,
      this.creativityRankType,
      this.threatRank,
      this.threatRankType,
      this.ictIndexRank,
      this.ictIndexRankType,
      this.cornersAndIndirectFreekicksOrder,
      this.cornersAndIndirectFreekicksText,
      this.directFreekicksOrder,
      this.directFreekicksText,
      this.penaltiesOrder,
      this.penaltiesText,
      this.expectedGoalsPer90,
      this.savesPer90,
      this.expectedAssistsPer90,
      this.expectedGoalInvolvementsPer90,
      this.expectedGoalsConcededPer90,
      this.goalsConcededPer90,
      this.nowCostRank,
      this.nowCostRankType,
      this.formRank,
      this.formRankType,
      this.pointsPerGameRank,
      this.pointsPerGameRankType,
      this.selectedRank,
      this.selectedRankType,
      this.startsPer90,
      this.cleanSheetsPer90});

  Elements.fromJson(Map<String, dynamic> json) {
    chanceOfPlayingNextRound = json['chance_of_playing_next_round'];
    chanceOfPlayingThisRound = json['chance_of_playing_this_round'];
    code = json['code'];
    costChangeEvent = json['cost_change_event'];
    costChangeEventFall = json['cost_change_event_fall'];
    costChangeStart = json['cost_change_start'];
    costChangeStartFall = json['cost_change_start_fall'];
    dreamteamCount = json['dreamteam_count'];
    elementType = json['element_type'];
    epNext = json['ep_next'];
    epThis = json['ep_this'];
    eventPoints = json['event_points'];
    firstName = json['first_name'];
    form = json['form'];
    id = json['id'];
    inDreamteam = json['in_dreamteam'];
    news = json['news'];
    newsAdded = json['news_added'];
    nowCost = json['now_cost'];
    photo = json['photo'];
    pointsPerGame = json['points_per_game'];
    secondName = json['second_name'];
    selectedByPercent = json['selected_by_percent'];
    special = json['special'];
    //  squadNumber = json['squad_number'];
    status = json['status'];
    team = json['team'];
    teamCode = json['team_code'];
    totalpoints = json['total_points'];
    transfersIn = json['transfers_in'];
    transfersInEvent = json['transfers_in_event'];
    transfersOut = json['transfers_out'];
    transfersOutEvent = json['transfers_out_event'];
    valueForm = json['value_form'];
    valueSeason = json['value_season'];
    webName = json['web_name'];
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
    influenceRank = json['influence_rank'];
    influenceRankType = json['influence_rank_type'];
    creativityRank = json['creativity_rank'];
    creativityRankType = json['creativity_rank_type'];
    threatRank = json['threat_rank'];
    threatRankType = json['threat_rank_type'];
    ictIndexRank = json['ict_index_rank'];
    ictIndexRankType = json['ict_index_rank_type'];
    cornersAndIndirectFreekicksOrder =
        json['corners_and_indirect_freekicks_order'];
    cornersAndIndirectFreekicksText =
        json['corners_and_indirect_freekicks_text'];
    directFreekicksOrder = json['direct_freekicks_order'];
    directFreekicksText = json['direct_freekicks_text'];
    penaltiesOrder = json['penalties_order'];
    penaltiesText = json['penalties_text'];
    expectedGoalsPer90 = json['expected_goals_per_90'];
    savesPer90 = json['saves_per_90'];
    expectedAssistsPer90 = json['expected_assists_per_90'];
    expectedGoalInvolvementsPer90 = json['expected_goal_involvements_per_90'];
    expectedGoalsConcededPer90 = json['expected_goals_conceded_per_90'];
    goalsConcededPer90 = json['goals_conceded_per_90'];
    nowCostRank = json['now_cost_rank'];
    nowCostRankType = json['now_cost_rank_type'];
    formRank = json['form_rank'];
    formRankType = json['form_rank_type'];
    pointsPerGameRank = json['points_per_game_rank'];
    pointsPerGameRankType = json['points_per_game_rank_type'];
    selectedRank = json['selected_rank'];
    selectedRankType = json['selected_rank_type'];
    startsPer90 = json['starts_per_90'];
    cleanSheetsPer90 = json['clean_sheets_per_90'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chance_of_playing_next_round'] = chanceOfPlayingNextRound;
    data['chance_of_playing_this_round'] = chanceOfPlayingThisRound;
    data['code'] = code;
    data['cost_change_event'] = costChangeEvent;
    data['cost_change_event_fall'] = costChangeEventFall;
    data['cost_change_start'] = costChangeStart;
    data['cost_change_start_fall'] = costChangeStartFall;
    data['dreamteam_count'] = dreamteamCount;
    data['element_type'] = elementType;
    data['ep_next'] = epNext;
    data['ep_this'] = epThis;
    data['event_points'] = eventPoints;
    data['first_name'] = firstName;
    data['form'] = form;
    data['id'] = id;
    data['in_dreamteam'] = inDreamteam;
    data['news'] = news;
    data['news_added'] = newsAdded;
    data['now_cost'] = nowCost;
    data['photo'] = photo;
    data['points_per_game'] = pointsPerGame;
    data['second_name'] = secondName;
    data['selected_by_percent'] = selectedByPercent;
    data['special'] = special;
    //  data['squad_number'] = squadNumber;
    data['status'] = status;
    data['team'] = team;
    data['team_code'] = teamCode;
    data['total_points'] = totalpoints;
    data['transfers_in'] = transfersIn;
    data['transfers_in_event'] = transfersInEvent;
    data['transfers_out'] = transfersOut;
    data['transfers_out_event'] = transfersOutEvent;
    data['value_form'] = valueForm;
    data['value_season'] = valueSeason;
    data['web_name'] = webName;
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
    data['influence_rank'] = influenceRank;
    data['influence_rank_type'] = influenceRankType;
    data['creativity_rank'] = creativityRank;
    data['creativity_rank_type'] = creativityRankType;
    data['threat_rank'] = threatRank;
    data['threat_rank_type'] = threatRankType;
    data['ict_index_rank'] = ictIndexRank;
    data['ict_index_rank_type'] = ictIndexRankType;
    data['corners_and_indirect_freekicks_order'] =
        cornersAndIndirectFreekicksOrder;
    data['corners_and_indirect_freekicks_text'] =
        cornersAndIndirectFreekicksText;
    data['direct_freekicks_order'] = directFreekicksOrder;
    data['direct_freekicks_text'] = directFreekicksText;
    data['penalties_order'] = penaltiesOrder;
    data['penalties_text'] = penaltiesText;
    data['expected_goals_per_90'] = expectedGoalsPer90;
    data['saves_per_90'] = savesPer90;
    data['expected_assists_per_90'] = expectedAssistsPer90;
    data['expected_goal_involvements_per_90'] = expectedGoalInvolvementsPer90;
    data['expected_goals_conceded_per_90'] = expectedGoalsConcededPer90;
    data['goals_conceded_per_90'] = goalsConcededPer90;
    data['now_cost_rank'] = nowCostRank;
    data['now_cost_rank_type'] = nowCostRankType;
    data['form_rank'] = formRank;
    data['form_rank_type'] = formRankType;
    data['points_per_game_rank'] = pointsPerGameRank;
    data['points_per_game_rank_type'] = pointsPerGameRankType;
    data['selected_rank'] = selectedRank;
    data['selected_rank_type'] = selectedRankType;
    data['starts_per_90'] = startsPer90;
    data['clean_sheets_per_90'] = cleanSheetsPer90;
    return data;
  }
}

class ElementStats {
  String? label;
  String? name;

  ElementStats({this.label, this.name});

  ElementStats.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['name'] = name;
    return data;
  }
}

class ElementTypes {
  num? id;
  String? pluralName;
  String? pluralNameShort;
  String? singularName;
  String? singularNameShort;
  num? squadSelect;
  // Null? squadMinSelect;
  // Null? squadMaxSelect;
  num? squadMinPlay;
  num? squadMaxPlay;
  bool? uiShirtSpecific;
  List<num>? subPositionsLocked;
  num? elementCount;

  ElementTypes(
      {this.id,
      this.pluralName,
      this.pluralNameShort,
      this.singularName,
      this.singularNameShort,
      this.squadSelect,
      //this.squadMinSelect,
      // this.squadMaxSelect,
      this.squadMinPlay,
      this.squadMaxPlay,
      this.uiShirtSpecific,
      this.subPositionsLocked,
      this.elementCount});

  ElementTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pluralName = json['plural_name'];
    pluralNameShort = json['plural_name_short'];
    singularName = json['singular_name'];
    singularNameShort = json['singular_name_short'];
    squadSelect = json['squad_select'];
    // squadMinSelect = json['squad_min_select'];
    // squadMaxSelect = json['squad_max_select'];
    squadMinPlay = json['squad_min_play'];
    squadMaxPlay = json['squad_max_play'];
    uiShirtSpecific = json['ui_shirt_specific'];
    subPositionsLocked = json['sub_positions_locked'].cast<num>();
    elementCount = json['element_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['plural_name'] = pluralName;
    data['plural_name_short'] = pluralNameShort;
    data['singular_name'] = singularName;
    data['singular_name_short'] = singularNameShort;
    data['squad_select'] = squadSelect;
    // data['squad_min_select'] = squadMinSelect;
    // data['squad_max_select'] = squadMaxSelect;
    data['squad_min_play'] = squadMinPlay;
    data['squad_max_play'] = squadMaxPlay;
    data['ui_shirt_specific'] = uiShirtSpecific;
    data['sub_positions_locked'] = subPositionsLocked;
    data['element_count'] = elementCount;
    return data;
  }
}
