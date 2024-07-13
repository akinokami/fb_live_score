import 'package:fb_livescore/utils/text_style_const.dart';
import 'package:flutter/material.dart';

import '../../models/home_custom_card_model.dart';
import '../../utils/app_theme.dart';
import 'bottom_modal_sheet.dart';

class HomeCustomCard extends StatefulWidget {
  const HomeCustomCard({super.key, required this.title, required this.list});
  final String title;
  final List<HomeCustomCardModel> list;
  @override
  State<HomeCustomCard> createState() => _HomeCustomCardState();
}

class _HomeCustomCardState extends State<HomeCustomCard> {
  int selectedIndex = 0;
  List<int> selectedList = [];
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return FractionallySizedBox(
            heightFactor: 0.9,
            child: BottomSheetContent(title: widget.title??"",modelData: widget.list[selectedIndex],));
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 8),
          child: Text(
            widget.title,
            style: homeSmallTitleTextStyle,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .22,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.list.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedIndex=index;
                    });

                       _showBottomSheet(context);


                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width*.4,
                    height: MediaQuery.of(context).size.height*.45,
                    margin: const EdgeInsets.all(8.0),
                    child: Material(
                      elevation: 10,
                        borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Container(
                                padding:const EdgeInsets.only(top: 5),
                                decoration:BoxDecoration(
                                  //color:Colors.blueGrey,
                                  //   gradient:  LinearGradient(
                                  //     colors: [
                                  //       Colors.blueGrey.withOpacity(0.6),
                                  //       Colors.blueGrey
                                  //     ], //#A2D240//#1B8B00
                                  //     begin: Alignment.topLeft,
                                  //     end: Alignment.bottomRight,
                                  //   ),
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const SizedBox(width: 5,),
                                    Image.asset(
                                      widget.list[index].teamLogoPath??"",
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(width: 20,),
                                    Image.asset(
                                      widget.list[index].playerImage??"",
                                      width: 50,
                                      height: 70,
                                    ),
                                    const SizedBox(width: 20,),
                                    GestureDetector(
                                      onTap: (){
                                       setState(() {
                                         selectedList.contains(index)?selectedList.remove(index):selectedList.add(index);
                                       });
                                      },
                                      child: Icon(
                                        color: selectedList.contains(index)?AppTheme.primaryColor:Colors.grey,
                                        selectedList.contains(index)?Icons.shopping_cart
                                            : Icons.shopping_cart_outlined,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 5,),
                                  ],
                                ),
                              ),
                              Text(
                                widget.list[index].playerName??"",
                                style: smallTextStyleBlack,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      child: Opacity(
                                          opacity: 0.5,
                                          child: Text(
                                              textAlign: TextAlign.right,
                                              widget.list[index].playRole??"",
                                              style: smallTextStyleBlack)),
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
                                          child: Text(widget.list[index].teamName??"",
                                              style: smallTextStyleBlack)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                //padding:EdgeInsets.only(top: 5),
                                decoration:const BoxDecoration(
                                    color:AppTheme.primaryColor,
                                    // gradient: LinearGradient(
                                    //   colors: [
                                    //     Color(0xFFA2D240),
                                    //     Color(0xFF1B8B00)
                                    //   ], //#A2D240//#1B8B00
                                    //   begin: Alignment.topLeft,
                                    //   end: Alignment.bottomRight,
                                    // ),
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                                ),
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
                                            opacity: 0.9,
                                            child: Text(widget.list[index].gw38Points??"",
                                                style: smallTextStyleWhite)),
                                      ],
                                    ),
                                    const SizedBox(width: 10,),
                                    Column(
                                      children: [
                                        Opacity(
                                            opacity: 0.6,
                                            child: Text("Price",
                                                style: smallTextStyleWhite)),
                                        Opacity(
                                            opacity: 0.9,
                                            child: Text(widget.list[index].price??"",
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
                );
              }),
        ),
      ],
    );
  }
}
