import 'package:fb_livescore/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller.dart';
import '../../../models/team_model.dart';
import '../../../services/api_constant.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/constants.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.primaryColor,
          title: CustomText(
            text: 'Wish Lists',
            size: 14.sp,
            textColor: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => SizedBox(
            width: double.infinity,
            child: cartController.cartList.isNotEmpty
                ? SizedBox(
                    height: 1.sh * .9,
                    child: Center(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 0.88),
                          itemCount: cartController.cartList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                // setState(() {
                                //   selectedIndex = index;
                                // });
                                //
                                // _showBottomSheet(context);
                              },
                              child: Container(
                                width: 1.sw * .4,
                                margin: const EdgeInsets.all(8.0),
                                child: Material(
                                  elevation: 10,
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(top: 5.h),
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
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10))),
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
                                                              int.parse(element
                                                                  .id
                                                                  .toString()) ==
                                                              int.parse(
                                                                  cartController
                                                                      .cartList[
                                                                          index]
                                                                      .team
                                                                      .toString()))
                                                          .imageUrl ??
                                                      '',
                                                  width: 20.w,
                                                  height: 20.h,
                                                ),
                                                SizedBox(
                                                  width: 20.w,
                                                ),
                                                Image.network(
                                                  "${ApiConstant.imageUrl}${cartController.cartList[index].photo?.replaceAll('.jpg', '.png') ?? ''}",
                                                  width: 50.w,
                                                  height: 70.h,
                                                ),
                                                SizedBox(
                                                  width: 20.w,
                                                ),
                                                Obx(
                                                  () => GestureDetector(
                                                    onTap: () => cartController
                                                        .addToCart(
                                                            cartController
                                                                    .cartList[
                                                                index]),
                                                    child: Icon(
                                                      color: cartController
                                                              .cartList
                                                              .contains(
                                                                  cartController
                                                                          .cartList[
                                                                      index])
                                                          ? AppTheme
                                                              .primaryColor
                                                          : Colors.grey,
                                                      cartController.cartList
                                                              .contains(
                                                                  cartController
                                                                          .cartList[
                                                                      index])
                                                          ? Icons.shopping_cart
                                                          : Icons
                                                              .shopping_cart_outlined,
                                                      size: 20,
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
                                            text: cartController.cartList[index]
                                                    .secondName ??
                                                "",
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
                                                            cartController
                                                                    .cartList[
                                                                        index]
                                                                    .elementType ??
                                                                0),
                                                        textAlign:
                                                            TextAlign.right,
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
                                                        text: teamList
                                                                .firstWhere((element) =>
                                                                    int.parse(
                                                                        element
                                                                            .id
                                                                            .toString()) ==
                                                                    int.parse(cartController
                                                                        .cartList[
                                                                            index]
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
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10))),
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
                                                          size: 10.sp,
                                                          textColor:
                                                              Colors.white,
                                                        )),
                                                    Opacity(
                                                        opacity: 0.9,
                                                        child: CustomText(
                                                          text:
                                                              "${cartController.cartList[index].eventPoints ?? ''}",
                                                          size: 10.sp,
                                                          textColor:
                                                              Colors.white,
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
                                                          size: 10.sp,
                                                          textColor:
                                                              Colors.white,
                                                        )),
                                                    Opacity(
                                                        opacity: 0.9,
                                                        child: CustomText(
                                                          text:
                                                              "${cartController.cartList[index].nowCost ?? ''}",
                                                          size: 10.sp,
                                                          textColor:
                                                              Colors.white,
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
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.shopping_cart,
                        size: 100.sp,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      CustomText(
                        text: 'No wish list available',
                        size: 14.sp,
                      ),
                    ],
                  ),
          ),
        ));
  }
}
