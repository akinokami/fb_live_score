import 'package:fb_livescore/controller/cart_controller.dart';
import 'package:fb_livescore/models/status_model.dart';
import 'package:fb_livescore/models/team_model.dart';
import 'package:fb_livescore/services/api_constant.dart';
import 'package:fb_livescore/utils/constants.dart';
import 'package:fb_livescore/views/widgets/bottom_modal_sheet.dart';
import 'package:fb_livescore/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  @override
  void initState() {
    super.initState();
  }

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
          CustomText(
            text: widget.title ?? "",
          ),
          SizedBox(
            height: 10.h,
          ),
          GestureDetector(
            onTap: () {
              _showBottomSheet(context);
            },
            child: SizedBox(
              height: 1.sh * .2,
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
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
                                  topLeft: Radius.circular(10.r),
                                  topRight: Radius.circular(10.r))),
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
                                  fit: BoxFit.contain,
                                  width: 20.w,
                                  height: 20.h,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Image.network(
                                "${ApiConstant.imageUrl}${widget.modelData.photo?.replaceAll('.jpg', '.png') ?? ''}",
                                width: 50.w,
                                height: 70.h,
                              ),
                              SizedBox(
                                width: 20.w,
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
                                    onTap: () {
                                      if (cartController.cartList.any((item) =>
                                          item.id == widget.modelData.id)) {
                                        // If it is, remove it
                                        cartController
                                            .removeFromCart(widget.modelData);
                                      } else {
                                        // If it's not, add it
                                        cartController
                                            .addToCart(widget.modelData);
                                      }
                                      // Update the UI
                                      cartController.updateCartList();
                                    },
                                    child: Icon(
                                      color: cartController.cartList.any(
                                              (item) =>
                                                  item.id ==
                                                  widget.modelData.id)
                                          ? AppTheme.primaryColor
                                          : Colors.grey,
                                      cartController.cartList.any((item) =>
                                              item.id == widget.modelData.id)
                                          ? Icons.shopping_cart
                                          : Icons.shopping_cart_outlined,
                                      size: 18.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomText(
                          text: widget.modelData.secondName ?? "",
                          size: 10.sp,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Opacity(
                                  opacity: 0.5,
                                  child: CustomText(
                                    text: Constants().defineType(
                                        widget.modelData.elementType ?? 0),
                                    size: 10.sp,
                                  )),
                              SizedBox(
                                width: 2.w,
                              ),
                              SizedBox(
                                  height: 10.h,
                                  child: VerticalDivider(
                                    width: 5.w,
                                    color: Colors.grey,
                                  )),
                              SizedBox(
                                width: 2.w,
                              ),
                              Opacity(
                                  opacity: 0.5,
                                  child: CustomText(
                                    text: widget.teamList
                                            .firstWhere((element) =>
                                                int.parse(
                                                    element.id.toString()) ==
                                                int.parse(widget.modelData.team
                                                    .toString()))
                                            .name ??
                                        '',
                                    size: 10.sp,
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppTheme.primaryColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.r),
                                  bottomRight: Radius.circular(10.r))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Opacity(
                                      opacity: 0.6,
                                      child: CustomText(
                                        text: "GW38 Pts",
                                        textColor: Colors.white,
                                        size: 10.sp,
                                      )),
                                  Opacity(
                                      opacity: 0.8,
                                      child: CustomText(
                                        text:
                                            "${widget.modelData.eventPoints ?? ''}",
                                        textColor: Colors.white,
                                        size: 10.sp,
                                      )),
                                ],
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                children: [
                                  Opacity(
                                      opacity: 0.6,
                                      child: CustomText(
                                        text: "Price",
                                        textColor: Colors.white,
                                        size: 10.sp,
                                      )),
                                  Opacity(
                                      opacity: 0.8,
                                      child: CustomText(
                                        text:
                                            "${widget.modelData.nowCost ?? ''}",
                                        textColor: Colors.white,
                                        size: 10.sp,
                                      )),
                                ],
                              ),
                              SizedBox(
                                width: 10.sp,
                              ),
                              Column(
                                children: [
                                  Opacity(
                                      opacity: 0.6,
                                      child: CustomText(
                                        text: "Owned",
                                        textColor: Colors.white,
                                        size: 10.sp,
                                      )),
                                  Opacity(
                                      opacity: 0.8,
                                      child: CustomText(
                                        text:
                                            "${widget.modelData.selectedByPercent ?? ''}%",
                                        textColor: Colors.white,
                                        size: 10.sp,
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
          ),
        ],
      ),
    );
  }
}
