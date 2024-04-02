import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/res/colors.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/component/shared/exc_button.dart';
import 'package:open_store/open_store.dart';
import 'package:sizer/sizer.dart';

class UpdateNowPage extends StatelessWidget {
  const UpdateNowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: true,
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F5FE),
        body: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Perbaharui",
                    style: blackTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ThemeColor.primaryColor,
                      fontSize: 18.sp,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24.sp),
                    child: Text(
                        "Kami menambahkan banyak fitur baru dan memperbaiki beberapa bug untuk membuat pengalaman Anda semulus mungkin.",
                        textAlign: TextAlign.center,
                        style: blackTextStyle.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 12.sp)),
                  ),
                  SizedBox(
                    height: 25.sp,
                  ),
                  WonsButton(
                    height: 60,
                    width: 348,
                    verticalPadding: 0,
                    color: AppColors.primary,
                    child: const Text(
                      "Perbaharui Sekarang",
                      style: TextStyle(
                          color: AppColors.neutral,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    onPressed: () async {
                      // StoreRedirect.redirect(
                      //     androidAppId: "com.batubara.absensi_app",
                      //     iOSAppId: "com.batubara.absensi_app");
                      OpenStore.instance.open(
                          appStoreId:
                              'com.batubara.absensi_app', // AppStore id of your app for iOS
                          appStoreIdMacOS:
                              '284815942', // AppStore id of your app for MacOS (appStoreId used as default)
                          androidAppBundleId:
                              'com.batubara.absensi_app', // Android app bundle package name
                          windowsProductId:
                              '9NZTWSQNTD0S' // Microsoft store id for Widnows apps
                          );
                    },
                  ),
                ],
              )),
              SizedBox(
                width: Get.width / 2,
                child: SvgPicture.asset(
                  AppConstant.updateSVG,
                  height: Get.height / 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
