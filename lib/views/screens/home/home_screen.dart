import 'package:fb_livescore/controller/home_controller.dart';
import 'package:fb_livescore/utils/text_style_const.dart';
import 'package:fb_livescore/views/screens/wishlist/wish_list_screen.dart';
import 'package:fb_livescore/views/widgets/home_custom_card.dart';
import 'package:fb_livescore/views/widgets/home_custom_card_single.dart';
import 'package:fb_livescore/views/widgets/score_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          title: Obx(
            () => homeController.isLoading.value
                ? Container()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, top: 10),
                        child: Opacity(
                          opacity: 0.6,
                          child: Text(
                            homeController
                                    .statusModel.value.events?.last.name ??
                                '',
                            style: homeSmallTitleTextStyle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Opacity(
                          opacity: 0.6,
                          child: Text(
                              homeController.statusModel.value.events?.last
                                          .finished ==
                                      true
                                  ? "Finished"
                                  : "",
                              style: defaultTextStyleBlack),
                        ),
                      ),
                    ],
                  ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Badge(
                label: Text("3"),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined),
                  onPressed: () {
                    Get.to(WishListScreen());
                  },
                ),
              ),
            ),
          ],
        ),
        body: Obx(
          () => homeController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width * .05,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * .045,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              children: [
                                ScoreWidget(
                                  title: 'Highest Points',
                                  score: homeController.statusModel.value.events
                                      ?.last.highestScore
                                      .toString(),
                                ),
                                ScoreWidget(
                                  title: 'Average Points',
                                  score: homeController.statusModel.value.events
                                      ?.last.averageEntryScore
                                      .toString(),
                                ),
                                ScoreWidget(
                                  title: 'Transfers Made',
                                  score: homeController.statusModel.value.events
                                      ?.last.transfersMade
                                      .toString(),
                                ),
                                ScoreWidget(
                                  title: 'Bench Boost',
                                  score: homeController.statusModel.value.events
                                      ?.last.chipPlays?[0].numPlayed
                                      .toString(),
                                ),
                                ScoreWidget(
                                  title: 'Free Hit',
                                  score: homeController.statusModel.value.events
                                      ?.last.chipPlays?[1].numPlayed
                                      .toString(),
                                ),
                                ScoreWidget(
                                  title: 'wildcard',
                                  score: homeController.statusModel.value.events
                                      ?.last.chipPlays?[2].numPlayed
                                      .toString(),
                                ),
                                ScoreWidget(
                                  title: 'Triple Captain',
                                  score: homeController.statusModel.value.events
                                      ?.last.chipPlays?[3].numPlayed
                                      .toString(),
                                ),
                              ],
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .28,
                      child: SizedBox(
                          child: HomeCustomCard(
                        title: "Top Players",
                        list: homeController.topPlayerList,
                        teamList: homeController.statusModel.value.teams ?? [],
                      )),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * .28,
                    //   child: SizedBox(
                    //       child: HomeCustomCard(
                    //     title: "Top Forwards",
                    //     list: homeController.topPlayerList,
                    //   )),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * .28,
                    //   child: SizedBox(
                    //       child: HomeCustomCard(
                    //     title: "Top Midfielders",
                    //     list: homeController.topPlayerList,
                    //   )),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * .28,
                    //   child: SizedBox(
                    //       child: HomeCustomCard(
                    //     title: "Top Defenders",
                    //     list: homeController.topPlayerList,
                    //   )),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * .28,
                    //   child: SizedBox(
                    //       child: HomeCustomCard(
                    //     title: "Top GoldKeepers",
                    //     list: homeController.topPlayerList,
                    //   )),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .28,
                      child: SizedBox(
                        child: HomeCustomCardSingle(
                          title: "Most Selected",
                          modelData: homeController.mostSelected.value,
                          teamList:
                              homeController.statusModel.value.teams ?? [],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .28,
                      child: SizedBox(
                        child: HomeCustomCardSingle(
                          title: "Most Captained",
                          modelData: homeController.mostCaptained.value,
                          teamList:
                              homeController.statusModel.value.teams ?? [],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .28,
                      child: SizedBox(
                          child: HomeCustomCardSingle(
                        title: "Most Vice Captained",
                        modelData: homeController.mostViceCaptained.value,
                        teamList: homeController.statusModel.value.teams ?? [],
                      )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .28,
                      child: SizedBox(
                          child: HomeCustomCardSingle(
                        title: "Most Transferred in",
                        modelData: homeController.mostTransferred.value,
                        teamList: homeController.statusModel.value.teams ?? [],
                      )),
                    ),
                  ],
                ),
        ));
  }
}
