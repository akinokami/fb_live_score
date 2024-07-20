import 'package:fb_livescore/models/status_model.dart';
import 'package:fb_livescore/models/team_model.dart';
import 'package:fb_livescore/services/api_constant.dart';
import 'package:fb_livescore/views/widgets/custom_text.dart';
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
                      CustomText(
                        text: selectedPlayer1?.nowCost != null
                            ? "\u00A3${(selectedPlayer1?.nowCost ?? 0) / 10}"
                            : "",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer1?.totalpoints ?? ''}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: selectedPlayer1?.pointsPerGame ?? '',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: selectedPlayer1?.form ?? '',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer1?.starts ?? ''}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer1?.minutes ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer1?.goalsScored ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer1?.assists ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer1?.cleanSheets ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer1?.saves ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: selectedPlayer1?.expectedGoals ?? '',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: selectedPlayer1?.expectedAssists ?? "",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: selectedPlayer1?.expectedGoalInvolvements ?? "",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer1?.expectedGoalsPer90 ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer1?.expectedAssistsPer90 ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text:
                            "${selectedPlayer1?.expectedGoalInvolvementsPer90 ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer1?.goalsConceded ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer1?.goalsConcededPer90 ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text:
                            "${selectedPlayer1?.expectedGoalsConcededPer90 ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer1?.penaltiesMissed ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer1?.yellowCards ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer1?.redCards ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer1?.ownGoals ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer1?.bonus ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer1?.bps ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: selectedPlayer1?.influence ?? "",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: selectedPlayer1?.creativity ?? "",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: selectedPlayer1?.threat ?? "",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: selectedPlayer1?.ictIndex ?? "",
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomText(
                        text: "Price",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Total Points",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Points Per Game",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Form",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Starts",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Minutes",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Goals",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Assists",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Clean Sheets",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Saves",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "xGoals",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "xAssists",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "xGoal Involvements",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "xGoal Per 90",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "xAssist Per 90",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "xGI Per 90",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Goals Conceded",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "GC Per 90",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "xGC Per 90",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Penalties Missed",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Yellow Cards",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Red Cards",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Own Goals",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Bonus",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "BPS",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Influence",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Creativity",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Threat",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "ICT Index",
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomText(
                        text: selectedPlayer2?.nowCost != null
                            ? "\u00A3${(selectedPlayer2?.nowCost ?? 0) / 10}"
                            : "",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer2?.totalpoints ?? ''}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: selectedPlayer2?.pointsPerGame ?? '',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: selectedPlayer2?.form ?? '',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer2?.starts ?? ''}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer2?.minutes ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer2?.goalsScored ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer2?.assists ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer2?.cleanSheets ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer2?.saves ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: selectedPlayer2?.expectedGoals ?? "",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: selectedPlayer2?.expectedAssists ?? "",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: selectedPlayer2?.expectedGoalInvolvements ?? "",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer2?.expectedGoalsPer90 ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer2?.expectedAssistsPer90 ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text:
                            "${selectedPlayer2?.expectedGoalInvolvementsPer90 ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer2?.goalsConceded ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer2?.goalsConcededPer90 ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text:
                            "${selectedPlayer2?.expectedGoalsConcededPer90 ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer2?.penaltiesMissed ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer2?.yellowCards ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer2?.redCards ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer2?.ownGoals ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer2?.bonus ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${selectedPlayer2?.bps ?? ""}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: selectedPlayer2?.influence ?? "",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: selectedPlayer2?.creativity ?? "",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: selectedPlayer2?.threat ?? "",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: selectedPlayer2?.ictIndex ?? "",
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
            child: players.isEmpty
                ? const Center(child: Text("No player found"))
                : ListView.builder(
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
            child: players.isEmpty
                ? const Center(child: Text("No player found"))
                : ListView.builder(
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
