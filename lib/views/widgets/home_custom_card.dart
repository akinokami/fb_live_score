import 'package:fb_livescore/utils/text_style_const.dart';
import 'package:flutter/material.dart';

import '../../models/home_custom_card_model.dart';

class HomeCustomCard extends StatefulWidget {
  const HomeCustomCard({super.key, required this.title, required this.list});
final String title;
final List<HomeCustomCardModel> list;
  @override
  State<HomeCustomCard> createState() => _HomeCustomCardState();
}

class _HomeCustomCardState extends State<HomeCustomCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title,style: homeSmallTitleTextStyle,),
          SizedBox(height: 10,),
          SizedBox(

            height: MediaQuery.of(context).size.height*.2,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.list.length,
                itemBuilder: (context,index){
                  return Card(
                    child: Column(

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(widget.list[index].teamLogoPath,width: 20,height: 20,),
                            Image.asset(widget.list[index].playerImage,width: 50,height: 50,),
                            Icon(Icons.shopping_cart,size: 20,),

                          ],
                        ),
                        Text(widget.list[index].playerName,style: defaultTextStyleBlack,),
                        Row(
                          children: [
                            Opacity(opacity:0.5,child: Text(widget.list[index].playRole,style: defaultTextStyleBlack)),
                            VerticalDivider(width: 5,color: Colors.red,),
                            Opacity(
                                opacity:0.5,
                                child: Text(widget.list[index].teamName,style: defaultTextStyleBlack)),
                          ],
                        )
                      ],
                    ),
                  );
                }),
          ),

        ],
      ),
    );
  }
}
