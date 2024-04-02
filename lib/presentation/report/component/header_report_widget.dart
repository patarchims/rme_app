import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/resources/app_config.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/report/component/header_report_methodist_widget.dart';
import 'package:hms_app/presentation/report/component/header_report_rstiara_widget.dart';
import 'package:sizer/sizer.dart';

class HeaderReportHarapanWidget extends StatelessWidget {
  const HeaderReportHarapanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: Get.width,
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: Image.asset(
                    SetApp.logoApp(
                      appSetup: AppConstant.appSetup,
                    ),
                    height: 55.sp,
                  )),
              SizedBox(
                width: 35.sp,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    SetApp.nameApp(appSetup: AppConstant.appSetup)
                        .toUpperCase(),
                    style: blackTextStyle.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 12.sp),
                  ),
                  Text(
                    SetApp.alamatApp(appSetup: AppConstant.appSetup),
                    textAlign: TextAlign.center,
                    style: blackTextStyle.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 6.sp),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 5.sp,
        ),
        Divider(
          height: 1.sp,
          color: ThemeColor.blackColor,
          thickness: 2.sp,
        ),
      ],
    );
  }
}

class HeaderAllWidget extends StatelessWidget {
  const HeaderAllWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (AppConstant.appSetup == AppSetup.methodist) {
      return const HeaderReportMethodistWidget();
    } else if (AppConstant.appSetup == AppSetup.rsTiara) {
      return const HeaderReportRSTiaraWidget();
    } else {
      return const HeaderReportHarapanWidget();
    }
  }
}
