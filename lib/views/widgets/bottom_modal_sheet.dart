import 'package:fb_livescore/controller/cart_controller.dart';
import 'package:fb_livescore/controller/match_history_controller.dart';
import 'package:fb_livescore/models/match_history_model.dart';
import 'package:fb_livescore/models/status_model.dart';
import 'package:fb_livescore/models/team_mode.dart';
import 'package:fb_livescore/services/api_constant.dart';
import 'package:fb_livescore/utils/app_theme.dart';
import 'package:fb_livescore/utils/constants.dart';
import 'package:fb_livescore/views/widgets/point_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/text_style_const.dart';

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent(
      {super.key, required this.title, this.modelData, required this.teamList});
  final String title;
  final Elements? modelData;
  final List<Teams> teamList;
  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  int _selectedIndex = 0;
  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildTabContainer(int index, String label) {
    return GestureDetector(
      onTap: () => _onTabTapped(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(5),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 3),

            // margin: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: _selectedIndex == index
                  ? const Color(0xff1B8B00)
                  : Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: _selectedIndex == index ? Colors.white : Colors.black,
                fontSize: 14.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _statsWidget(Elements modelData) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
        height: 500,
        child: ListView(
          children: [
            StatusTableWidget(
              title: 'Total Points',
              score: "${modelData.totalpoints}",
            ),
            StatusTableWidget(
              title: 'Points Per Game',
              score: "${modelData.pointsPerGame}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'Starts',
              score: "${modelData.starts}",
            ),
            StatusTableWidget(
              title: 'Minutes',
              score: "${modelData.minutes}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'Goals',
              score: "${modelData.goalsScored}",
            ),
            StatusTableWidget(
              title: 'Assists',
              score: "${modelData.assists}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'xGoals',
              score: "${modelData.expectedGoals}",
            ),
            StatusTableWidget(
              title: 'xAssists',
              score: "${modelData.expectedAssists}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'xGoals Involvements',
              score: "${modelData.expectedGoalInvolvements}",
            ),
            StatusTableWidget(
              title: 'xGoals Per 90',
              score: "${modelData.expectedGoalsPer90}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'xAssists Per 90',
              score: "${modelData.expectedAssistsPer90}",
            ),
            StatusTableWidget(
              title: 'xGoal Involvements Per 90',
              score: "${modelData.expectedGoalInvolvementsPer90}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'Goals Conceded',
              score: "${modelData.goalsConceded}",
            ),
            StatusTableWidget(
              title: 'Goals conceded Per 90',
              score: "${modelData.goalsConcededPer90}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'Penalties Missed',
              score: "${modelData.penaltiesMissed}",
            ),
            StatusTableWidget(
              title: 'Yellow Cards',
              score: "${modelData.yellowCards}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'Red Cards',
              score: "${modelData.redCards}",
            ),
            StatusTableWidget(
              title: 'Own Goals',
              score: "${modelData.ownGoals}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'Bonus',
              score: "${modelData.bonus}",
            ),
            StatusTableWidget(
              title: 'BPS',
              score: "${modelData.bps}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'Influence',
              score: "${modelData.influence}",
            ),
            StatusTableWidget(
              title: 'Creativity',
              score: "${modelData.creativity}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'Threat',
              score: "${modelData.threat}",
            ),
            StatusTableWidget(
              title: 'ICT Index',
              score: "${modelData.ictIndex}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'From',
              score: "${modelData.form}",
            ),
          ],
        ));
  }

  Widget _resultsWidget(Elements modelData) {
    bool isWin = false;
    bool isLose = false;
    bool isDraw = false;
    final historyController = Get.put(MatchHistoryController());
    historyController.getHistory(int.parse(modelData.id.toString()));
    return Obx(() => historyController.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
            height: 50,
            child: ListView.builder(
                itemCount: historyController.historyList.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width * .88,
                      child: ExpansionTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  historyController
                                              .historyList[index].wasHome ==
                                          true
                                      ? "H"
                                      : "A",
                                  style: defaultTextStyleBlack,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Image.network(
                                  teamList
                                          .firstWhere((element) =>
                                              int.parse(
                                                  element.id.toString()) ==
                                              historyController
                                                  .historyList[index]
                                                  .opponentTeam)
                                          .imageUrl ??
                                      '',
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  teamList
                                          .firstWhere((element) =>
                                              int.parse(
                                                  element.id.toString()) ==
                                              int.parse(historyController
                                                  .historyList[index]
                                                  .opponentTeam
                                                  .toString()))
                                          .name ??
                                      "",
                                  style: defaultTextStyleBlack,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  historyController
                                          .historyList[index].totalPoints
                                          .toString() +
                                      " pts",
                                  style: defaultTextStyleBlack,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                historyController
                                            .historyList[index].teamAScore ==
                                        historyController
                                            .historyList[index].teamHScore
                                    ? Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey,
                                        ),
                                        child: Text(
                                          "D",
                                          style: smallTextStyleWhite,
                                        ),
                                      )
                                    : historyController.historyList[index]
                                                    .wasHome ==
                                                true &&
                                            historyController.historyList[index]
                                                    .teamHScore! >
                                                historyController
                                                    .historyList[index]
                                                    .teamAScore!
                                        ? Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.green,
                                            ),
                                            child: Text(
                                              "W",
                                              style: smallTextStyleWhite,
                                            ),
                                          )
                                        : historyController.historyList[index]
                                                        .wasHome ==
                                                    true &&
                                                historyController
                                                        .historyList[index]
                                                        .teamHScore! <
                                                    historyController
                                                        .historyList[index]
                                                        .teamAScore!
                                            ? Container(
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.red,
                                                ),
                                                child: Text(
                                                  "L",
                                                  style: smallTextStyleWhite,
                                                ),
                                              )
                                            : historyController
                                                            .historyList[index]
                                                            .wasHome ==
                                                        false &&
                                                    historyController
                                                            .historyList[index]
                                                            .teamHScore! <
                                                        historyController
                                                            .historyList[index]
                                                            .teamAScore!
                                                ? Container(
                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.green,
                                                    ),
                                                    child: Text(
                                                      "W",
                                                      style:
                                                          smallTextStyleWhite,
                                                    ),
                                                  )
                                                : Container(
                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.red,
                                                    ),
                                                    child: Text(
                                                      "L",
                                                      style:
                                                          smallTextStyleWhite,
                                                    ),
                                                  ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  historyController
                                          .historyList[index].teamHScore
                                          .toString() +
                                      " - " +
                                      historyController
                                          .historyList[index].teamAScore
                                          .toString(),
                                  style: defaultTextStyleBlack,
                                ),
                              ],
                            ),
                          ],
                        ),
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Date'),
                                  Text(historyController
                                          .historyList[index].kickoffTime ??
                                      '')
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Round'),
                                  Text(
                                      "${historyController.historyList[index].round ?? ''}")
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Minute Played'),
                                  Text(
                                      "${historyController.historyList[index].minutes ?? ''}")
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Goals'),
                                  Text(
                                      "${historyController.historyList[index].goalsScored ?? ''}")
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Assists'),
                                  Text(
                                      "${historyController.historyList[index].assists ?? ''}")
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Clean Sheets'),
                                  Text(
                                      "${historyController.historyList[index].cleanSheets ?? ''}")
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Goals Conceded'),
                                  Text(
                                      "${historyController.historyList[index].goalsConceded ?? ''}")
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Own Goals'),
                                  Text(
                                      "${historyController.historyList[index].ownGoals ?? ''}")
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Penalties Saved'),
                                  Text(
                                      "${historyController.historyList[index].penaltiesMissed ?? ''}")
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Penalties Missed'),
                                  Text(
                                      "${historyController.historyList[index].penaltiesMissed ?? ''}")
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Yellow Cards'),
                                  Text(
                                      "${historyController.historyList[index].yellowCards ?? ''}")
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Red Cards'),
                                  Text(
                                      "${historyController.historyList[index].redCards ?? ''}")
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Saves'),
                                  Text(
                                      "${historyController.historyList[index].saves ?? ''}")
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Bouns'),
                                  Text(
                                      "${historyController.historyList[index].bonus ?? ''}")
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Expected Goals'),
                                  Text(
                                      "${historyController.historyList[index].expectedGoals ?? ''}")
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Expected Assists'),
                                  Text(historyController
                                          .historyList[index].expectedAssists ??
                                      '')
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Expected Clean Sheets'),
                                  Text(
                                      "${historyController.historyList[index].cleanSheets ?? ''}")
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Expected Goals Conceded'),
                                  Text(historyController.historyList[index]
                                          .expectedGoalsConceded ??
                                      '')
                                ],
                              ),
                            ],
                          )
                        ],
                      ));
                }),
            // ListView(
            //   children: historyController.historyList
            //       .map((e) => ResultsWidget(
            //             teamLogo: e.opponentTeam ?? 0,
            //             isHome: e.wasHome == true ? "H" : "A",
            //             opponentName: teamList
            //                     .firstWhere((element) =>
            //                         int.parse(element.id.toString()) ==
            //                         int.parse(e.opponentTeam.toString()))
            //                     .name ??
            //                 '',
            //             points: "${e.totalPoints} pts",
            //             isWin: e.teamHScore! > e.teamAScore!,
            //             result: "${e.teamHScore} - ${e.teamAScore}",
            //           ))
            //       .toList(),
            // ),
          ));
  }

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    teamList
                            .firstWhere((element) =>
                                int.parse(element.id.toString()) ==
                                int.parse(widget.modelData!.team.toString()))
                            .imageUrl ??
                        '',
                    width: 20,
                    height: 20,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.network(
                  "${ApiConstant.imageUrl}${widget.modelData?.photo?.replaceAll('.jpg', '.png') ?? ''}",
                  width: 50,
                  height: 70,
                ),
                const SizedBox(
                  width: 20,
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => cartController.addToCart(widget.modelData!),
                      child: Icon(
                        color:
                            cartController.cartList.contains(widget.modelData)
                                ? AppTheme.primaryColor
                                : Colors.grey,
                        cartController.cartList.contains(widget.modelData)
                            ? Icons.shopping_cart
                            : Icons.shopping_cart_outlined,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              widget.modelData?.secondName ?? "",
              style: smallTextStyleBlack,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(
                      opacity: 0.5,
                      child: Text(
                          Constants()
                              .defineType(widget.modelData?.elementType ?? 0),
                          style: smallTextStyleBlack)),
                  const SizedBox(
                    width: 2,
                  ),
                  const SizedBox(
                      height: 10,
                      child: VerticalDivider(
                        width: 5,
                        color: Colors.grey,
                      )),
                  const SizedBox(
                    width: 2,
                  ),
                  Opacity(
                      opacity: 0.5,
                      child: Text(
                          widget.teamList
                                  .firstWhere((element) =>
                                      int.parse(element.id.toString()) ==
                                      int.parse(
                                          widget.modelData!.team.toString()))
                                  .name ??
                              '',
                          style: smallTextStyleBlack)),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * .088,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        PointWidget(
                          title: 'Price',
                          point: "${widget.modelData?.nowCost ?? ''}",
                        ),
                        PointWidget(
                          title: 'Total Pts',
                          point: "${widget.modelData?.totalpoints ?? ''}",
                        ),
                        PointWidget(
                          title: 'Pts/Game',
                          point: widget.modelData?.pointsPerGame ?? '',
                        ),
                        PointWidget(
                          title: 'From',
                          point: widget.modelData?.valueForm ?? '',
                        ),
                        PointWidget(
                          title: 'Total Bonous',
                          point: "${widget.modelData?.bonus ?? ''}",
                        ),
                        PointWidget(
                          title: 'GW38 Pts',
                          point: "${widget.modelData?.eventPoints ?? ''}",
                        ),
                      ],
                    ),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .7,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _buildTabContainer(0, 'Stats'),
                      _buildTabContainer(1, 'Fixtures'),
                      _buildTabContainer(2, 'Results'),
                    ],
                  ),
                  Expanded(
                    child: _selectedIndex == 0
                        ? _statsWidget(widget.modelData!)
                        : _selectedIndex == 1
                            ? const Text('')
                            : _resultsWidget(widget.modelData!),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultsWidget extends StatelessWidget {
  const ResultsWidget({
    super.key,
    required this.model,
    // required this.teamLogo,
    // required this.isHome,
    // required this.opponentName,
    // required this.points,
    // required this.isWin,
    // required this.result
  });
  // final int teamLogo;
  // final String isHome;
  // final String opponentName;
  // final String points;
  // final bool isWin;
  // final String result;
  final MatchHistoryModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * .7,
        width: MediaQuery.of(context).size.width * .88,
        child: ExpansionTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    model.wasHome == true ? "H" : "A",
                    style: defaultTextStyleBlack,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.network(
                    teamList
                            .firstWhere((element) =>
                                int.parse(element.id.toString()) ==
                                model.opponentTeam)
                            .imageUrl ??
                        '',
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    teamList
                            .firstWhere((element) =>
                                int.parse(element.id.toString()) ==
                                int.parse(model.opponentTeam.toString()))
                            .name ??
                        "",
                    style: defaultTextStyleBlack,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    model.totalPoints.toString() + " pts",
                    style: defaultTextStyleBlack,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  model.wasHome == true && model.teamHScore! > model.teamAScore!
                      ? Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Text(
                            "W",
                            style: smallTextStyleWhite,
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Text(
                            "L",
                            style: smallTextStyleWhite,
                          ),
                        ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    model.teamHScore.toString() +
                        " - " +
                        model.teamAScore.toString(),
                    style: defaultTextStyleBlack,
                  ),
                ],
              ),
            ],
          ),
          children: [Container()],
        ));
  }
}

class StatusTableWidget extends StatelessWidget {
  final String? title;
  final String? score;
  final Color? color;
  const StatusTableWidget({
    super.key,
    this.title,
    this.score,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      color: color ??
          Colors.white, // index % 2 != 0 ? Colors.grey[300] : Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title ?? "",
              style: smallTextStyleBlack,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              score ?? "",
              style: smallTextStyleBlack,
            ),
          ),
        ],
      ),
    );
  }
}
