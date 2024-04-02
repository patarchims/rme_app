// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';

class ErrorWidgetPage extends StatelessWidget {
  final void Function()? onPressed;
  const ErrorWidgetPage({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(AppConstant.failedAnimation, height: 175.sp),
        Text(
          "Ada masalah dalam \npada sistem",
          textAlign: TextAlign.center,
          style: blackTextStyle.copyWith(
              fontWeight: FontWeight.bold, fontSize: 11.sp),
        ),
        SizedBox(
          height: 5.sp,
        ),
        SizedBox(
          width: Get.width / 2,
          height: 30.sp,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeColor.primaryColor),
              onPressed: onPressed,
              child: Text(
                "Kembali",
                style: whiteTextStyle.copyWith(fontWeight: FontWeight.bold),
              )),
        )
      ],
    );
  }
}
