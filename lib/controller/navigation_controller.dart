import 'package:get/get.dart';

class NavigationController extends GetxController {
  var tabIndex = 1.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    //
    super.onInit();
  }

  @override
  void dispose() {
    //
    super.dispose();
  }
}
