import 'package:fb_livescore/models/status_model.dart';
import 'package:fb_livescore/models/team_model.dart';
import 'package:fb_livescore/services/api_constant.dart';
import 'package:fb_livescore/utils/constants.dart';
import 'package:fb_livescore/views/widgets/bottom_modal_sheet.dart';
import 'package:fb_livescore/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            size: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 1.sh * .27,
          child: widget.list.isEmpty
              ? const Center(
                  child: CustomText(
                  text: 'No Data',
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
                        width: 1.sw * .42,
                        margin: const EdgeInsets.all(8.0),
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(10.r),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 5.h),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.r),
                                            topRight: Radius.circular(10.r))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SizedBox(
                                          width: 5.w,
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
                                          width: 20.w,
                                          height: 20.h,
                                          fit: BoxFit.contain,
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Image.network(
                                          "${ApiConstant.imageUrl}${widget.list[index].photo?.replaceAll('.jpg', '.png') ?? ''}",
                                          width: 50.w,
                                          height: 70.h,
                                        ),
                                        SizedBox(
                                          width: 20.w,
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
                                              size: 18.sp,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                      ],
                                    ),
                                  ),
                                  CustomText(
                                    text: widget.list[index].secondName ?? "",
                                    size: 10.sp,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 60.w,
                                          child: Opacity(
                                              opacity: 0.5,
                                              child: CustomText(
                                                text: Constants().defineType(
                                                    widget.list[index]
                                                            .elementType ??
                                                        0),
                                                textAlign: TextAlign.right,
                                                size: 10.sp,
                                                maxLines: 2,
                                              )),
                                        ),
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
                                        SizedBox(
                                          width: 60.w,
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
                                                size: 10.sp,
                                                maxLines: 2,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5.h),
                                    decoration: BoxDecoration(
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
                                            bottomLeft: Radius.circular(10.r),
                                            bottomRight:
                                                Radius.circular(10.r))),
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
                                                  size: 10.sp,
                                                )),
                                            Opacity(
                                                opacity: 0.9,
                                                child: CustomText(
                                                  text:
                                                      "${widget.list[index].eventPoints ?? ''}",
                                                  textColor: Colors.white,
                                                  size: 10.sp,
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
                                                  size: 10.sp,
                                                )),
                                            Opacity(
                                                opacity: 0.9,
                                                child: CustomText(
                                                  text:
                                                      "${widget.list[index].nowCost ?? ''}",
                                                  size: 10.sp,
                                                  textColor: Colors.white,
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
