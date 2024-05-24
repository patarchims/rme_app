// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
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
          child: AnimatedButton(
            width: 200,
            text: title ?? "SIMPAN",
            selectedTextColor: Colors.black,
            backgroundColor: (isENableAdd)
                ? ThemeColor.primaryColor
                : AppColors.textLight.withOpacity(0.4),
            transitionType: TransitionType.BOTTOM_TO_TOP,
            textStyle: const TextStyle(
                fontSize: 28,
                letterSpacing: 5,
                color: ThemeColor.whiteColor,
                fontWeight: FontWeight.w300),
            onPress: onPressed,
          )
          // FLOATING ACTION BUTTON TELAH DI HENTIKAN
          // child: FloatingActionButton(
          //   elevation: 0,
          //   backgroundColor:
          // (isENableAdd)
          //       ? ThemeColor.primaryColor
          //       : AppColors.textLight.withOpacity(0.4),
          //   shape:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.sp)),
          //   onPressed: onPressed,
          //   heroTag: "btn2",
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Icon(
          //         Icons.save,
          //         color: Colors.white,
          //         size: 10.sp,
          //       ),
          //       SizedBox(
          //         width: 5.sp,
          //       ),
          //       Text(
          //         title ?? "SIMPAN", style: whiteTextStyle.copyWith(fontWeight: FontWeight.bold),
          //       )
          //     ],
          //   ),
          // ),
          ),
      body: widget,
    );
  }
}
