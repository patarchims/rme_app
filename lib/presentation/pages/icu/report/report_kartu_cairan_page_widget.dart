import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/title/title_component.dart';
import 'package:hms_app/presentation/pages/icu/bloc/report_icu/report_icu_bloc.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:hms_app/presentation/screens/emty_page.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class ReportKartuCairanPageWidget extends StatefulWidget {
  const ReportKartuCairanPageWidget({super.key});

  @override
  State<ReportKartuCairanPageWidget> createState() =>
      _ReportKartuCairanPageWidgetState();
}

class _ReportKartuCairanPageWidgetState
    extends State<ReportKartuCairanPageWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocBuilder<ReportIcuBloc, ReportIcuState>(
      builder: (context, state) {
        if (state.status == ReportIcuStatus.isLoadingGet) {
          return Scaffold(
            backgroundColor: ThemeColor.transparentColor,
            body: SizedBox(
              width: Get.width,
              height: Get.height,
              child: Loading.expandedLoading(),
            ),
          );
        }

        return Scaffold(
          backgroundColor: ThemeColor.transparentColor,
          body: Container(
            width: Get.width,
            height: Get.height,
            margin: EdgeInsets.all(2.sp),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                  style: BorderStyle.solid,
                )),
            child: RawScrollbar(
                thumbColor: ThemeColor.darkColor,
                thumbVisibility: true,
                interactive: true,
                thickness: 10.sp,
                controller: _scrollController,
                trackVisibility: false,
                radius: Radius.circular(5.sp),
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                          style: BorderStyle.solid,
                        )),
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(8.sp),
                            child: const HeaderAllWidget()),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 5.sp, vertical: 5.sp),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                                style: BorderStyle.solid,
                              )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(2.sp)),
                                child: TableDesk(
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black, width: 1),
                                  ),
                                  child: Container(
                                    color: Colors.white,
                                    child: TableDeskRow(
                                      border: const BorderSide(
                                          width: 1, color: Colors.black),
                                      gaps: [
                                        TableGap.weight(),
                                        TableGap.weight(),
                                      ],
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          child: Center(
                                            child: Text(
                                              "KARTU CAIRAN\n& OBAT-OBATAN 24 JAM",
                                              textAlign: TextAlign.center,
                                              style: blackTextStyle.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10.sp),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(5.sp),
                                          width: Get.width,
                                          child: Table(
                                            border: TableBorder.all(
                                                color: ThemeColor.whiteColor),
                                            columnWidths: const {
                                              0: FlexColumnWidth(0.4),
                                              1: FlexColumnWidth(0.6),
                                            },
                                            children: [
                                              TitleWidget.boxTitle(
                                                  judul1: "Nama Pasien",
                                                  judul2: singlePasien
                                                      .first.namaPasien),
                                              TitleWidget.boxTitle(
                                                  judul1: "Tanggal Lahir",
                                                  judul2: (singlePasien.first
                                                              .tglLahir.length >
                                                          10)
                                                      ? singlePasien
                                                          .first.tglLahir
                                                          .substring(0, 10)
                                                      : singlePasien
                                                          .first.tglLahir),
                                              TitleWidget.boxTitle(
                                                  judul1: "Nomor Rekam Medis",
                                                  judul2:
                                                      singlePasien.first.mrn),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.only(
                                      top: 5.sp,
                                      bottom: 0,
                                      right: 5.sp,
                                      left: 5.sp),
                                  child: Table(
                                      border: TableBorder.all(),
                                      columnWidths: const {
                                        // 0: FlexColumnWidth(0.4),
                                      },
                                      children: [
                                        TableRow(children: [
                                          TitleWidget.headerCenterTitle2(
                                              title: "JAM"),
                                          TitleWidget.headerCenterTitle2(
                                              title: "CAIRAN\nMASUK\nI"),
                                          TitleWidget.headerCenterTitle2(
                                              title: "CAIRAN\nMASUK\nII"),
                                          TitleWidget.headerCenterTitle2(
                                              title: "CAIRAN\nMASUK\nIII"),
                                          TitleWidget.headerCenterTitle2(
                                              title: "CAIRAN\nMASUK\nNGT"),
                                          TitleWidget.headerCenterTitle2(
                                              title:
                                                  "NAMA CAIRAN\nDAN OBAT OBATAN"),
                                          TitleWidget.headerCenterTitle2(
                                              title: "CAIRAN\nKELUAR URINE"),
                                          TitleWidget.headerCenterTitle2(
                                              title: "CAIRAN\nKELUAR NGT"),
                                          TitleWidget.headerCenterTitle2(
                                              title: "DRAIN, DLL"),
                                          TitleWidget.headerCenterTitle2(
                                              title: "KETERANGAN"),
                                        ]),
                                      ])),

                              // ADD TODO: KARTU CAIRAN
                              if (state.kartuCairan.isEmpty) ...[
                                Container(
                                  height: 200.sp,
                                  margin:
                                      EdgeInsets.only(right: 5.sp, left: 5.sp),
                                  decoration: BoxDecoration(
                                      color: ThemeColor.primaryColor
                                          .withOpacity(0.2),
                                      borderRadius:
                                          BorderRadius.circular(0.sp)),
                                  child: EmtyScren(
                                    subTitle: "Data Kosong",
                                    textStyle: blackTextStyle,
                                  ),
                                ),
                              ],
                              if (state.kartuCairan.isNotEmpty) ...[
                                Container(
                                    padding: EdgeInsets.only(
                                        right: 5.sp, left: 5.sp),
                                    child: Table(
                                        border: TableBorder.all(),
                                        columnWidths: const {
                                          10: FlexColumnWidth(1.2),
                                        },
                                        children: state.kartuCairan.map((e) {
                                          return TableRow(children: [
                                            TitleWidget.contentTitle(
                                                title: e.jam.substring(11, 19)),
                                            TitleWidget.contentTitle(
                                                title: e.cairanMasuk1),
                                            TitleWidget.contentTitle(
                                                title: e.cairanMasuk2),
                                            TitleWidget.contentTitle(
                                                title: e.cairanMasuk3),
                                            TitleWidget.contentTitle(
                                                title: e.cairanMasukNgt),
                                            TitleWidget.contentTitle(
                                                title: e.namaCairan),
                                            TitleWidget.contentTitle(
                                                title: e.cairanKeluarUrine),
                                            TitleWidget.contentTitle(
                                                title: e.cairanKeluarNgt),
                                            TitleWidget.contentTitle(
                                                title: e.drainDll),
                                            TitleWidget.contentTitle(
                                                title: e.keterangan),
                                          ]);
                                        }).toList())),
                              ],

                              SizedBox(
                                height: 50.sp,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ),
        );
      },
    );
  }
}
