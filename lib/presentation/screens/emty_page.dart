// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';

class EmtyScren extends StatelessWidget {
  final double? size;
  final String subTitle;
  final TextStyle? textStyle;
  const EmtyScren({
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
          Lottie.asset(AppConstant.searchAnimate,
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
