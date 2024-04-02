import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:sizer/sizer.dart';

class FormulirAsesmenKeperawatanWidgetPage extends StatelessWidget {
  const FormulirAsesmenKeperawatanWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.transparentColor,
      body: Container(
        width: Get.width,
        padding: EdgeInsets.all(8.sp),
        height: Get.height,
        margin: EdgeInsets.all(2.sp),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: Colors.black, width: 1, style: BorderStyle.solid)),
        child: ListView(
          children: [
            const HeaderReportHarapanWidget(),
            SizedBox(
              height: 5.sp,
            ),
            Text("ASSESMEN KEPERAWATAN PASIEN HEMODIALISA",
                textAlign: TextAlign.center,
                style: blackTextStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 9.sp)),
            const Divider(),
            SizedBox(height: 15.sp),
          ],
        ),
      ),
    );
  }
}
