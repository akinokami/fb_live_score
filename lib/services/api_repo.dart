import 'package:fb_livescore/models/match_history_model.dart';
import 'package:fb_livescore/models/status_model.dart';
import 'package:fb_livescore/services/api_constant.dart';

import '../utils/custom_exception.dart';
import 'api_utils.dart';

class ApiRepo {
  final ApiUtils apiUtils = ApiUtils();

  Future<StatusModel> getStatus() async {
    try {
      final response =
          await apiUtils.get(url: "${ApiConstant.baseUrl}bootstrap-static/");
      return StatusModel.fromJson(response.data);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<List<MatchHistoryModel>> getHistory(int playerId) async {
    try {
      final response = await apiUtils.get(
          url: "${ApiConstant.baseUrl}element-summary/$playerId");
      final homeBuiderList = response.data['history'] as List;
      return homeBuiderList
          .map((item) => MatchHistoryModel.fromJson(item))
          .toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
}
