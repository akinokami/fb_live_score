import 'package:fb_livescore/utils/text_style_const.dart';
import 'package:flutter/material.dart';

import '../../models/home_custom_card_model.dart';
import '../../utils/app_theme.dart';
import 'bottom_modal_sheet.dart';

class HomeCustomCardSingle extends StatefulWidget {
  const HomeCustomCardSingle({super.key,  this.title,required  this.modelData});
  final String? title;
  final HomeCustomCardModel modelData;
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
            child: BottomSheetContent(title: widget.title??"",modelData: widget.modelData,));
      },
    );
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title??"",
            style: homeSmallTitleTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: (){
              _showBottomSheet(context);
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .2,
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
                          decoration:BoxDecoration(
                              //color:Colors.blueGrey,
                              // gradient:  LinearGradient(
                              //   colors: [
                              //     Colors.blueGrey.withOpacity(0.6),
                              //     Colors.blueGrey
                              //   ], //#A2D240//#1B8B00
                              //   begin: Alignment.topLeft,
                              //   end: Alignment.bottomRight,
                              // ),
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  widget.modelData.teamLogoPath??"",
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                              const SizedBox(width: 20,),
                              Image.asset(
                                widget.modelData.playerImage??"",
                                width: 50,
                                height: 70,
                              ),
                              const SizedBox(width: 20,),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Opacity(
                                  opacity: 0.8,
                                  child: Icon(
                                    color: Colors.black,
                                    Icons.shopping_cart_outlined,
                                    size: 20,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        Text(
                          widget.modelData.playerName??"",
                          style: smallTextStyleBlack,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Opacity(
                                  opacity: 0.5,
                                  child: Text(widget.modelData.playRole??"",
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
                                  child: Text(widget.modelData.teamName??"",
                                      style: smallTextStyleBlack)),
                            ],
                          ),
                        ),
                        Container(
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
                                      opacity: 0.8,
                                      child: Text(widget.modelData.gw38Points??"",
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
                                      opacity: 0.8,
                                      child: Text(widget.modelData.price??"",
                                          style: smallTextStyleWhite)),
                                ],
                              ),
                              const SizedBox(width: 10,),
                              Column(
                                children: [
                                  Opacity(
                                      opacity: 0.6,
                                      child: Text("Owned",
                                          style: smallTextStyleWhite)),
                                  Opacity(
                                      opacity: 0.8,
                                      child: Text(widget.modelData.owned??"",
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
