import 'dart:math';

import 'package:fb_livescore/controller/home_controller.dart';
import 'package:fb_livescore/services/api_constant.dart';
import 'package:fb_livescore/views/widgets/ads_widget.dart';
import 'package:fb_livescore/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/my_team_controller.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/global.dart';

class MyTeamScreen extends StatefulWidget {
  const MyTeamScreen({super.key});

  @override
  State<MyTeamScreen> createState() => _MyTeamScreenState();
}

class _MyTeamScreenState extends State<MyTeamScreen> {
  final myTeamController = Get.put(MyTeamController());
  final homeController = Get.put(HomeController());
  bool data = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Obx(
          () => homeController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          SizedBox(
                            height: 1.sh * .05,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.h),
                            child: SizedBox(
                              height: 1.sh * .045,
                              child: TextField(
                                style: TextStyle(fontSize: 12.sp),
                                controller: myTeamController.searchController,
                                onChanged: (value) {
                                  myTeamController.searchController.text =
                                      value;
                                },
                                decoration: InputDecoration(
                                    hintText: "Enter Manager ID",
                                    contentPadding:
                                        EdgeInsets.only(top: 10.h, left: 10.w),
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12.sp),
                                    //prefixIcon: Icon(Icons.search),

                                    suffixIcon: Padding(
                                      padding: EdgeInsets.all(5.h),
                                      child: GestureDetector(
                                        onTap: () {
                                          if (myTeamController.searchController
                                              .text.isNotEmpty) {
                                            setState(() {
                                              data = true;
                                              FocusScope.of(context).unfocus();
                                              homeController.getTeam();
                                            });
                                          }
                                        },
                                        child: Container(
                                          width: 70.w,
                                          decoration: BoxDecoration(
                                              color: AppTheme.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(50.r)),
                                          child: Center(
                                              child: CustomText(
                                            text: "Search",
                                            textColor: Colors.white,
                                            size: 12.sp,
                                          )),
                                        ),
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.r))),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.sh * .03,
                          ),
                          Obx(
                            () => homeController.isLoading1.value
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Column(
                                    children: [
                                      if (data)
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  const CustomText(
                                                    text: "Overall Rank",
                                                    textColor: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  SizedBox(height: 3.h),
                                                  CustomText(
                                                    text: Random()
                                                        .nextInt(111111)
                                                        .toString(),
                                                    textColor: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  const CustomText(
                                                    text: "Points",
                                                    textColor: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  SizedBox(height: 3.h),
                                                  CustomText(
                                                    text: Random()
                                                        .nextInt(11)
                                                        .toString(),
                                                    textColor: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  const CustomText(
                                                    text: "Total Points",
                                                    textColor: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  SizedBox(height: 3.h),
                                                  CustomText(
                                                    text: Random()
                                                        .nextInt(1111)
                                                        .toString(),
                                                    textColor: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      SizedBox(
                                        height: 1.sh * .03,
                                      ),
                                      if (data)
                                        Container(
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/soccer_field.webp"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SizedBox(
                                                    height: 20.h,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 45.h,
                                                            child:
                                                                Image.network(
                                                              "${ApiConstant.imageUrl}${homeController.gokeeper.value.photo?.replaceAll('.jpg', '.png') ?? ''}",
                                                              errorBuilder: (BuildContext
                                                                      context,
                                                                  Object
                                                                      exception,
                                                                  StackTrace?
                                                                      stackTrace) {
                                                                return Icon(
                                                                  Icons.person,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 45.sp,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 8.h,
                                                          ),
                                                          Container(
                                                            width: 1.sw * .2,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 5.w,
                                                                    right: 5.w),
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    Colors.blue,
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius
                                                                        .circular(5
                                                                            .r),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            5.r))),
                                                            child: Center(
                                                              child: CustomText(
                                                                text: homeController
                                                                        .gokeeper
                                                                        .value
                                                                        .secondName ??
                                                                    '',
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                size: 10.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 1.sw * .2,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 5.w,
                                                                    right: 5.w),
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius: BorderRadius.only(
                                                                    bottomRight:
                                                                        Radius.circular(5
                                                                            .r),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            5.r))),
                                                            child: Center(
                                                              child: CustomText(
                                                                text:
                                                                    "${homeController.gokeeper.value.totalpoints ?? ''}",
                                                                textColor:
                                                                    Colors
                                                                        .black,
                                                                size: 10.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: 85.h,
                                                        child: homeController
                                                                .dList.isEmpty
                                                            ? const Center(
                                                                child: CustomText(
                                                                    text:
                                                                        "No Data Found"),
                                                              )
                                                            : ListView.builder(
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis
                                                                        .horizontal,
                                                                itemCount:
                                                                    homeController
                                                                        .dList
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  return Padding(
                                                                    padding: EdgeInsets.only(
                                                                        right: 10
                                                                            .w),
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              45.h,
                                                                          child:
                                                                              Image.network(
                                                                            "${ApiConstant.imageUrl}${homeController.dList[index].photo?.replaceAll('.jpg', '.png') ?? ''}",
                                                                            errorBuilder: (BuildContext context,
                                                                                Object exception,
                                                                                StackTrace? stackTrace) {
                                                                              return Icon(
                                                                                Icons.person,
                                                                                color: Colors.white,
                                                                                size: 45.sp,
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              8.h,
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              1.sw * .2,
                                                                          padding: EdgeInsets.only(
                                                                              left: 5.w,
                                                                              right: 5.w),
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.blue,
                                                                              borderRadius: BorderRadius.only(topRight: Radius.circular(5.r), topLeft: Radius.circular(5.r))),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                CustomText(
                                                                              text: homeController.dList[index].secondName ?? '',
                                                                              textColor: Colors.white,
                                                                              size: 10.sp,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              1.sw * .2,
                                                                          padding: EdgeInsets.only(
                                                                              left: 5.w,
                                                                              right: 5.w),
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(5.r), bottomLeft: Radius.circular(5.r))),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                CustomText(
                                                                              text: "${homeController.dList[index].totalpoints}",
                                                                              fontWeight: FontWeight.bold,
                                                                              size: 10.sp,
                                                                              textColor: Colors.black,
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  );
                                                                }),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: 85.h,
                                                        child: ListView.builder(
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount:
                                                                homeController
                                                                    .mList
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right: 10
                                                                            .w),
                                                                child: Column(
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          45.h,
                                                                      child: Image
                                                                          .network(
                                                                        "${ApiConstant.imageUrl}${homeController.mList[index].photo?.replaceAll('.jpg', '.png') ?? ''}",
                                                                        errorBuilder: (BuildContext context,
                                                                            Object
                                                                                exception,
                                                                            StackTrace?
                                                                                stackTrace) {
                                                                          return Icon(
                                                                            Icons.person,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                45.sp,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            8.h),
                                                                    Container(
                                                                      width:
                                                                          1.sw *
                                                                              .2,
                                                                      padding: EdgeInsets.only(
                                                                          left: 5
                                                                              .w,
                                                                          right:
                                                                              5.w),
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                              .blue,
                                                                          borderRadius: BorderRadius.only(
                                                                              topRight: Radius.circular(5.r),
                                                                              topLeft: Radius.circular(5.r))),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            CustomText(
                                                                          text: homeController.mList[index].secondName ??
                                                                              '',
                                                                          size:
                                                                              10.sp,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          textColor:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          1.sw *
                                                                              .2,
                                                                      padding: EdgeInsets.only(
                                                                          left: 5
                                                                              .w,
                                                                          right:
                                                                              5.w),
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                              .white,
                                                                          borderRadius: BorderRadius.only(
                                                                              bottomRight: Radius.circular(5.r),
                                                                              bottomLeft: Radius.circular(5.r))),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            CustomText(
                                                                          text:
                                                                              "${homeController.mList[index].totalpoints}",
                                                                          textColor:
                                                                              Colors.black,
                                                                          size:
                                                                              10.sp,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              );
                                                            }),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: 85.h,
                                                        child: ListView.builder(
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount:
                                                                homeController
                                                                    .fList
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right: 10
                                                                            .w),
                                                                child: Column(
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          45.h,
                                                                      child: Image
                                                                          .network(
                                                                        "${ApiConstant.imageUrl}${homeController.fList[index].photo?.replaceAll('.jpg', '.png') ?? ''}",
                                                                        errorBuilder: (BuildContext context,
                                                                            Object
                                                                                exception,
                                                                            StackTrace?
                                                                                stackTrace) {
                                                                          return Icon(
                                                                            Icons.person,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                45.sp,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          8.h,
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          1.sw *
                                                                              .2,
                                                                      padding: EdgeInsets.only(
                                                                          left: 5
                                                                              .w,
                                                                          right:
                                                                              5.w),
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                              .blue,
                                                                          borderRadius: BorderRadius.only(
                                                                              topRight: Radius.circular(5.r),
                                                                              topLeft: Radius.circular(5.r))),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            CustomText(
                                                                          text: homeController.fList[index].secondName ??
                                                                              '',
                                                                          textColor:
                                                                              Colors.white,
                                                                          size:
                                                                              10.sp,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          1.sw *
                                                                              .2,
                                                                      padding: EdgeInsets.only(
                                                                          left: 5
                                                                              .w,
                                                                          right:
                                                                              5.w),
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                              .white,
                                                                          borderRadius: BorderRadius.only(
                                                                              bottomRight: Radius.circular(5.r),
                                                                              bottomLeft: Radius.circular(5.r))),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            CustomText(
                                                                          text:
                                                                              "${homeController.fList[index].totalpoints}",
                                                                          textColor:
                                                                              Colors.black,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          size:
                                                                              10.sp,
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              );
                                                            }),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20.h,
                                                  ),
                                                ])),
                                      SizedBox(
                                        height: 1.sh * .03,
                                      ),
                                    ],
                                  ),
                          )
                        ],
                      ),
                    ),
                    Visibility(
                      visible: Global.countryCode == 'PH' ||
                          Global.countryCode == 'VN',
                      child: AdsWidget(
                        onTap: () {},
                      ),
                    )
                  ],
                ),
        ));
  }
}
