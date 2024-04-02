import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:sizer/sizer.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColor.primaryColor,
          foregroundColor: Colors.white,
          title: const Text("NOT FOUND"),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF1060AE),
              Color(0xFF8FA8BD),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppConstant.notFoundSVG,
                fit: BoxFit.fitHeight,
              ),
              Center(
                  child: Text(
                "Halaman tidak ditemukan",
                textAlign: TextAlign.center,
                style: whiteCalibriTextStyle.copyWith(fontSize: 13.sp),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
