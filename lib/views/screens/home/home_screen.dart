import 'package:fb_livescore/controller/home_controller.dart';
import 'package:fb_livescore/models/home_custom_card_model.dart';
import 'package:fb_livescore/utils/text_style_const.dart';
import 'package:fb_livescore/views/screens/wishlist/wish_list_screen.dart';
import 'package:fb_livescore/views/widgets/home_custom_card.dart';
import 'package:fb_livescore/views/widgets/home_custom_card_single.dart';
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0.0, top: 10),
              child: Opacity(
                opacity: 0.6,
                child: Text(
                  "Game Week 38",
                  style: homeSmallTitleTextStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Opacity(
                opacity: 0.6,
                child: Text("Finished", style: defaultTextStyleBlack),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Badge(
              label: Text("3"),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {
                  Get.to(WishListScreen())  ;
                },
              ),
            ),
          ),
        ],
      ),
        body: ListView(
      children: [


        SizedBox(
          height: MediaQuery.of(context).size.width * .05,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .045,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: homeController.overviewList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0,bottom: 3),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 10,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                            // gradient:  LinearGradient(
                            //   colors: [
                            //     Color(0xffA2D240),
                            //     Color(0xff1B8B00),
                            //   ], //#A2D240//#1B8B00
                            //   begin: Alignment.topLeft,
                            //   end: Alignment.bottomRight,
                            // ),
                            color:Color(0xff1B8B00).withOpacity(0.7),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(homeController.overviewList[index].label,
                                style: smallTextStyleWhite),
                            Text(homeController.overviewList[index].number,
                                style: smallTextStyleWhite),
                          ],
                        )),
                  ),
                );
              }),
        ),
        SizedBox(height: 10,),
        SizedBox(
          height: MediaQuery.of(context).size.height * .28,
          child: SizedBox(
              child: HomeCustomCard(
                title: "Top Players",
                list: homeController.topPlayerList,
              )),
        ),



        const SizedBox(
          height: 10,
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height * .28,
          child: SizedBox(
              child: HomeCustomCard(
            title: "Top Forwards",
            list: homeController.topPlayerList,
          )),
        ),
        const SizedBox(
          height: 10,
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height * .28,
          child: SizedBox(
              child: HomeCustomCard(
                title: "Top Midfielders",
                list: homeController.topPlayerList,
              )),
        ),
        const SizedBox(
          height: 10,
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height * .28,
          child: SizedBox(
              child: HomeCustomCard(
                title: "Top Defenders",
                list: homeController.topPlayerList,
              )),
        ),
        const SizedBox(
          height: 10,
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height * .28,
          child: SizedBox(
              child: HomeCustomCard(
                title: "Top GoldKeepers",
                list: homeController.topPlayerList,
              )),
        ),
        const SizedBox(
          height: 10,
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height * .28,
          child: SizedBox(
              child: HomeCustomCardSingle(
                title: "Most Vice Captained",
                modelData: HomeCustomCardModel("David Beckham", "assets/beckham.webp", "assets/manchester.webp", "Forward", "Manchester United", "30", "10.5 m","51.3 %"),
              )),
        ),
      ],
    ));
  }
}
