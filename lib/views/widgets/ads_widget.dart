import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdsWidget extends StatelessWidget {
  final void Function()? onTap;
  const AdsWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.w),
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          'assets/banner.webp',
          height: 45.h,
          width: 1.sw,
        ),
      ),
    );
  }
}
