import 'package:fb_livescore/models/home_custom_card_model.dart';
import 'package:fb_livescore/models/home_top_field_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  final RxList<HomeTopFieldModel> overviewList = <HomeTopFieldModel>[].obs;
  final RxList<HomeCustomCardModel> topPlayerList = <HomeCustomCardModel>[].obs;


  @override
  void onInit() async {
    super.onInit();
    overviewList.addAll([
    HomeTopFieldModel('Highest Points', "154"),
      HomeTopFieldModel('Average Points', "52"),
      HomeTopFieldModel('Transfers Made', "7,278,097"),
      HomeTopFieldModel('Bench Boost', "793,326"),
        HomeTopFieldModel ('Free Hit', "112,447"),
        HomeTopFieldModel('Wildcard', "128,789"),
        HomeTopFieldModel('Triple Captain', "379,636"),

    ]);

    topPlayerList.addAll([
      HomeCustomCardModel("David Beckham", "assets/beckham.webp", "assets/manchester.webp", "Forward", "Manchester United", "30", "10.5 m",""),
      HomeCustomCardModel("Mateta", "assets/beckham.webp", "assets/spur.webp", "Midfielder", "Manchester United", "30", "10.5 m",""),
      HomeCustomCardModel("Eze", "assets/beckham.webp", "assets/mancity.webp", "Defender", "Manchester United", "30", "10.5 m",""),
      HomeCustomCardModel("Bruno G.", "assets/beckham.webp", "assets/spur.webp", "Forward", "Manchester United", "30", "10.5 m",""),
      HomeCustomCardModel("Kulusevski", "assets/beckham.webp", "assets/manchester.webp", "Midfielder", "Manchester United", "30", "10.5 m",""),
      HomeCustomCardModel("Wilson", "assets/beckham.webp", "assets/mancity.webp", "Forward", "Manchester United", "30", "10.5 m",""),
    ]);


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