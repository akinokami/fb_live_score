import 'package:fb_livescore/controller/cart_controller.dart';
import 'package:fb_livescore/models/status_model.dart';
import 'package:fb_livescore/models/team_mode.dart';
import 'package:fb_livescore/services/api_constant.dart';
import 'package:fb_livescore/utils/constants.dart';
import 'package:fb_livescore/utils/text_style_const.dart';
import 'package:fb_livescore/views/widgets/bottom_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_theme.dart';

class HomeCustomCardSingle extends StatefulWidget {
  const HomeCustomCardSingle(
      {super.key, this.title, required this.modelData, required this.teamList});
  final String? title;
  final Elements modelData;
  final List<Teams> teamList;
  @override
  State<HomeCustomCardSingle> createState() => _HomeCustomCardSingleState();
}

class _HomeCustomCardSingleState extends State<HomeCustomCardSingle> {
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return FractionallySizedBox(
            heightFactor: 0.9,
            child: BottomSheetContent(
              title: widget.title ?? "",
              modelData: widget.modelData,
              teamList: widget.teamList,
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title ?? "",
            style: homeSmallTitleTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              _showBottomSheet(context);
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .2,
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              //color:Colors.blueGrey,
                              // gradient:  LinearGradient(
                              //   colors: [
                              //     Colors.blueGrey.withOpacity(0.6),
                              //     Colors.blueGrey
                              //   ], //#A2D240//#1B8B00
                              //   begin: Alignment.topLeft,
                              //   end: Alignment.bottomRight,
                              // ),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  teamList
                                          .firstWhere((element) =>
                                              int.parse(
                                                  element.id.toString()) ==
                                              int.parse(widget.modelData.team
                                                  .toString()))
                                          .imageUrl ??
                                      '',
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image.network(
                                "${ApiConstant.imageUrl}${widget.modelData.photo?.replaceAll('.jpg', '.png') ?? ''}",
                                width: 50,
                                height: 70,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              // Padding(
                              //   padding: EdgeInsets.all(8.0),
                              //   child: Opacity(
                              //     opacity: 0.8,
                              //     child: Icon(
                              //       color: Colors.black,
                              //       Icons.shopping_cart_outlined,
                              //       size: 20,
                              //     ),
                              //   ),
                              // ),
                              Obx(
                                () => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    // onTap: () => cartController
                                    //     .addToCart(widget.modelData),
                                    onTap: (){
                                      if (cartController.cartList.any((item) => item.id == widget.modelData.id)) {
                                        // If it is, remove it
                                        cartController.removeFromCart(widget.modelData);
                                      } else {
                                        // If it's not, add it
                                        cartController.addToCart(widget.modelData);
                                      }
                                      // Update the UI
                                      cartController.updateCartList();
                                    },
                                    child: Icon(
                                      color: cartController.cartList.any((item) => item.id == widget.modelData.id)
                                          ? AppTheme.primaryColor
                                          : Colors.grey,
                                      cartController.cartList.any((item) => item.id == widget.modelData.id)
                                          ? Icons.shopping_cart
                                          : Icons.shopping_cart_outlined,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          widget.modelData.secondName ?? "",
                          style: smallTextStyleBlack,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Opacity(
                                  opacity: 0.5,
                                  child: Text(
                                      Constants().defineType(
                                          widget.modelData.elementType ?? 0),
                                      style: smallTextStyleBlack)),
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
                              Opacity(
                                  opacity: 0.5,
                                  child: Text(
                                      widget.teamList
                                              .firstWhere((element) =>
                                                  int.parse(
                                                      element.id.toString()) ==
                                                  int.parse(widget
                                                      .modelData.team
                                                      .toString()))
                                              .name ??
                                          '',
                                      style: smallTextStyleBlack)),
                            ],
                          ),
                        ),
                        Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Opacity(
                                      opacity: 0.6,
                                      child: Text("GW38 Pts",
                                          style: smallTextStyleWhite)),
                                  Opacity(
                                      opacity: 0.8,
                                      child: Text(
                                          "${widget.modelData.eventPoints ?? ''}",
                                          style: smallTextStyleWhite)),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Opacity(
                                      opacity: 0.6,
                                      child: Text("Price",
                                          style: smallTextStyleWhite)),
                                  Opacity(
                                      opacity: 0.8,
                                      child: Text(
                                          "${widget.modelData.nowCost ?? ''}",
                                          style: smallTextStyleWhite)),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Opacity(
                                      opacity: 0.6,
                                      child: Text("Owned",
                                          style: smallTextStyleWhite)),
                                  Opacity(
                                      opacity: 0.8,
                                      child: Text(
                                          "${widget.modelData.selectedByPercent ?? ''}%",
                                          style: smallTextStyleWhite)),
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
          ),
        ],
      ),
    );
  }
}
