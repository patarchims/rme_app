import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:sizer/sizer.dart';

class MessageAlert {
  static deleteAlert(
      {required String mesage, required void Function()? onPressed}) {
    return SizedBox(
      height: 100.sp,
      width: 150.sp,
      child: Scaffold(
        backgroundColor: ThemeColor.transparentColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Pesan',
                textAlign: TextAlign.center,
                style: primaryTextStyle.copyWith(
                    fontSize: 9.sp, color: ThemeColor.primaryColor)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                mesage,
                textAlign: TextAlign.center,
                style: blackTextStyle.copyWith(
                    fontSize: 8.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              color: Colors.transparent,
              margin: EdgeInsets.only(top: 5.sp),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25.sp,
                    width: 60.sp,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ThemeColor.whiteColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.sp),
                                side: const BorderSide(
                                    color: ThemeColor.primaryColor,
                                    width: 1,
                                    style: BorderStyle.solid))),
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Tidak",
                          style: primaryTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 8.sp,
                              color: ThemeColor.primaryColor),
                        )),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  SizedBox(
                    height: 25.sp,
                    width: 60.sp,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: const BorderSide(
                                    color: ThemeColor.primaryColor,
                                    width: 1,
                                    style: BorderStyle.solid))),
                        onPressed: onPressed,
                        child: Text(
                          "Ya",
                          style: whiteTextStyle.copyWith(
                            fontSize: 8.sp,
                          ),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
