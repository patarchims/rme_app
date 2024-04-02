import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:hms_app/presentation/component/fonts/font_helper.dart';

class ButtonSoapWidget extends StatelessWidget {
  final String title;
  final String imageAsset;
  final double? fontSize;
  final double? imageHeight;
  final Function()? onPressed;
  const ButtonSoapWidget({
    super.key,
    required this.title,
    this.imageHeight,
    this.fontSize,
    required this.imageAsset,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                elevation: 2,
                backgroundColor: Colors.white),
            onPressed: onPressed,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 8.sp),
              child: Image.asset(
                imageAsset,
                height: imageHeight ?? 65.sp,
              ),
            )),
        SizedBox(height: 6.sp),
        Text(
          title,
          textAlign: TextAlign.center,
          style: whiteCalibriTextStyle.copyWith(
              fontSize: fontSize ?? 14.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
