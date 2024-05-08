import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:hms_app/presentation/component/component.dart';

class PraOperasiWidget extends StatelessWidget {
  const PraOperasiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
      widget: SingleChildScrollView(
        child: Column(
          children: [
            titleBox(title: "Keadaan Umum"),
            titleBox(title: "Keluhan Utama"),
            formBox(title: "Tek Darah", subTitle: "mmHG"),
            formBox(title: "Nadi", subTitle: "x/mnt"),
            formBox(title: "Suhu", subTitle: "*C"),
            formBox(title: "Pernapasan", subTitle: "x/mnt"),
          ],
        ),
      ),
      onPressed: () {},
    );
  }
}

Container formBox({required String title, required String subTitle}) {
  return Container(
    width: Get.width,
    padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 4.sp),
    child: Row(
      children: [
        SizedBox(
          width: 150.sp,
          child: Text(
            title,
            style: blackTextStyle,
          ),
        ),
        Expanded(child: FormWidget.textForm(enable: true)),
        SizedBox(
          width: 5.sp,
        ),
        SizedBox(
          width: 150.sp,
          child: Text(
            subTitle,
            style: blackTextStyle,
          ),
        ),
      ],
    ),
  );
}

Container titleBox({required String title}) {
  return Container(
    width: Get.width,
    padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 4.sp),
    child: Row(
      children: [
        SizedBox(
          width: 150.sp,
          child: Text(
            title,
            style: blackTextStyle,
          ),
        ),
        Expanded(child: FormWidget.textForm(enable: true))
      ],
    ),
  );
}
