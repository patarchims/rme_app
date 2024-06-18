import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/alert/custom_dialog.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/component/title/title_component.dart';
import 'package:hms_app/presentation/kebidanan/bloc/double_check/double_check_bloc.dart';
import 'package:hms_app/presentation/kebidanan/presentation/double_check/tambah_data_double_check_widget.dart';
import 'package:hms_app/presentation/kebidanan/presentation/double_check/verifikasi_data_double_check_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class DoubleCheckHightAlertPageWidget extends StatefulWidget {
  const DoubleCheckHightAlertPageWidget({super.key});

  @override
  State<DoubleCheckHightAlertPageWidget> createState() =>
      _DoubleCheckHightAlertPageWidgetState();
}

class _DoubleCheckHightAlertPageWidgetState
    extends State<DoubleCheckHightAlertPageWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoubleCheckBloc, DoubleCheckState>(
      builder: (context, state) {
        if (state.status == DoubleCheckStatus.isLoadingGetData) {
          return Expanded(
              child: HeaderContentWidget(widget: Loading.expandedLoading()));
        }

        return Expanded(
            child: HeaderContentWidget(
                onPressed: () {
                  context.read<DoubleCheckBloc>().add(OnInitCheckHigh());
                  //===//
                  CustomDialogWidget.getDialog(
                      widget: SizedBox(
                          height: Get.height - 130.sp,
                          width: Get.width,
                          child: const TambahDoubleCheckHighAlertPageWidget()),
                      color: ThemeColor.blueColor);
                },
                title: "Tambah",
                isENableAdd: true,
                backgroundColor: ThemeColor.bgColor,
                widget: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                              top: 5.sp, bottom: 0, right: 5.sp, left: 5.sp),
                          child: Table(
                              border: TableBorder.all(),
                              columnWidths: const {
                                0: FlexColumnWidth(0.4),
                              },
                              children: [
                                TableRow(children: [
                                  TitleWidget.headerCenterTitle2(title: "NO."),
                                  TitleWidget.headerCenterTitle2(
                                      title: "BENAR PASIEN"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "BENAR OBAT"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "BENAR DOSIS"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "BENAR CARA"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "BENAR WAKTU"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "BENAR INFORMASI"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "BENAR DOKUMENTASI"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "KETERANGAN"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "PERAWAT PEMBERI"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "PERAWAT VERIFIKASI"),
                                ]),
                              ])),
                      (state.listCheck.isEmpty)
                          ? Container(
                              width: Get.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.sp),
                              decoration: BoxDecoration(
                                  color:
                                      ThemeColor.primaryColor.withOpacity(0.2)),
                              child: Center(
                                  child: SizedBox(
                                height: 100.sp,
                                width: 100.sp,
                                child: Lottie.asset(AppConstant.findAnimation,
                                    height: 20.sp, reverse: true, repeat: true),
                              )),
                            )
                          : Container(
                              padding: EdgeInsets.only(right: 5.sp, left: 5.sp),
                              child: Table(
                                  columnWidths: const {0: FlexColumnWidth(0.4)},
                                  border: TableBorder.all(color: Colors.black),
                                  children:
                                      state.listCheck.asMap().entries.map((e) {
                                    return TableRow(
                                      children: [
                                        TitleWidget.contentTitle(
                                            title: (e.key + 1).toString()),
                                        TitleWidget.isChecklist(
                                            check: e.value.pasien),
                                        TitleWidget.isChecklist(
                                            check: e.value.cara),
                                        TitleWidget.isChecklist(
                                            check: e.value.cara),
                                        TitleWidget.isChecklist(
                                            check: e.value.cara),
                                        TitleWidget.isChecklist(
                                            check: e.value.cara),
                                        TitleWidget.isChecklist(
                                            check: e.value.cara),
                                        TitleWidget.isChecklist(
                                            check: e.value.cara),
                                        TitleWidget.contentTitle(
                                            title: e.value.keterangan),
                                        TitleWidget.contentTitle(
                                            title: e.value.keterangan),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.sp, horizontal: 2.sp),
                                          decoration: BoxDecoration(
                                              color: Colors.white
                                                  .withOpacity(0.5)),
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.sp)),
                                                  backgroundColor:
                                                      ThemeColor.primaryColor),
                                              onPressed: () {
                                                CustomDialogWidget.getDialog(
                                                  widget: SizedBox(
                                                      height:
                                                          Get.height - 160.sp,
                                                      width: Get.width,
                                                      child:
                                                          const VerifikasiDataDoubleCheckWidgetPage()),
                                                  color: ThemeColor.blueColor,
                                                );
                                              },
                                              child: Text(
                                                "VERIFIKASI",
                                                style: whiteTextStyle.copyWith(
                                                    fontSize: 4.sp),
                                              )),
                                        )
                                      ],
                                    );
                                  }).toList())),
                    ],
                  ),
                )));
      },
    );
  }
}
