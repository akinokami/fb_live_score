import 'package:fb_livescore/models/status_model.dart';
import 'package:fb_livescore/views/widgets/point_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/text_style_const.dart';

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({super.key, required this.title, this.modelData});
  final String title;
  final Elements? modelData;

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  int _selectedIndex = 0;
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 3),

            // margin: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: _selectedIndex == index ? Color(0xff1B8B00) : Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: _selectedIndex == index ? Colors.white : Colors.black,
                fontSize: 14.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _statsWidget(Elements modelData) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
        height: 500,
        child: ListView(
          children: [
            StatusTableWidget(
              title: 'Total Points',
              score: "${modelData.totalpoints}",
            ),
            StatusTableWidget(
              title: 'Points Per Game',
              score: "${modelData.pointsPerGame}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'Starts',
              score: "${modelData.starts}",
            ),
            StatusTableWidget(
              title: 'Minutes',
              score: "${modelData.minutes}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'Goals',
              score: "${modelData.goalsScored}",
            ),
            StatusTableWidget(
              title: 'Assists',
              score: "${modelData.assists}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'xGoals',
              score: "${modelData.expectedGoals}",
            ),
            StatusTableWidget(
              title: 'xAssists',
              score: "${modelData.expectedAssists}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'xGoals Involvements',
              score: "${modelData.expectedGoalInvolvements}",
            ),
            StatusTableWidget(
              title: 'xGoals Per 90',
              score: "${modelData.expectedGoalsPer90}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'xAssists Per 90',
              score: "${modelData.expectedAssistsPer90}",
            ),
            StatusTableWidget(
              title: 'xGoal Involvements Per 90',
              score: "${modelData.expectedGoalInvolvementsPer90}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'Goals Conceded',
              score: "${modelData.goalsConceded}",
            ),
            StatusTableWidget(
              title: 'Goals conceded Per 90',
              score: "${modelData.goalsConcededPer90}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'Penalties Missed',
              score: "${modelData.penaltiesMissed}",
            ),
            StatusTableWidget(
              title: 'Yellow Cards',
              score: "${modelData.yellowCards}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'Red Cards',
              score: "${modelData.redCards}",
            ),
            StatusTableWidget(
              title: 'Own Goals',
              score: "${modelData.ownGoals}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'Bonus',
              score: "${modelData.bonus}",
            ),
            StatusTableWidget(
              title: 'BPS',
              score: "${modelData.bps}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'Influence',
              score: "${modelData.influence}",
            ),
            StatusTableWidget(
              title: 'Creativity',
              score: "${modelData.creativity}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'Threat',
              score: "${modelData.threat}",
            ),
            StatusTableWidget(
              title: 'ICT Index',
              score: "${modelData.ictIndex}",
              color: Colors.grey[300],
            ),
            StatusTableWidget(
              title: 'From',
              score: "${modelData.form}",
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   mainAxisSize: MainAxisSize.max,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Image.asset(
            //         widget.modelData?.teamLogoPath ?? "",
            //         width: 20,
            //         height: 20,
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 20,
            //     ),
            //     Image.asset(
            //       widget.modelData?.playerImage ?? "",
            //       width: 50,
            //       height: 70,
            //     ),
            //     const SizedBox(
            //       width: 20,
            //     ),
            //     const Padding(
            //       padding: EdgeInsets.all(8.0),
            //       child: Opacity(
            //         opacity: 0.8,
            //         child: Icon(
            //           color: Colors.black,
            //           Icons.shopping_cart_outlined,
            //           size: 20,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Text(
              widget.modelData?.secondName ?? "",
              style: smallTextStyleBlack,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(
                      opacity: 0.5,
                      child: Text("role", style: smallTextStyleBlack)),
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
                      child: Text("team name", style: smallTextStyleBlack)),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * .088,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        PointWidget(
                          title: 'Price',
                          point: "${widget.modelData?.nowCost ?? ''}",
                        ),
                        PointWidget(
                          title: 'Total Pts',
                          point: "${widget.modelData?.totalpoints ?? ''}",
                        ),
                        PointWidget(
                          title: 'Pts/Game',
                          point: widget.modelData?.pointsPerGame ?? '',
                        ),
                        PointWidget(
                          title: 'From',
                          point: widget.modelData?.valueForm ?? '',
                        ),
                        PointWidget(
                          title: 'Total Bonous',
                          point: "${widget.modelData?.bonus ?? ''}",
                        ),
                        PointWidget(
                          title: 'GW38 Pts',
                          point: "${widget.modelData?.eventPoints ?? ''}",
                        ),
                      ],
                    ),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .7,
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
                        ? _statsWidget(widget.modelData!)
                        : _selectedIndex == 1
                            ? const Text('')
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

class StatusTableWidget extends StatelessWidget {
  final String? title;
  final String? score;
  final Color? color;
  const StatusTableWidget({
    super.key,
    this.title,
    this.score,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      color: color ??
          Colors.white, // index % 2 != 0 ? Colors.grey[300] : Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title ?? "",
              style: smallTextStyleBlack,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              score ?? "",
              style: smallTextStyleBlack,
            ),
          ),
        ],
      ),
    );
  }
}
