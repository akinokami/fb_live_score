import 'package:fb_livescore/models/match_history_model.dart';
import 'package:fb_livescore/services/api_repo.dart';
import 'package:fb_livescore/utils/app_theme.dart';
import 'package:fb_livescore/utils/constants.dart';
import 'package:get/get.dart';

class MatchHistoryController extends GetxController {
  final isLoading = false.obs;
  RxList<MatchHistoryModel> historyList = <MatchHistoryModel>[].obs;

  @override
  void onInit() {
    //
    super.onInit();
  }

  Future<void> getHistory(int? playerId) async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getHistory(playerId ?? 0);
      historyList.value = result.reversed.toList();
      print('historyList: ${historyList.length}');
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
