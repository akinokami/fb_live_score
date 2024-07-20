import 'package:fb_livescore/controller/cart_controller.dart';
import 'package:fb_livescore/controller/match_history_controller.dart';
import 'package:fb_livescore/models/match_history_model.dart';
import 'package:fb_livescore/models/status_model.dart';
import 'package:fb_livescore/models/team_model.dart';
import 'package:fb_livescore/services/api_constant.dart';
import 'package:fb_livescore/utils/app_theme.dart';
import 'package:fb_livescore/utils/constants.dart';
import 'package:fb_livescore/views/widgets/custom_text.dart';
import 'package:fb_livescore/views/widgets/point_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    final historyController = Get.put(MatchHistoryController());
    historyController.getHistory(int.parse(modelData.id.toString()));
    return Obx(() => historyController.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: historyController
                                                .historyList[index].wasHome ==
                                            true
                                        ? "H"
                                        : "A",
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
                                  CustomText(
                                    text: teamList
                                            .firstWhere((element) =>
                                                int.parse(
                                                    element.id.toString()) ==
                                                int.parse(historyController
                                                    .historyList[index]
                                                    .opponentTeam
                                                    .toString()))
                                            .name ??
                                        "",
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: historyController
                                            .historyList[index].totalPoints
                                            .toString() +
                                        " pts",
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
                                          child: CustomText(
                                            text: "D",
                                          ),
                                        )
                                      : historyController.historyList[index]
                                                      .wasHome ==
                                                  true &&
                                              historyController
                                                      .historyList[index]
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
                                              child: CustomText(
                                                text: "W",
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
                                                  child: CustomText(
                                                    text: "L",
                                                  ),
                                                )
                                              : historyController
                                                              .historyList[
                                                                  index]
                                                              .wasHome ==
                                                          false &&
                                                      historyController
                                                              .historyList[
                                                                  index]
                                                              .teamHScore! <
                                                          historyController
                                                              .historyList[
                                                                  index]
                                                              .teamAScore!
                                                  ? Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.green,
                                                      ),
                                                      child: CustomText(
                                                        text: "W",
                                                      ),
                                                    )
                                                  : Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.red,
                                                      ),
                                                      child: CustomText(
                                                        text: "L",
                                                      ),
                                                    ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CustomText(
                                    text: historyController
                                            .historyList[index].teamHScore
                                            .toString() +
                                        " - " +
                                        historyController
                                            .historyList[index].teamAScore
                                            .toString(),
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
                                    CustomText(text: 'Date'),
                                    CustomText(
                                        text: historyController
                                                .historyList[index]
                                                .kickoffTime ??
                                            '')
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(text: 'Round'),
                                    CustomText(
                                        text:
                                            "${historyController.historyList[index].round ?? ''}")
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(text: 'Minute Played'),
                                    CustomText(
                                        text:
                                            "${historyController.historyList[index].minutes ?? ''}")
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(text: 'Goals'),
                                    CustomText(
                                        text:
                                            "${historyController.historyList[index].goalsScored ?? ''}")
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(text: 'Assists'),
                                    CustomText(
                                        text:
                                            "${historyController.historyList[index].assists ?? ''}")
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(text: 'Clean Sheets'),
                                    CustomText(
                                        text:
                                            "${historyController.historyList[index].cleanSheets ?? ''}")
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(text: 'Goals Conceded'),
                                    CustomText(
                                        text:
                                            "${historyController.historyList[index].goalsConceded ?? ''}")
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(text: 'Own Goals'),
                                    CustomText(
                                        text:
                                            "${historyController.historyList[index].ownGoals ?? ''}")
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(text: 'Penalties Saved'),
                                    CustomText(
                                        text:
                                            "${historyController.historyList[index].penaltiesMissed ?? ''}")
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(text: 'Penalties Missed'),
                                    CustomText(
                                        text:
                                            "${historyController.historyList[index].penaltiesMissed ?? ''}")
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(text: 'Yellow Cards'),
                                    CustomText(
                                        text:
                                            "${historyController.historyList[index].yellowCards ?? ''}")
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(text: 'Red Cards'),
                                    CustomText(
                                        text:
                                            "${historyController.historyList[index].redCards ?? ''}")
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(text: 'Saves'),
                                    CustomText(
                                        text:
                                            "${historyController.historyList[index].saves ?? ''}")
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(text: 'Bouns'),
                                    CustomText(
                                        text:
                                            "${historyController.historyList[index].bonus ?? ''}")
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(text: 'Expected Goals'),
                                    CustomText(
                                        text:
                                            "${historyController.historyList[index].expectedGoals ?? ''}")
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(text: 'Expected Assists'),
                                    CustomText(
                                        text: historyController
                                                .historyList[index]
                                                .expectedAssists ??
                                            '')
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(text: 'Expected Clean Sheets'),
                                    CustomText(
                                        text:
                                            "${historyController.historyList[index].cleanSheets ?? ''}")
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(text: 'Expected Goals Conceded'),
                                    CustomText(
                                        text: historyController
                                                .historyList[index]
                                                .expectedGoalsConceded ??
                                            '')
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                )
                              ],
                            )
                          ],
                        ));
                  }),
            ),
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
            CustomText(
              text: widget.modelData?.secondName ?? "",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(
                      opacity: 0.5,
                      child: CustomText(
                        text: Constants()
                            .defineType(widget.modelData?.elementType ?? 0),
                      )),
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
                      child: CustomText(
                        text: widget.teamList
                                .firstWhere((element) =>
                                    int.parse(element.id.toString()) ==
                                    int.parse(
                                        widget.modelData!.team.toString()))
                                .name ??
                            '',
                      )),
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
                  CustomText(
                    text: model.wasHome == true ? "H" : "A",
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
                  CustomText(
                    text: teamList
                            .firstWhere((element) =>
                                int.parse(element.id.toString()) ==
                                int.parse(model.opponentTeam.toString()))
                            .name ??
                        "",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: model.totalPoints.toString() + " pts",
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
                          child: CustomText(
                            text: "W",
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: CustomText(
                            text: "L",
                          ),
                        ),
                  SizedBox(
                    width: 10,
                  ),
                  CustomText(
                    text: model.teamHScore.toString() +
                        " - " +
                        model.teamAScore.toString(),
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
            child: CustomText(
              text: title ?? "",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText(
              text: score ?? "",
            ),
          ),
        ],
      ),
    );
  }
}
