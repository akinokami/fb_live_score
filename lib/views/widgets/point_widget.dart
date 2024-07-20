import 'package:fb_livescore/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class PointWidget extends StatelessWidget {
  final String? title;
  final String? point;
  const PointWidget({
    super.key,
    this.title,
    this.point,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 35,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(2),
        ),
        child: Column(
          children: [
            Opacity(
              opacity: 0.6,
              child: CustomText(
                text: title ?? '',
              ),
            ),
            CustomText(
              text: point ?? '',
            ),
          ],
        ),
      ),
    );
  }
}
