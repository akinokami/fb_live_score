import 'package:fb_livescore/models/status_model.dart';
import 'package:fb_livescore/models/team_model.dart';
import 'package:fb_livescore/services/api_constant.dart';
import 'package:fb_livescore/utils/constants.dart';
import 'package:fb_livescore/views/widgets/bottom_modal_sheet.dart';
import 'package:fb_livescore/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../utils/app_theme.dart';

class HomeCustomCard extends StatefulWidget {
  const HomeCustomCard(
      {super.key,
      required this.title,
      required this.list,
      required this.teamList});
  final String title;
  final List<Elements> list;
  final List<Teams> teamList;
  @override
  State<HomeCustomCard> createState() => _HomeCustomCardState();
}

class _HomeCustomCardState extends State<HomeCustomCard> {
  int selectedIndex = 0;
  List<int> selectedList = [];
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      context: context,
      builder: (context) {
        return FractionallySizedBox(
            heightFactor: 0.9,
            child: BottomSheetContent(
              title: widget.title,
              modelData: widget.list[selectedIndex],
              teamList: widget.teamList,
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 8),
          child: CustomText(
            text: widget.title,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .22,
          child: widget.list.isEmpty
              ? const Center(
                  child: CustomText(
                  text: 'No Data',
                  size: 14,
                ))
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.list.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });

                        _showBottomSheet(context);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * .4,
                        height: MediaQuery.of(context).size.height * .45,
                        margin: const EdgeInsets.all(8.0),
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(top: 5),
                                    decoration: const BoxDecoration(
                                        //color:Colors.blueGrey,
                                        //   gradient:  LinearGradient(
                                        //     colors: [
                                        //       Colors.blueGrey.withOpacity(0.6),
                                        //       Colors.blueGrey
                                        //     ], //#A2D240//#1B8B00
                                        //     begin: Alignment.topLeft,
                                        //     end: Alignment.bottomRight,
                                        //   ),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Image.network(
                                          teamList
                                                  .firstWhere((element) =>
                                                      int.parse(element.id
                                                          .toString()) ==
                                                      int.parse(widget
                                                          .list[index].team
                                                          .toString()))
                                                  .imageUrl ??
                                              '',
                                          width: 20,
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Image.network(
                                          "${ApiConstant.imageUrl}${widget.list[index].photo?.replaceAll('.jpg', '.png') ?? ''}",
                                          width: 50,
                                          height: 70,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Obx(
                                          () => GestureDetector(
                                            onTap: () {
                                              if (cartController.cartList.any(
                                                  (item) =>
                                                      item.id ==
                                                      widget.list[index].id)) {
                                                // If it is, remove it
                                                cartController.removeFromCart(
                                                    widget.list[index]);
                                              } else {
                                                // If it's not, add it
                                                cartController.addToCart(
                                                    widget.list[index]);
                                              }
                                              // Update the UI
                                              cartController.updateCartList();
                                            },
                                            // onTap: () => cartController
                                            //     .addToCart(widget.list[index]),
                                            child: Icon(
                                              color: cartController.cartList
                                                      .any((item) =>
                                                          item.id ==
                                                          widget.list[index].id)
                                                  ? AppTheme.primaryColor
                                                  : Colors.grey,
                                              cartController.cartList.any(
                                                      (item) =>
                                                          item.id ==
                                                          widget.list[index].id)
                                                  ? Icons.shopping_cart
                                                  : Icons
                                                      .shopping_cart_outlined,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                  CustomText(
                                    text: widget.list[index].secondName ?? "",
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 50,
                                          child: Opacity(
                                              opacity: 0.5,
                                              child: CustomText(
                                                text: Constants().defineType(
                                                    widget.list[index]
                                                            .elementType ??
                                                        0),
                                                textAlign: TextAlign.right,
                                              )),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        const SizedBox(
                                            height: 10,
                                            child: VerticalDivider(
                                              width: 5,
                                              color: Colors.grey,
                                            )),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        SizedBox(
                                          width: 90,
                                          child: Opacity(
                                              opacity: 0.5,
                                              child: CustomText(
                                                text: widget.teamList
                                                        .firstWhere((element) =>
                                                            int.parse(element.id
                                                                .toString()) ==
                                                            int.parse(widget
                                                                .list[index]
                                                                .team
                                                                .toString()))
                                                        .name ??
                                                    '',
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    //padding:EdgeInsets.only(top: 5),
                                    decoration: const BoxDecoration(
                                        color: AppTheme.primaryColor,
                                        // gradient: LinearGradient(
                                        //   colors: [
                                        //     Color(0xFFA2D240),
                                        //     Color(0xFF1B8B00)
                                        //   ], //#A2D240//#1B8B00
                                        //   begin: Alignment.topLeft,
                                        //   end: Alignment.bottomRight,
                                        // ),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            Opacity(
                                                opacity: 0.6,
                                                child: CustomText(
                                                  text: "GW38 Pts",
                                                  textColor: Colors.white,
                                                )),
                                            Opacity(
                                                opacity: 0.9,
                                                child: CustomText(
                                                  text:
                                                      "${widget.list[index].eventPoints ?? ''}",
                                                )),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            Opacity(
                                                opacity: 0.6,
                                                child: CustomText(
                                                  text: "Price",
                                                  textColor: Colors.white,
                                                )),
                                            Opacity(
                                                opacity: 0.9,
                                                child: CustomText(
                                                  text:
                                                      "${widget.list[index].nowCost ?? ''}",
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
        ),
      ],
    );
  }
}
