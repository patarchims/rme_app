import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';

class BoxSkriningEmtyWidget extends StatelessWidget {
  final String title;
  final double? width;
  final Widget widget;
  final double? height;
  const BoxSkriningEmtyWidget({
    super.key,
    required this.title,
    this.width,
    this.height,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (width != null) ? width : 140.sp,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.sp),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(3.sp),
            width: Get.width,
            decoration: const BoxDecoration(
              color: Color(0xFF293074),
            ),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: whiteCalibriTextStyle.copyWith(fontSize: 9.sp),
              ),
            ),
          ),
          widget
        ],
      ),
    );
  }
}
