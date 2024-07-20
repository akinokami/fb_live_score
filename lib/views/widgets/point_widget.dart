import 'package:fb_livescore/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Container(
      height: 35.h,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      margin: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(2.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.6,
            child: CustomText(
              text: title ?? '',
              size: 10.sp,
            ),
          ),
          CustomText(
            text: point ?? '',
            size: 10.sp,
          ),
        ],
      ),
    );
  }
}
