import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/route/get_route.dart';
import 'package:sizer/sizer.dart';

class DisconetScreen extends StatelessWidget {
  const DisconetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.bgColor,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppConstant.noConnectionSVG,
                fit: BoxFit.fitHeight,
              ),
              Text(
                "Tidak dapat terhubung ke server",
                style: blackTextStyle.copyWith(fontSize: 12.sp),
              ),
              SizedBox(
                width: Get.width,
                height: 25.sp,
                child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(GetRoutes.login);
                    },
                    child: Text(
                      "Back to login",
                      style: whiteTextStyle,
                    )),
              )
            ],
          ),
        ));
  }
}
