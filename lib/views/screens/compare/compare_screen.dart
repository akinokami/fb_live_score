import 'package:fb_livescore/utils/text_style_const.dart';
import 'package:flutter/material.dart';

class CompareScreen extends StatefulWidget {
  const CompareScreen({super.key});

  @override
  State<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  Player? selectedPlayer1;
  Player? selectedPlayer2;
  void showPlayerChoiceDialog1(BuildContext context, List<Player> players) {
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

  void showPlayerChoiceDialog2(BuildContext context, List<Player> players) {
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

  @override
  Widget build(BuildContext context) {
    List<Player> players = [
      Player(name: 'Player 1', role: 'Forward', price: 10.5, points: 100),
      Player(name: 'Player 2', role: 'Forward', price: 10.5, points: 100),
      Player(name: 'Player 3', role: 'Forward', price: 10.5, points: 100),
      // Add more players
    ];
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
                      showPlayerChoiceDialog1(context, players);
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
                                      Text(selectedPlayer1!.name),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(selectedPlayer1!.role),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(selectedPlayer1!.price.toString()),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(selectedPlayer1!.points.toString()),
                                    ])),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showPlayerChoiceDialog2(context, players);
                    },
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * .4,
                        height: MediaQuery.of(context).size.height * .25,
                        child: Card(
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
                                        Text(selectedPlayer2!.name),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(selectedPlayer2!.role),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(selectedPlayer2!.price.toString()),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            selectedPlayer2!.points.toString()),
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
                        ),const SizedBox(
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
                        ),const SizedBox(
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
                        ),const SizedBox(
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
                  ],
                )),
          ],
        ));
  }
}

class PlayerListItem extends StatelessWidget {
  final Player player;
  final VoidCallback onTap;

  const PlayerListItem({super.key, required this.player, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: const Icon(Icons.person), // Placeholder for player icon
        title: Text(player.name),
        subtitle: Text(
            '${player.role}, Price: \$${player.price}, Points: ${player.points}'),
        trailing: const Icon(Icons.add_circle_outline),
      ),
    );
  }
}

class Player {
  final String name;
  final String role;
  final double price;
  final int points;

  Player(
      {required this.name,
      required this.role,
      required this.price,
      required this.points});
}
