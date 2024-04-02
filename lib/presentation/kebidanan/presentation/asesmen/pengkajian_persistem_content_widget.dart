import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class PenkajianPerSistemKebidananContentWidget extends StatelessWidget {
  const PenkajianPerSistemKebidananContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
        widget: SingleChildScrollView(
      child: Column(
        children: [
          TitleWidget.headerTitle(title: "PEMERIKSAAN FISIK"),
          contentBox(
              title: "KEPALA",
              widget: Container(
                width: Get.width,
                height: 20.sp,
                decoration: const BoxDecoration(color: Colors.grey),
              )),
          contentBox(
              title: "MATA",
              widget: Container(
                width: Get.width,
                height: 20.sp,
                decoration: const BoxDecoration(color: Colors.grey),
              )),
          contentBox(
              title: "TELINGA",
              widget: Container(
                width: Get.width,
                height: 20.sp,
                decoration: const BoxDecoration(color: Colors.grey),
              )),
          contentBox(
              title: "LEHER DAN BAHU",
              widget: Container(
                width: Get.width,
                height: 20.sp,
                decoration: const BoxDecoration(color: Colors.grey),
              )),
          contentBox(
              title: "MULUT",
              widget: Container(
                width: Get.width,
                height: 20.sp,
                decoration: const BoxDecoration(color: Colors.grey),
              )),
          contentBox(
              title: "MUCOSA MULUT",
              widget: Container(
                width: Get.width,
                height: 20.sp,
                decoration: const BoxDecoration(color: Colors.grey),
              )),
          contentBox(
              title: "GIGI",
              widget: Container(
                width: Get.width,
                height: 20.sp,
                decoration: const BoxDecoration(color: Colors.grey),
              )),
          contentBox(
              title: "HIDUNG",
              widget: Container(
                width: Get.width,
                height: 20.sp,
                decoration: const BoxDecoration(color: Colors.grey),
              )),
          contentBox(
              title: "TENGGOROKAN",
              widget: Container(
                width: Get.width,
                height: 20.sp,
                decoration: const BoxDecoration(color: Colors.grey),
              )),
          contentBox(
              title: "PAYUDARA",
              widget: Container(
                width: Get.width,
                height: 20.sp,
                decoration: const BoxDecoration(color: Colors.grey),
              )),
          contentBox(
              title: "ABDOMEN",
              widget: Container(
                width: Get.width,
                height: 20.sp,
                decoration: const BoxDecoration(color: Colors.grey),
              )),
          contentBox(
              title: "NUTRISI & HIDRASI",
              widget: Container(
                width: Get.width,
                height: 20.sp,
                decoration: const BoxDecoration(color: Colors.grey),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.sp),
            child: const Divider(),
          ),
          TitleWidget.headerTitle(title: "ELIMINASI DAN PELEPASAN"),
        ],
      ),
    ));
  }

  Container contentBox({required String title, required Widget widget}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5.sp,
      ),
      child: Table(
        border: TableBorder.all(color: ThemeColor.bgColor),
        columnWidths: const {
          1: FlexColumnWidth(4),
          2: FlexColumnWidth(1.2),
        },
        children: [
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: blackTextStyle.copyWith(fontSize: 6.sp),
              ),
            ),
            widget
          ]),
        ],
      ),
    );
  }
}
