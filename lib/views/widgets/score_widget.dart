import 'package:fb_livescore/utils/text_style_const.dart';
import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  final String? title;
  final String? score;
  const ScoreWidget({
    super.key,
    this.title,
    this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 3),
      child: Material(
        borderRadius: BorderRadius.circular(50),
        elevation: 10,
        child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
                color: const Color(0xff1B8B00).withOpacity(0.7),
                borderRadius: BorderRadius.circular(50)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title ?? '', style: smallTextStyleWhite),
                Text(score ?? '', style: smallTextStyleWhite),
              ],
            )),
      ),
    );
  }
}
