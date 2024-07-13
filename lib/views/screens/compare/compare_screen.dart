import 'package:fb_livescore/models/status_model.dart';
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
        body: Obx(
          () => ListView(
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
                        showPlayerChoiceDialog1(
                            context, homeController.players);
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .4,
                        height: MediaQuery.of(context).size.height * .25,
                        child: Card(
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
                                            child: Text("Team Code")),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Opacity(
                                            opacity: 0.7,
                                            child: Text(selectedPlayer1!
                                                        .elementType ==
                                                    1
                                                ? "Goalkeeper"
                                                : selectedPlayer1!
                                                            .elementType ==
                                                        2
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
                        showPlayerChoiceDialog2(
                            context, homeController.players);
                      },
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * .4,
                          height: MediaQuery.of(context).size.height * .25,
                          child: Card(
                              child: selectedPlayer2 == null
                                  ? const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Add Player"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Icon(Icons.add_circle_outlined)
                                      ],
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
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
                                              child: Text("Team Code")),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Opacity(
                                              opacity: 0.7,
                                              child: Text(selectedPlayer2!
                                                          .elementType ==
                                                      1
                                                  ? "Goalkeeper"
                                                  : selectedPlayer2!
                                                              .elementType ==
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
                            "\u00A3${(selectedPlayer1?.nowCost ?? 0) / 10}",
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
                            '',
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.minutes.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.goalsScored.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.assists.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.cleanSheets.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.saves.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.expectedGoals.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.expectedAssists.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.expectedGoalInvolvements
                                .toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.expectedGoalsPer90.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.expectedAssistsPer90.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.expectedGoalInvolvementsPer90
                                .toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.goalsConceded.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.goalsConcededPer90.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.expectedGoalsConcededPer90
                                .toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.penaltiesMissed.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.yellowCards.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.redCards.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.ownGoals.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.bonus.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.bps.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.influence.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.creativity.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.threat.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer1!.ictIndex.toString(),
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
                            "\u00A3${num.parse(selectedPlayer2!.nowCost.toString()) / 10}",
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.totalpoints.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.pointsPerGame.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.form.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.starts.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.minutes.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.goalsScored.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.assists.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.cleanSheets.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.saves.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.expectedGoals.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.expectedAssists.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.expectedGoalInvolvements
                                .toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.expectedGoalsPer90.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.expectedAssistsPer90.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.expectedGoalInvolvementsPer90
                                .toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.goalsConceded.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.goalsConcededPer90.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.expectedGoalsConcededPer90
                                .toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.penaltiesMissed.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.yellowCards.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.redCards.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.ownGoals.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.bonus.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.bps.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.influence.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.creativity.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.threat.toString(),
                            style: defaultTextStyleBlack,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedPlayer2!.ictIndex.toString(),
                            style: defaultTextStyleBlack,
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }

  void showPlayerChoiceDialog1(BuildContext context, RxList<Elements> players) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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
        leading: const Icon(Icons.person), // Placeholder for player icon
        title: Text(player.secondName ?? ""),

        subtitle: Text(
            '${player.elementType}, Price: \u00A3${(player.nowCost ?? 1) / 10}, Points: ${player.totalpoints}'),
        trailing: const Icon(Icons.add_circle_outline),
      ),
    );
  }
}
