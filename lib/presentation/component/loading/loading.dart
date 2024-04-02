import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/constant/app_constants.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/component/shimer/shimer_loading.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ProgressCardData {
  final int totalUndone;
  final int totalTaskInProress;

  const ProgressCardData({
    required this.totalUndone,
    required this.totalTaskInProress,
  });
}

abstract class Loading {
  static SizedBox expandedLoading() {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: ShimerLoading.loadingExpandCard(
          baseColor: Colors.white.withOpacity(0.5),
          highLightColor: Colors.lightBlue.withOpacity(0.1)),
    );
  }

  static Card progressCardLoading({
    required ProgressCardData data,
    required Function() onPressedCheck,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(kBorderRadius),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Transform.translate(
                offset: const Offset(10, 30),
                child: SizedBox(
                  height: 75.sp,
                  width: 200,
                  child: SvgPicture.asset(
                    AppConstant.happySvg,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: kSpacing,
              top: kSpacing,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You Have ${data.totalUndone} Undone Tasks",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black),
                ),
                Text(
                  "${data.totalTaskInProress} Tasks are in progress",
                  style: TextStyle(color: kFontColorPallets[2]),
                ),
                const SizedBox(height: kSpacing),
                // ElevatedButton(
                //   onPressed: onPressedCheck,
                //   child: const Text("Check"),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Center circleLoading() {
    return Center(
      child: SizedBox(
          height: 35.sp,
          width: 35.sp,
          child: CircularProgressIndicator(
            strokeWidth: 7.sp,
            color: ThemeColor.softBlue.withOpacity(0.5),
          )),
    );
  }

  static SizedBox shimeLaoding() {
    return SizedBox(
      width: 200.0,
      height: 100.0,
      child: Shimmer.fromColors(
          baseColor: const Color(0xFFF8F8F8),
          highlightColor: Colors.white,
          child: Container(
            width: 200.0,
            height: 100.0,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(12.sp)),
          )),
    );
  }
}
