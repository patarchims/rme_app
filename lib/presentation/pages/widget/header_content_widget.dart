import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:sizer/sizer.dart';

import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/res/colors.dart';

class HeaderContentWidget extends StatelessWidget {
  final Widget widget;
  final String? title;
  final bool isENableAdd;
  final Color? backgroundColor;

  final Function()? onPressed;
  const HeaderContentWidget({
    super.key,
    required this.widget,
    this.isENableAdd = true,
    this.title,
    this.backgroundColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? ThemeColor.bgColor,
      floatingActionButton: SizedBox(
        width: 50.sp,
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: (isENableAdd)
              ? ThemeColor.mainMenuColor
              : AppColors.textLight.withOpacity(0.4),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.sp)),
          onPressed: onPressed,
          heroTag: "btn2",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.save, color: Colors.white, size: 10.sp),
              SizedBox(width: 5.sp),
              Text(
                title ?? "SIMPAN",
                style: whiteTextStyle.copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      body: widget,
    );
  }
}
