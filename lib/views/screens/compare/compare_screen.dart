import 'package:fb_livescore/models/status_model.dart';
import 'package:fb_livescore/models/team_model.dart';
import 'package:fb_livescore/services/api_constant.dart';
import 'package:fb_livescore/utils/text_style_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';

class CompareScreen extends StatefulWidget {
  const CompareScreen({super.key});

  @override
  State<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  Elements? selectedPlayer1;
  Elements? selectedPlayer2;

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: const Text('News'),
      //   centerTitle: true,
      // ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * .05,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    showPlayerChoiceDialog1(context, homeController.players);
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .4,
                    height: MediaQuery.of(context).size.height * .25,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                        elevation: 5,
                        child: selectedPlayer1 == null
                            ? const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Add Player"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Icon(Icons.add_circle_outlined)
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Image.network(
                                          "${ApiConstant.imageUrl}${selectedPlayer1?.photo?.replaceAll('.jpg', '.png') ?? ''}",
                                          width: 50,
                                          height: 70,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      selectedPlayer1!.secondName ?? "",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Opacity(
                                        opacity: 0.7,
                                        child: Text(
                                          teamList
                                                  .firstWhere((element) =>
                                                      int.parse(element.id
                                                          .toString()) ==
                                                      int.parse(selectedPlayer1!
                                                          .team
                                                          .toString()))
                                                  .name ??
                                              '',
                                        )),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Opacity(
                                        opacity: 0.7,
                                        child: Text(selectedPlayer1!
                                                    .elementType ==
                                                1
                                            ? "Goalkeeper"
                                            : selectedPlayer1!.elementType == 2
                                                ? "Defender"
                                                : selectedPlayer1!
                                                            .elementType ==
                                                        3
                                                    ? "Midfielder"
                                                    : "Forward")),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ])),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showPlayerChoiceDialog2(context, homeController.players);
                  },
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * .4,
                      height: MediaQuery.of(context).size.height * .25,
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5,
                          child: selectedPlayer2 == null
                              ? const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Add Player"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Icon(Icons.add_circle_outlined)
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          // Image.network(
                                          //   teamList
                                          //           .firstWhere((element) =>
                                          //               int.parse(element.id
                                          //                   .toString()) ==
                                          //               int.parse(selectedPlayer1!
                                          //                   .team
                                          //                   .toString()))
                                          //           .imageUrl ??
                                          //       '',
                                          //   width: 20,
                                          //   height: 20,
                                          // ),
                                          Image.network(
                                            "${ApiConstant.imageUrl}${selectedPlayer2?.photo?.replaceAll('.jpg', '.png') ?? ''}",
                                            width: 50,
                                            height: 70,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        selectedPlayer2!.secondName ?? "",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Opacity(
                                          opacity: 0.7,
                                          child: Text(
                                            teamList
                                                    .firstWhere((element) =>
                                                        int.parse(element.id
                                                            .toString()) ==
                                                        int.parse(
                                                            selectedPlayer2!
                                                                .team
                                                                .toString()))
                                                    .name ??
                                                '',
                                          )),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Opacity(
                                          opacity: 0.7,
                                          child: Text(selectedPlayer2!
                                                      .elementType ==
                                                  1
                                              ? "Goalkeeper"
                                              : selectedPlayer2!.elementType ==
                                                      2
                                                  ? "Defender"
                                                  : selectedPlayer2!
                                                              .elementType ==
                                                          3
                                                      ? "Midfielder"
                                                      : "Forward")),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ]))),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * .05,
          ),
          Container(
              padding: const EdgeInsets.all(8),
              // height: MediaQuery.of(context).size.height
              //   ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
              selectedPlayer1?.nowCost!=null? "\u00A3${(selectedPlayer1?.nowCost ?? 0) / 10}":"",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer1?.totalpoints ?? ''}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        selectedPlayer1?.pointsPerGame ?? '',
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        selectedPlayer1?.form ?? '',
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer1?.starts ?? ''}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer1?.minutes ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer1?.goalsScored ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer1?.assists ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer1?.cleanSheets ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer1?.saves ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        selectedPlayer1?.expectedGoals ?? '',
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        selectedPlayer1?.expectedAssists ?? "",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        selectedPlayer1?.expectedGoalInvolvements ?? "",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer1?.expectedGoalsPer90 ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer1?.expectedAssistsPer90 ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer1?.expectedGoalInvolvementsPer90 ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer1?.goalsConceded ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer1?.goalsConcededPer90 ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer1?.expectedGoalsConcededPer90 ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer1?.penaltiesMissed ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer1?.yellowCards ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer1?.redCards ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer1?.ownGoals ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer1?.bonus ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer1?.bps ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        selectedPlayer1?.influence ?? "",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        selectedPlayer1?.creativity ?? "",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        selectedPlayer1?.threat ?? "",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        selectedPlayer1?.ictIndex ?? "",
                        style: defaultTextStyleBlack,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Price",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Total Points",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Points Per Game",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Form",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Starts",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Minutes",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Goals",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Assists",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Clean Sheets",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Saves",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "xGoals",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "xAssists",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "xGoal Involvements",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "xGoal Per 90",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "xAssist Per 90",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "xGI Per 90",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Goals Conceded",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "GC Per 90",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "xGC Per 90",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Penalties Missed",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Yellow Cards",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Red Cards",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Own Goals",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Bonus",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "BPS",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Influence",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Creativity",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Threat",
                        style: defaultTextStyleGrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "ICT Index",
                        style: defaultTextStyleGrey,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        selectedPlayer2?.nowCost!=null? "\u00A3${(selectedPlayer2?.nowCost ?? 0) / 10}":"",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer2?.totalpoints ?? ''}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        selectedPlayer2?.pointsPerGame ?? '',
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        selectedPlayer2?.form ?? '',
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer2?.starts ?? ''}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer2?.minutes ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer2?.goalsScored ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer2?.assists ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer2?.cleanSheets ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer2?.saves ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer2?.expectedGoals ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        selectedPlayer2?.expectedAssists ?? "",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        selectedPlayer2?.expectedGoalInvolvements ?? "",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer2?.expectedGoalsPer90 ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer2?.expectedAssistsPer90 ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer2?.expectedGoalInvolvementsPer90 ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer2?.goalsConceded ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer2?.goalsConcededPer90 ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer2?.expectedGoalsConcededPer90 ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer2?.penaltiesMissed ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer2?.yellowCards ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer2?.redCards ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer2?.ownGoals ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer2?.bonus ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${selectedPlayer2?.bps ?? ""}",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        selectedPlayer2?.influence ?? "",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        selectedPlayer2?.creativity ?? "",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        selectedPlayer2?.threat ?? "",
                        style: defaultTextStyleBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        selectedPlayer2?.ictIndex ?? "",
                        style: defaultTextStyleBlack,
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }

  void showPlayerChoiceDialog1(BuildContext context, RxList<Elements> players) {
    showDialog(

      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          title: const Text('Choose a Player'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: players.length,
              itemBuilder: (BuildContext context, int index) {
                return PlayerListItem(
                  player: players[index],
                  onTap: () {
                    setState(() {
                      selectedPlayer1 = players[index];
                    });
                    Navigator.of(context).pop(); // Close the dialog
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  void showPlayerChoiceDialog2(BuildContext context, RxList<Elements> players) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          title: const Text('Choose a Player'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: players.length,
              itemBuilder: (BuildContext context, int index) {
                return PlayerListItem(
                  player: players[index],
                  onTap: () {
                    setState(() {
                      selectedPlayer2 = players[index];
                    });
                    Navigator.of(context).pop(); // Close the dialog
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class PlayerListItem extends StatelessWidget {
  final Elements player;
  final VoidCallback onTap;

  const PlayerListItem({super.key, required this.player, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Image.network(
          "${ApiConstant.imageUrl}${player.photo?.replaceAll('.jpg', '.png') ?? ''}",
          width: 40,
          height: 50,
        ), // Placeholder for player icon
        title: Text(player.secondName ?? ""),

        subtitle: Text(
            '${player.elementType}, Price: \u00A3${(player.nowCost ?? 1) / 10}, Points: ${player.totalpoints}'),
        //trailing: const Icon(Icons.add_circle_outline),
      ),
    );
  }
}
