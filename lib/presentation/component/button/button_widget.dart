import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/res/colors.dart';
import 'package:hms_app/presentation/component/shared/exc_button.dart';
import 'package:sizer/sizer.dart';

class ButtonWidget {
  static menuButton(
      {required void Function()? onPressed,
      required String selectedMenu,
      required String e}) {
    return SizedBox(
      height: 18.sp,
      width: Get.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              alignment: Alignment.centerLeft,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.sp),
              ),
              elevation: 0.sp,
              side: BorderSide(
                  color:
                      (selectedMenu == e) ? Colors.white : Colors.transparent),
              backgroundColor: (selectedMenu == e)
                  ? const Color(0xFF293074).withOpacity(0.8).withOpacity(0.5)
                  : const Color(0xFF293074)),
          onPressed: onPressed,
          child: Text(
            e,
            style: whiteCalibriTextStyle.copyWith(fontSize: 6.sp),
          )),
    );
  }

  static save({Function()? onPressed, String? title}) {
    return WonsButton(
      height: 25.sp,
      width: Get.width,
      verticalPadding: 0,
      color: AppColors.accent.withOpacity(0.4),
      onPressed: onPressed,
      child: Text(
        (title == null) ? "SIMPAN " : title,
        style: const TextStyle(
            color: AppColors.neutral,
            fontWeight: FontWeight.w500,
            fontSize: 16),
      ),
    );
  }

  static loading() {
    return WonsButton(
      height: 25.sp,
      width: Get.width,
      verticalPadding: 0,
      color: AppColors.accent.withOpacity(0.4),
      child: const CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }

  static primaryButton(
      {required String title,
      required BuildContext context,
      Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width,
        height: 65,
        margin: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 5.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.sp),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF0B6E08), Color(0xFF71AD6F)])),
        child: Center(
          child: Text(
            title,
            style: whiteTextStyle.copyWith(fontSize: 14.sp),
          ),
        ),
      ),
    );
  }

  static disableButton(
      {required String title,
      required BuildContext context,
      Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width,
        height: 65,
        margin: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 5.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.sp),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF8E908E), Color(0xFF242424)])),
        child: Center(
          child: Text(
            title,
            style: whiteTextStyle.copyWith(fontSize: 14.sp),
          ),
        ),
      ),
    );
  }

  static loadingButton({required BuildContext context}) {
    return InkWell(
      onTap: null,
      child: Container(
        width: Get.width,
        height: 65,
        margin: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 5.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.sp),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF0B6E08), Color(0xFF71AD6F)])),
        child: Center(
          child: SizedBox(
              height: 25.sp,
              width: 25.sp,
              child: const CircularProgressIndicator(
                  color: Colors.white, strokeWidth: 5)),
        ),
      ),
    );
  }

  static secondaryButton(
      {required String title,
      required BuildContext context,
      Color? color,
      Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width,
        height: 65,
        margin: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 5.sp),
        decoration: BoxDecoration(
          color: const Color(0xFFEDF1FA),
          boxShadow: [BoxShadow(blurRadius: 2.sp, color: Colors.black12)],
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Center(
          child: Text(
            title,
            style: whiteTextStyle.copyWith(
                fontSize: 14.sp, color: color ?? ThemeColor.greyColor),
          ),
        ),
      ),
    );
  }
}
