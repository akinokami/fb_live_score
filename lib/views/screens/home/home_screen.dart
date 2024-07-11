import 'package:fb_livescore/controller/home_controller.dart';
import 'package:fb_livescore/utils/app_theme.dart';
import 'package:fb_livescore/utils/text_style_const.dart';
import 'package:fb_livescore/views/widgets/home_custom_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(

        body: ListView(
          children:  [
            Padding(
              padding: const EdgeInsets.only(left: 8.0,top: 30),
              child: Opacity(
                opacity: 0.6,
                child: Text(
                  "Game Week 38",
                  style:homeTitleTextStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Opacity(
                opacity: 0.6,
                child: Text(
                  "Finished",
                      style:homeSmallTitleTextStyle
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width*.1,
            ),
            SizedBox(

              height: MediaQuery.of(context).size.height*.05,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: homeController.overviewList.length,
                  itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Container(

                    padding: EdgeInsets.symmetric(horizontal: 8,),
                    decoration: BoxDecoration(
                      color:AppTheme.primaryColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(homeController.overviewList[index].label,style:defaultTextStyleWhite),
                        Text(homeController.overviewList[index].number,style:defaultTextStyleWhite),

                      ],
                    )
                  ),
                );
              }),
            ),

            SizedBox(

              height: MediaQuery.of(context).size.height*.5,
              child: Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: HomeCustomCard(
                    title: "Top Players",
                    list: homeController.topPlayerList,
                  )
              ),
            ),
          ],
        ));
  }
}
