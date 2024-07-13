import 'package:fb_livescore/models/status_model.dart';
import 'package:fb_livescore/services/api_repo.dart';
import 'package:fb_livescore/utils/app_theme.dart';
import 'package:fb_livescore/utils/constants.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;
  Rx<StatusModel> statusModel = StatusModel().obs;
  RxList<Elements> topPlayerList = <Elements>[].obs;
  RxList<Elements> topForwardList = <Elements>[].obs;
  RxList<Elements> midfielderList = <Elements>[].obs;
  RxList<Elements> defenderList = <Elements>[].obs;
  RxList<Elements> gokeeperList = <Elements>[].obs;
  Rx<Elements> mostSelected = Elements().obs;
  Rx<Elements> mostCaptained = Elements().obs;
  Rx<Elements> mostViceCaptained = Elements().obs;
  Rx<Elements> mostTransferred = Elements().obs;

  @override
  void onInit() async {
    super.onInit();
    getStatus();
  }

  Future<void> getStatus() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getStatus();
      statusModel.value = result;

      topPlayerList.value = statusModel.value.elements
              ?.where((i) => num.parse(i.totalpoints.toString()) >= 135)
              .toList() ??
          [];

      //Most Selected Player
      mostSelected.value = statusModel.value.elements
              ?.where(
                  (i) => i.id == statusModel.value.events?.last.mostSelected)
              .toList()
              .firstOrNull ??
          Elements();
      mostCaptained.value = statusModel.value.elements
              ?.where(
                  (i) => i.id == statusModel.value.events?.last.mostCaptained)
              .toList()
              .firstOrNull ??
          Elements();
      mostViceCaptained.value = statusModel.value.elements
              ?.where((i) =>
                  i.id == statusModel.value.events?.last.mostViceCaptained)
              .toList()
              .firstOrNull ??
          Elements();
      mostTransferred.value = statusModel.value.elements
              ?.where((i) =>
                  i.id == statusModel.value.events?.last.mostTransferredIn)
              .toList()
              .firstOrNull ??
          Elements();

      // topPlayerList.value = statusModel.value.elements!
      //     .where((i) => num.parse(i.ponumsPerGame.toString()) >= 4.0)
      //     .toList();
    } catch (e) {
      isLoading.value = false;
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: AppTheme.red);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onReady() {
    //
  }

  @override
  void onClose() {
    //
  }
}
