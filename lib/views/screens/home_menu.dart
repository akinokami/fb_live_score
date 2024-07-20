import 'package:fb_livescore/utils/app_theme.dart';
import 'package:fb_livescore/views/screens/compare/compare_screen.dart';
import 'package:fb_livescore/views/screens/my_team/my_team_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/navigation_controller.dart';
import 'home/home_screen.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 11.sp);

  final TextStyle selectedLabelStyle = TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 11.sp);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),

        ///edit by erihmar
        child: SizedBox(
          height: 55.h,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: const Color(0xff1B8B00),
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.people,
                  size: 18.w,
                ),
                label: 'My Team',
                backgroundColor: AppTheme.primaryColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 18.w,
                ),
                label: 'Home',
                backgroundColor: AppTheme.primaryColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.compare_arrows,
                  size: 18.w,
                ),
                label: 'Compare',
                backgroundColor: AppTheme.primaryColor,
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
              MyTeamScreen(),
              HomeScreen(),
              CompareScreen(),
            ],
          )),
    ));
  }
}
