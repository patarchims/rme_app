import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/alert/custom_dialog.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/title/title_component.dart';
import 'package:hms_app/presentation/kebidanan/presentation/asesmen_ulang_nyeri/tambah_asesmen_ulang_nyeri_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class AsesmenUlangNyeriPage extends StatelessWidget {
  const AsesmenUlangNyeriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: HeaderContentWidget(
      backgroundColor: ThemeColor.bgColor,
      isENableAdd: true,
      onPressed: () {
        // TAMBAH DATA
        CustomDialogWidget.getDialog(
            widget: SizedBox(
                height: Get.height - 100.sp,
                width: Get.width,
                child: const TambahAsesmenUlangNyeriWidget()),
            color: ThemeColor.transparentColor);
      },
      title: "TAMBAH",
      widget: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(
                    top: 5.sp, bottom: 0, right: 5.sp, left: 5.sp),
                child: Table(border: TableBorder.all(), columnWidths: const {
                  0: FlexColumnWidth(0.4),
                }, children: [
                  TableRow(children: [
                    TitleWidget.headerCenterTitle2(title: "NO."),
                    TitleWidget.headerCenterTitle2(title: "TANGGAL"),
                    TitleWidget.headerCenterTitle2(title: "SKOR NYERI"),
                    TitleWidget.headerCenterTitle2(title: "TD"),
                    TitleWidget.headerCenterTitle2(title: "NADI"),
                    TitleWidget.headerCenterTitle2(title: "RR"),
                    TitleWidget.headerCenterTitle2(title: "NAMA OBAT"),
                    TitleWidget.headerCenterTitle2(title: "DOSIS"),
                    TitleWidget.headerCenterTitle2(title: "RUTE"),
                    TitleWidget.headerCenterTitle2(title: "INTERVENSI"),
                    TitleWidget.headerCenterTitle2(title: "WAKTU KAJI ULANG"),
                    TitleWidget.headerCenterTitle2(title: "NAMA PERAWAT"),
                  ]),
                ])),
          ],
        ),
      ),
    ));
  }
}
