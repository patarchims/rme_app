import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class PengembanganWidget extends StatelessWidget {
  const PengembanganWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(AppConstant.appDevAnimation, height: 175.sp),
        Text(
          "Fitur ini dalam \ntahap pengembangan",
          textAlign: TextAlign.center,
          style: blackTextStyle.copyWith(
              fontWeight: FontWeight.bold, fontSize: 11.sp),
        ),
      ],
    );
  }
}
