import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ImageBackdropFilter extends StatelessWidget {
  final String imageAssets;
  final Widget widget;
  const ImageBackdropFilter({
    super.key,
    required this.imageAssets,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.sp),
      decoration: BoxDecoration(
        image:
            DecorationImage(image: AssetImage(imageAssets), fit: BoxFit.cover),
        gradient: const LinearGradient(colors: [
          Color(0xFF1060AE),
          Color(0xFF8FA8BD),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 8.0,
            sigmaY: 8.0,
          ),
          child: widget),
    );
  }
}
