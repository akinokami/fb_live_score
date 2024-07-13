
import 'package:flutter/material.dart';

import '../../models/home_custom_card_model.dart';
import '../../utils/text_style_const.dart';

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({super.key, required this.title, this.modelData});
final String title;
final HomeCustomCardModel? modelData;

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
int _selectedIndex=0;
  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildTabContainer(int index, String label) {
    return GestureDetector(
      onTap: () => _onTabTapped(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(5),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 3),

           // margin: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: _selectedIndex == index ? Color(0xff1B8B00) : Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              label,
              style:  TextStyle(
                color:_selectedIndex == index ? Colors.white :  Colors.black,
                fontSize: 14.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

Widget _statsWidget() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5),
    height: 500,
    // margin: EdgeInsets.symmetric(horizontal: 10.0),

    child: ListView.builder(
        itemCount: 15,
        itemBuilder: (context,index){
      return Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        color:index%2!=0? Colors.grey[300]:Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Own Goals",style: smallTextStyleBlack,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("154",style: smallTextStyleBlack,),
            ),
          ],

        ),
      );
    }),
  );
}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height:  MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
      
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    widget.modelData?.teamLogoPath??"",
                    width: 20,
                    height: 20,
                  ),
                ),
                const SizedBox(width: 20,),
                Image.asset(
                  widget.modelData?.playerImage??"",
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
            Text(
              widget.modelData?.playerName??"",
              style: smallTextStyleBlack,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(
                      opacity: 0.5,
                      child: Text(widget.modelData?.playRole??"",
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
                      child: Text(widget.modelData?.teamName??"",
                          style: smallTextStyleBlack)),
                ],
              ),
            ),
            const SizedBox(height: 5,),
            SizedBox(
              height: MediaQuery.of(context).size.height*.055,
              child: ListView.builder(
                itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 30,

                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(2),


                        ),
                        child: Column(
                          children: [
                            Opacity(
                                opacity:0.6,
                                child: Text("Price",style: smallTextStyleBlack,)),
                            Text("14.3 m",style: smallTextStyleBlack),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 10,),
            SizedBox(
              height: MediaQuery.of(context).size.height*.7,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _buildTabContainer(0, 'Stats'),
                      _buildTabContainer(1, 'Fixtures'),
                      _buildTabContainer(2, 'Results'),
                    ],
                  ),
                  Expanded(
                    child: _selectedIndex == 0
                        ? _statsWidget()
                        : _selectedIndex == 1
                        ? const Text('Fixtures Tab Content')
                        : const Text('Results Tab Content'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
