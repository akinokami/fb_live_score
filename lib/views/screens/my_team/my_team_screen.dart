import 'dart:math';

import 'package:fb_livescore/controller/home_controller.dart';
import 'package:fb_livescore/services/api_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/my_team_controller.dart';
import '../../../utils/app_theme.dart';

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
              : SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .05,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * .045,
                            child: TextField(
                              controller: myTeamController.searchController,
                              onChanged: (value) {
                                myTeamController.searchController.text = value;
                                // if (myTeamController.searchController.text.isNotEmpty) {
                                //   setState(() {
                                //     data = true;
                                //   });
                                // }else{
                                //   setState(() {
                                //     data = false;
                                //   });
                                // }
                              },
                              decoration: InputDecoration(
                                  hintText: "Enter Manager ID",
                                  contentPadding:
                                      const EdgeInsets.only(top: 10, left: 10),
                                  hintStyle: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                  //prefixIcon: Icon(Icons.search),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        if (myTeamController
                                            .searchController.text.isNotEmpty) {
                                          setState(() {
                                            data = true;
                                            FocusScope.of(context).unfocus();
                                            homeController.getTeam();
                                          });
                                        }
                                      },
                                      child: Container(
                                        //height: 15,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: AppTheme.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: const Center(
                                          child: Text("Search",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        Obx(
                          () => homeController.isLoading1.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Expanded(
                                  child: Column(
                                    children: [
                                      if (data)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  const Text(
                                                    "Overall Rank",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    Random()
                                                        .nextInt(111111)
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  const Text(
                                                    "Points",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    Random()
                                                        .nextInt(11)
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  const Text(
                                                    "Total Points",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    Random()
                                                        .nextInt(1111)
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .03,
                                      ),
                                      if (data)
                                        Expanded(
                                          child: Container(
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
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            SizedBox(
                                                              height: 50,
                                                              child:
                                                                  Image.network(
                                                                "${ApiConstant.imageUrl}${homeController.gokeeper.value.photo?.replaceAll('.jpg', '.png') ?? ''}",
                                                                errorBuilder: (BuildContext
                                                                        context,
                                                                    Object
                                                                        exception,
                                                                    StackTrace?
                                                                        stackTrace) {
                                                                  return const Icon(
                                                                    Icons
                                                                        .person,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 50,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  .2,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 5,
                                                                      right: 5),
                                                              decoration: const BoxDecoration(
                                                                  color: Colors
                                                                      .blue,
                                                                  borderRadius: BorderRadius.only(
                                                                      topRight:
                                                                          Radius.circular(
                                                                              5),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              5))),
                                                              child: Center(
                                                                child: Text(
                                                                  homeController
                                                                          .gokeeper
                                                                          .value
                                                                          .secondName ??
                                                                      '',
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          8,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  .2,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 5,
                                                                      right: 5),
                                                              decoration: const BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius: BorderRadius.only(
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              5),
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              5))),
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                  "2",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          height: 90,
                                                          child:
                                                              ListView.builder(
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
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          right:
                                                                              10.0),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          SizedBox(
                                                                            height:
                                                                                50,
                                                                            child:
                                                                                Image.network(
                                                                              "${ApiConstant.imageUrl}${homeController.dList[index].photo?.replaceAll('.jpg', '.png') ?? ''}",
                                                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                                                return const Icon(
                                                                                  Icons.person,
                                                                                  color: Colors.white,
                                                                                  size: 50,
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * .2,
                                                                            padding:
                                                                                const EdgeInsets.only(left: 5, right: 5),
                                                                            decoration:
                                                                                const BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.only(topRight: Radius.circular(5), topLeft: Radius.circular(5))),
                                                                            child:
                                                                                Center(
                                                                              child: Text(
                                                                                homeController.dList[index].secondName ?? '',
                                                                                style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * .2,
                                                                            padding:
                                                                                const EdgeInsets.only(left: 5, right: 5),
                                                                            decoration:
                                                                                const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5))),
                                                                            child:
                                                                                Center(
                                                                              child: Text(
                                                                                "${homeController.dList[index].totalpoints}",
                                                                                style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
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
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          height: 90,
                                                          child:
                                                              ListView.builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis
                                                                          .horizontal,
                                                                  itemCount:
                                                                      homeController
                                                                          .mList
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    return Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          right:
                                                                              10.0),
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          SizedBox(
                                                                            height:
                                                                                50,
                                                                            child:
                                                                                Image.network(
                                                                              "${ApiConstant.imageUrl}${homeController.mList[index].photo?.replaceAll('.jpg', '.png') ?? ''}",
                                                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                                                return const Icon(
                                                                                  Icons.person,
                                                                                  color: Colors.white,
                                                                                  size: 50,
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * .2,
                                                                            padding:
                                                                                const EdgeInsets.only(left: 5, right: 5),
                                                                            decoration:
                                                                                const BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.only(topRight: Radius.circular(5), topLeft: Radius.circular(5))),
                                                                            child:
                                                                                Center(
                                                                              child: Text(
                                                                                homeController.mList[index].secondName ?? '',
                                                                                style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * .2,
                                                                            padding:
                                                                                const EdgeInsets.only(left: 5, right: 5),
                                                                            decoration:
                                                                                const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5))),
                                                                            child:
                                                                                Center(
                                                                              child: Text(
                                                                                "${homeController.mList[index].totalpoints}",
                                                                                style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
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
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          height: 90,
                                                          child:
                                                              ListView.builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis
                                                                          .horizontal,
                                                                  itemCount:
                                                                      homeController
                                                                          .fList
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    return Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          right:
                                                                              10),
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          SizedBox(
                                                                            height:
                                                                                50,
                                                                            child:
                                                                                Image.network(
                                                                              "${ApiConstant.imageUrl}${homeController.fList[index].photo?.replaceAll('.jpg', '.png') ?? ''}",
                                                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                                                return const Icon(
                                                                                  Icons.person,
                                                                                  color: Colors.white,
                                                                                  size: 50,
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * .2,
                                                                            padding:
                                                                                const EdgeInsets.only(left: 5, right: 5),
                                                                            decoration:
                                                                                const BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.only(topRight: Radius.circular(5), topLeft: Radius.circular(5))),
                                                                            child:
                                                                                Center(
                                                                              child: Text(
                                                                                homeController.fList[index].secondName ?? '',
                                                                                style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * .2,
                                                                            padding:
                                                                                const EdgeInsets.only(left: 5, right: 5),
                                                                            decoration:
                                                                                const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5))),
                                                                            child:
                                                                                Center(
                                                                              child: Text(
                                                                                "${homeController.fList[index].totalpoints}",
                                                                                style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
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
                                                  ])),
                                        ),
                                    ],
                                  ),
                                ),
                        )
                      ],
                    ),
                  ),
                ),
        ));
  }
}
