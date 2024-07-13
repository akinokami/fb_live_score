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
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Player 1"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 2"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 3"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 4"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 5"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 6"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 7"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 8"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 9"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 10"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 11"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 12"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 13"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 14"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 15"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 12"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 13"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 14"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 15"),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Player 1",
                          style: defaultTextStyleGrey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Player 2",
                          style: defaultTextStyleGrey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Player 3",
                          style: defaultTextStyleGrey,
                        ),
                        Text(
                          "Player 3",
                          style: defaultTextStyleGrey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Player 4",
                          style: defaultTextStyleGrey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Player 5",
                          style: defaultTextStyleGrey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Player 6",
                          style: defaultTextStyleGrey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Player 7",
                          style: defaultTextStyleGrey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Player 8",
                          style: defaultTextStyleGrey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Player 9",
                          style: defaultTextStyleGrey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Player 10",
                          style: defaultTextStyleGrey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Player 11",
                          style: defaultTextStyleGrey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Player 12",
                          style: defaultTextStyleGrey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Player 13",
                          style: defaultTextStyleGrey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Player 14",
                          style: defaultTextStyleGrey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Player 15",
                          style: defaultTextStyleGrey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Player 12",
                          style: defaultTextStyleGrey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Player 13",
                          style: defaultTextStyleGrey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Player 14",
                          style: defaultTextStyleGrey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Player 15",
                          style: defaultTextStyleGrey,
                        ),
                      ],
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Player 1"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 2"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 3"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 4"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 5"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 6"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 7"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 8"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 9"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 10"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 11"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 12"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 13"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 14"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 15"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 12"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 13"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 14"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Player 15"),
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
