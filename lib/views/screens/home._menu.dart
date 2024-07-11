import 'package:fb_livescore/views/screens/compare/compare_screen.dart';
import 'package:fb_livescore/views/screens/my_team/my_team_screen.dart';
import 'package:fb_livescore/views/screens/wishlist/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/navigation_controller.dart';
import 'home/home_screen.dart';
class Home extends StatelessWidget {
  Home({super.key});

  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 60,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.home,
                    size: 20.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.compare_arrows,
                    size: 20.0,
                  ),
                ),
                label: 'Compare',
                backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.people,
                    size: 20.0,
                  ),
                ),
                label: 'My Team',
                backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.shopping_cart,
                    size: 20.0,
                  ),
                ),
                label: 'Wishlist',
                backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final NavigationController homeController =
        Get.put(NavigationController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: buildBottomNavigationMenu(context, homeController),
      body: Obx(() => IndexedStack(
            index: homeController.tabIndex.value,
            children: const [
              HomeScreen(),
              CompareScreen(),
              MyTeamScreen(),
              WishListScreen(),
            ],
          )),
    ));
  }
}
