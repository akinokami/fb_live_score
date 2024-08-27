import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:fb_livescore/models/status_model.dart';
import 'package:fb_livescore/models/team_model.dart';
import 'package:fb_livescore/services/api_constant.dart';
import 'package:fb_livescore/utils/global.dart';
import 'package:fb_livescore/views/widgets/ads_widget.dart';
import 'package:fb_livescore/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: Column(
        children: [
          Expanded(
            child: ListView(
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
                          width: MediaQuery.of(context).size.width * .45,
                          height: MediaQuery.of(context).size.height * .25,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              child: selectedPlayer1 == null
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const CustomText(
                                          text: "Add Player",
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Icon(
                                          Icons.add_circle_outlined,
                                          size: 20.sp,
                                        )
                                      ],
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                width: 50.w,
                                                height: 70.h,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Icon(
                                                  Icons.person,
                                                  size: 30.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          CustomText(
                                            text: selectedPlayer1?.secondName ??
                                                "",
                                            fontWeight: FontWeight.bold,
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Opacity(
                                              opacity: 0.7,
                                              child: CustomText(
                                                text: teamList
                                                        .firstWhere((element) =>
                                                            int.parse(element.id
                                                                .toString()) ==
                                                            int.parse(
                                                                selectedPlayer1!
                                                                    .team
                                                                    .toString()))
                                                        .name ??
                                                    '',
                                              )),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Opacity(
                                              opacity: 0.7,
                                              child: CustomText(
                                                  text: selectedPlayer1!
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
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          SizedBox(
                                            height: 10.h,
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
                            width: 1.sw * .45,
                            height: 1.sh * .25,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 5,
                                child: selectedPlayer2 == null
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const CustomText(text: "Add Player"),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Icon(Icons.add_circle_outlined,
                                              size: 20.sp)
                                        ],
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                // FastCachedImage(
                                                //   width: 40.w,
                                                //   height: 50.h,
                                                //   url:
                                                //       "${ApiConstant.imageUrl}${selectedPlayer2?.photo?.replaceAll('.jpg', '.png') ?? ''}",
                                                //   fit: BoxFit.cover,
                                                //   fadeInDuration:
                                                //       const Duration(seconds: 1),
                                                //   errorBuilder: (context, exception,
                                                //           stacktrace) =>
                                                //       SizedBox(
                                                //           width: 50.w,
                                                //           height: 70.h,
                                                //           child: Icon(
                                                //             Icons.person_rounded,
                                                //             size: 30.sp,
                                                //           )),
                                                //   loadingBuilder:
                                                //       (context, progress) {
                                                //     return SizedBox(
                                                //       width: 50.w,
                                                //       height: 70.h,
                                                //       child: Stack(
                                                //         alignment: Alignment.center,
                                                //         children: [
                                                //           if (progress
                                                //                   .isDownloading &&
                                                //               progress.totalBytes !=
                                                //                   null)
                                                //             SizedBox(
                                                //                 width: 20.w,
                                                //                 height: 20.w,
                                                //                 child: CircularProgressIndicator(
                                                //                     color:
                                                //                         Colors.green,
                                                //                     value: progress
                                                //                         .progressPercentage
                                                //                         .value)),
                                                //         ],
                                                //       ),
                                                //     );
                                                //   },
                                                // ),
                                                Image.network(
                                                  "${ApiConstant.imageUrl}${selectedPlayer2?.photo?.replaceAll('.jpg', '.png') ?? ''}",
                                                  width: 50.w,
                                                  height: 70.h,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Icon(
                                                    Icons.person,
                                                    size: 30.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            CustomText(
                                              text:
                                                  selectedPlayer2?.secondName ??
                                                      "",
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Opacity(
                                                opacity: 0.7,
                                                child: CustomText(
                                                  text: teamList
                                                          .firstWhere((element) =>
                                                              int.parse(element
                                                                  .id
                                                                  .toString()) ==
                                                              int.parse(
                                                                  selectedPlayer2!
                                                                      .team
                                                                      .toString()))
                                                          .name ??
                                                      '',
                                                )),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Opacity(
                                                opacity: 0.7,
                                                child: CustomText(
                                                    text: selectedPlayer2!
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
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                          ]))),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.sw * .05,
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
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer1?.totalpoints ?? ''}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: selectedPlayer1?.pointsPerGame ?? '',
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: selectedPlayer1?.form ?? '',
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer1?.starts ?? ''}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer1?.minutes ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer1?.goalsScored ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer1?.assists ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer1?.cleanSheets ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer1?.saves ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: selectedPlayer1?.expectedGoals ?? '',
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: selectedPlayer1?.expectedAssists ?? "",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: selectedPlayer1?.expectedGoalInvolvements ??
                                  "",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text:
                                  "${selectedPlayer1?.expectedGoalsPer90 ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text:
                                  "${selectedPlayer1?.expectedAssistsPer90 ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text:
                                  "${selectedPlayer1?.expectedGoalInvolvementsPer90 ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer1?.goalsConceded ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text:
                                  "${selectedPlayer1?.goalsConcededPer90 ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text:
                                  "${selectedPlayer1?.expectedGoalsConcededPer90 ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer1?.penaltiesMissed ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer1?.yellowCards ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer1?.redCards ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer1?.ownGoals ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer1?.bonus ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer1?.bps ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: selectedPlayer1?.influence ?? "",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: selectedPlayer1?.creativity ?? "",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: selectedPlayer1?.threat ?? "",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: selectedPlayer1?.ictIndex ?? "",
                              size: 10.sp,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CustomText(
                              text: "Price",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "Total Points",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "Points Per Game",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "Form",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "Starts",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "Minutes",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "Goals",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "Assists",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "Clean Sheets",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "Saves",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "xGoals",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "xAssists",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "xGoal Involvements",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "xGoal Per 90",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "xAssist Per 90",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "xGI Per 90",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "Goals Conceded",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "GC Per 90",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "xGC Per 90",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "Penalties Missed",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "Yellow Cards",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "Red Cards",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "Own Goals",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "Bonus",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "BPS",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "Influence",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "Creativity",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "Threat",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "ICT Index",
                              size: 10.sp,
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
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer2?.totalpoints ?? ''}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: selectedPlayer2?.pointsPerGame ?? '',
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: selectedPlayer2?.form ?? '',
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer2?.starts ?? ''}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer2?.minutes ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer2?.goalsScored ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer2?.assists ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer2?.cleanSheets ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer2?.saves ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: selectedPlayer2?.expectedGoals ?? "",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: selectedPlayer2?.expectedAssists ?? "",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: selectedPlayer2?.expectedGoalInvolvements ??
                                  "",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text:
                                  "${selectedPlayer2?.expectedGoalsPer90 ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text:
                                  "${selectedPlayer2?.expectedAssistsPer90 ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text:
                                  "${selectedPlayer2?.expectedGoalInvolvementsPer90 ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer2?.goalsConceded ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text:
                                  "${selectedPlayer2?.goalsConcededPer90 ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text:
                                  "${selectedPlayer2?.expectedGoalsConcededPer90 ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer2?.penaltiesMissed ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer2?.yellowCards ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer2?.redCards ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer2?.ownGoals ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer2?.bonus ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "${selectedPlayer2?.bps ?? ""}",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: selectedPlayer2?.influence ?? "",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: selectedPlayer2?.creativity ?? "",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: selectedPlayer2?.threat ?? "",
                              size: 10.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: selectedPlayer2?.ictIndex ?? "",
                              size: 10.sp,
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Visibility(
            visible: Global.countryCode == 'PH' || Global.countryCode == 'VN',
            child: const AdsWidget(),
          )
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
          title: CustomText(
            text: 'Choose a Player',
            size: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: players.isEmpty
                ? const Center(child: CustomText(text: "No player found"))
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
          title: CustomText(
            text: 'Choose a Player',
            size: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: players.isEmpty
                ? const Center(child: CustomText(text: "No player found"))
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
        leading: FastCachedImage(
          width: 40.w,
          height: 50.h,
          url:
              "${ApiConstant.imageUrl}${player.photo?.replaceAll('.jpg', '.png') ?? ''}",
          fit: BoxFit.cover,
          fadeInDuration: const Duration(seconds: 1),
          errorBuilder: (context, exception, stacktrace) => SizedBox(
              width: 40.w,
              height: 50.h,
              child: Icon(
                Icons.person_rounded,
                size: 25.sp,
              )),
          loadingBuilder: (context, progress) {
            return SizedBox(
              width: 40.w,
              height: 50.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (progress.isDownloading && progress.totalBytes != null)
                    SizedBox(
                        width: 20.w,
                        height: 20.w,
                        child: CircularProgressIndicator(
                            color: Colors.green,
                            value: progress.progressPercentage.value)),
                ],
              ),
            );
          },
        ),

        title: CustomText(
          text: player.secondName ?? "",
        ),

        subtitle: CustomText(
          text:
              '${player.elementType}, Price: \u00A3${(player.nowCost ?? 1) / 10}, Points: ${player.totalpoints}',
        ),
        //trailing: const Icon(Icons.add_circle_outline),
      ),
    );
  }
}
