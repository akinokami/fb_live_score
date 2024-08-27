import 'package:fb_livescore/utils/app_theme.dart';
import 'package:fb_livescore/utils/constants.dart';
import 'package:fb_livescore/utils/global.dart';
import 'package:get/get.dart';

import '../services/api_repo.dart';
import '../views/screens/home_menu.dart';

class SplashController extends GetxController {
  final isLoading = false.obs;

  @override
  void onInit() {
    getCountry();
    super.onInit();
  }

  Future<void> getCountry() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getCountry();
      Global.countryCode = result;
      Future.delayed(const Duration(seconds: 1), () {
        Get.offAll(() => Home());
      });
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: AppTheme.red);
    } finally {
      isLoading.value = false;
    }
  }
}
