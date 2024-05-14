import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class EmtyObatScreenPage extends StatelessWidget {
  final double? size;
  final String subTitle;
  final TextStyle? textStyle;
  const EmtyObatScreenPage({
    super.key,
    this.size,
    required this.subTitle,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(AppConstant.obatAnimate,
              height: size ?? 150.sp, reverse: true, repeat: true),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: textStyle ?? whiteTextStyle,
          )
        ],
      ),
    );
  }
}
