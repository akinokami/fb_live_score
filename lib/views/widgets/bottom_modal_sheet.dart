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
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 5.0.h),
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(5),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0.h, vertical: 3.w),
            decoration: BoxDecoration(
              color: _selectedIndex == index
                  ? const Color(0xff1B8B00)
                  : Colors.white,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: CustomText(
              text: label,
              textColor: _selectedIndex == index ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _statsWidget(Elements modelData) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0.r, vertical: 5.r),
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
              child: historyController.historyList.length == 0
                  ? const Center(
                      child: CustomText(text: 'There is no data.'),
                    )
                  : ListView.builder(
                      itemCount: historyController.historyList.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                            width: 1.sw * .88,
                            child: ExpansionTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: historyController
                                                    .historyList[index]
                                                    .wasHome ==
                                                true
                                            ? "H"
                                            : "A",
                                        size: 10.sp,
                                      ),
                                      SizedBox(
                                        width: 10.h,
                                      ),
                                      Image.network(
                                        teamList
                                                .firstWhere((element) =>
                                                    int.parse(element.id
                                                        .toString()) ==
                                                    historyController
                                                        .historyList[index]
                                                        .opponentTeam)
                                                .imageUrl ??
                                            '',
                                        width: 20.w,
                                        height: 20.h,
                                      ),
                                      SizedBox(
                                        width: 10.h,
                                      ),
                                      CustomText(
                                        text: teamList
                                                .firstWhere((element) =>
                                                    int.parse(element.id
                                                        .toString()) ==
                                                    int.parse(historyController
                                                        .historyList[index]
                                                        .opponentTeam
                                                        .toString()))
                                                .name ??
                                            "",
                                        size: 10.sp,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text:
                                            "${historyController.historyList[index].totalPoints} pts",
                                        size: 10.sp,
                                      ),
                                      SizedBox(
                                        width: 10.h,
                                      ),
                                      historyController.historyList[index]
                                                  .teamAScore ==
                                              historyController
                                                  .historyList[index].teamHScore
                                          ? Container(
                                              padding: EdgeInsets.all(5.h),
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.grey,
                                              ),
                                              child: CustomText(
                                                text: "D",
                                                size: 10.sp,
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
                                                  padding: EdgeInsets.all(5.h),
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.green,
                                                  ),
                                                  child: CustomText(
                                                    text: "W",
                                                    size: 10.sp,
                                                  ),
                                                )
                                              : historyController
                                                              .historyList[
                                                                  index]
                                                              .wasHome ==
                                                          true &&
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
                                                          EdgeInsets.all(5.h),
                                                      decoration:
                                                          const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.red,
                                                      ),
                                                      child: CustomText(
                                                        text: "L",
                                                        size: 10.sp,
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
                                                              EdgeInsets.all(
                                                                  5.h),
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.green,
                                                          ),
                                                          child: CustomText(
                                                            text: "W",
                                                            size: 10.sp,
                                                          ),
                                                        )
                                                      : Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.h),
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.red,
                                                          ),
                                                          child: CustomText(
                                                            text: "L",
                                                            size: 10.sp,
                                                          ),
                                                        ),
                                      SizedBox(
                                        width: 10.h,
                                      ),
                                      CustomText(
                                        text:
                                            "${historyController.historyList[index].teamHScore} - ${historyController.historyList[index].teamAScore}",
                                        size: 10.sp,
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
                                        CustomText(
                                          text: 'Date',
                                          size: 10.sp,
                                        ),
                                        CustomText(
                                          text: historyController
                                                  .historyList[index]
                                                  .kickoffTime ??
                                              '',
                                          size: 10.sp,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: 'Round',
                                          size: 10.sp,
                                        ),
                                        CustomText(
                                          text:
                                              "${historyController.historyList[index].round ?? ''}",
                                          size: 10.sp,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: 'Minute Played',
                                          size: 10.sp,
                                        ),
                                        CustomText(
                                          text:
                                              "${historyController.historyList[index].minutes ?? ''}",
                                          size: 10.sp,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: 'Goals',
                                          size: 10.sp,
                                        ),
                                        CustomText(
                                          text:
                                              "${historyController.historyList[index].goalsScored ?? ''}",
                                          size: 10.sp,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: 'Assists',
                                          size: 10.sp,
                                        ),
                                        CustomText(
                                          text:
                                              "${historyController.historyList[index].assists ?? ''}",
                                          size: 10.sp,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: 'Clean Sheets',
                                          size: 10.sp,
                                        ),
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
                                              "${historyController.historyList[index].goalsConceded ?? ''}",
                                          size: 10.sp,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: 'Own Goals',
                                          size: 10.sp,
                                        ),
                                        CustomText(
                                          text:
                                              "${historyController.historyList[index].ownGoals ?? ''}",
                                          size: 10.sp,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: 'Penalties Saved',
                                          size: 10.sp,
                                        ),
                                        CustomText(
                                          text:
                                              "${historyController.historyList[index].penaltiesMissed ?? ''}",
                                          size: 10.sp,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: 'Penalties Missed',
                                          size: 10.sp,
                                        ),
                                        CustomText(
                                          text:
                                              "${historyController.historyList[index].penaltiesMissed ?? ''}",
                                          size: 10.sp,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: 'Yellow Cards',
                                          size: 10.sp,
                                        ),
                                        CustomText(
                                          text:
                                              "${historyController.historyList[index].yellowCards ?? ''}",
                                          size: 10.sp,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: 'Red Cards',
                                          size: 10.sp,
                                        ),
                                        CustomText(
                                          text:
                                              "${historyController.historyList[index].redCards ?? ''}",
                                          size: 10.sp,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: 'Saves',
                                          size: 10.sp,
                                        ),
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
                                              "${historyController.historyList[index].bonus ?? ''}",
                                          size: 10.sp,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: 'Expected Goals',
                                          size: 10.sp,
                                        ),
                                        CustomText(
                                          text: historyController
                                                  .historyList[index]
                                                  .expectedGoals ??
                                              '',
                                          size: 10.sp,
                                        )
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
                                        CustomText(
                                          text: 'Expected Clean Sheets',
                                          size: 10.sp,
                                        ),
                                        CustomText(
                                          text:
                                              "${historyController.historyList[index].cleanSheets ?? ''}",
                                          size: 10.sp,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: 'Expected Goals Conceded',
                                          size: 10.sp,
                                        ),
                                        CustomText(
                                          text: historyController
                                                  .historyList[index]
                                                  .expectedGoalsConceded ??
                                              '',
                                          size: 10.sp,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30.h,
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
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
                SizedBox(
                  width: 20.h,
                ),
                Image.network(
                  "${ApiConstant.imageUrl}${widget.modelData?.photo?.replaceAll('.jpg', '.png') ?? ''}",
                  width: 50.w,
                  height: 70.h,
                ),
                SizedBox(
                  width: 20.w,
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
                        size: 20.sp,
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
                  SizedBox(
                    width: 2.w,
                  ),
                  SizedBox(
                      height: 10.h,
                      child: VerticalDivider(
                        width: 5.w,
                        color: Colors.grey,
                      )),
                  SizedBox(
                    width: 2.w,
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
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
                height: 1.sh * .088,
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
            SizedBox(
              height: 10.h,
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
                        ? widget.modelData != null
                            ? _statsWidget(widget.modelData!)
                            : const Center(
                                child: CustomText(text: 'There is no data.'),
                              )
                        : _selectedIndex == 1
                            ? const Center(
                                child: CustomText(text: 'There is no data.'),
                              )
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
      height: 35.h,
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
              size: 10.sp,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText(
              text: score ?? "",
              size: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}
