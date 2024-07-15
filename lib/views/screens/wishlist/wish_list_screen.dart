import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller.dart';
import '../../../models/team_model.dart';
import '../../../services/api_constant.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/constants.dart';
import '../../../utils/text_style_const.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.primaryColor,
          title: const Text('Wish Lists'),
          centerTitle: true,
        ),
        body: Obx(
          () => SizedBox(
            width: double.infinity,
            child: cartController.cartList.isNotEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * .9,
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding:
                                              const EdgeInsets.only(top: 5),
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
                                                  topRight:
                                                      Radius.circular(10))),
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
                                                            int.parse(
                                                                cartController
                                                                    .cartList[
                                                                        index]
                                                                    .team
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
                                                "${ApiConstant.imageUrl}${cartController.cartList[index].photo?.replaceAll('.jpg', '.png') ?? ''}",
                                                width: 50,
                                                height: 70,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Obx(
                                                () => GestureDetector(
                                                  onTap: () => cartController
                                                      .addToCart(cartController
                                                          .cartList[index]),
                                                  child: Icon(
                                                    color: cartController
                                                            .cartList
                                                            .contains(
                                                                cartController
                                                                        .cartList[
                                                                    index])
                                                        ? AppTheme.primaryColor
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
                                              const SizedBox(
                                                width: 5,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          cartController
                                                  .cartList[index].secondName ??
                                              "",
                                          style: smallTextStyleBlack,
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
                                                    child: Text(
                                                        textAlign:
                                                            TextAlign.right,
                                                        Constants().defineType(
                                                            cartController
                                                                    .cartList[
                                                                        index]
                                                                    .elementType ??
                                                                0),
                                                        style:
                                                            smallTextStyleBlack)),
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
                                                width: 50,
                                                child: Opacity(
                                                    opacity: 0.5,
                                                    child: Text(
                                                        teamList
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
                                                        style:
                                                            smallTextStyleBlack)),
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
                                                      child: Text("GW38 Pts",
                                                          style:
                                                              smallTextStyleWhite)),
                                                  Opacity(
                                                      opacity: 0.9,
                                                      child: Text(
                                                          "${cartController.cartList[index].eventPoints ?? ''}",
                                                          style:
                                                              smallTextStyleWhite)),
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
                                                          style:
                                                              smallTextStyleWhite)),
                                                  Opacity(
                                                      opacity: 0.9,
                                                      child: Text(
                                                          "${cartController.cartList[index].nowCost ?? ''}",
                                                          style:
                                                              smallTextStyleWhite)),
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
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(
                        Icons.shopping_cart,
                        size: 100,
                        color: Colors.grey,
                      ),
                      Text(
                        'No wish list available',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
          ),
        ));
  }
}
