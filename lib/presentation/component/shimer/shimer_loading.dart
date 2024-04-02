import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimerLoading {
  static loadingTextField() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.3),
      highlightColor: Colors.grey.withOpacity(0.1),
      child: Container(
        height: 45.sp,
        padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 24.sp),
        width: Get.width,
        decoration: BoxDecoration(
            color: ThemeColor.whiteColor,
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  static loadingCard() {
    Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.3),
      highlightColor: Colors.grey.withOpacity(0.1),
      child: Container(
        height: 155.sp,
        padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 24.sp),
        width: Get.width,
        decoration: BoxDecoration(
            color: ThemeColor.whiteColor,
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  static loadingExpandCard({Color? baseColor, Color? highLightColor}) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.white.withOpacity(0.5),
      highlightColor: highLightColor ?? Colors.lightBlue.withOpacity(0.2),
      child: Container(
        height: 155.sp,
        padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 24.sp),
        width: Get.width,
        decoration: BoxDecoration(
            color: ThemeColor.whiteColor,
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
