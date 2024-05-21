import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/report/report_bloc.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/title/title_component.dart';
import 'package:hms_app/presentation/kebidanan/bloc/kartu_observasi/kartu_observasi_bloc.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:hms_app/presentation/screens/emty_page.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class ReportKartuObservasiPageWidget extends StatefulWidget {
  const ReportKartuObservasiPageWidget({super.key});

  @override
  State<ReportKartuObservasiPageWidget> createState() =>
      _ReportKartuObservasiPageWidgetState();
}

class _ReportKartuObservasiPageWidgetState
    extends State<ReportKartuObservasiPageWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocBuilder<ReportBloc, ReportState>(
      builder: (context, state) {
        if (state.status == ReportStatus.isLoadingReportAnak) {
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
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2.sp)),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
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
                                        "KARTU OBSERVASI 24 JAM",
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
                                            judul2:
                                                singlePasien.first.namaPasien),
                                        TitleWidget.boxTitle(
                                            judul1: "Tanggal Lahir",
                                            judul2: (singlePasien
                                                        .first.tglLahir.length >
                                                    10)
                                                ? singlePasien.first.tglLahir
                                                    .substring(0, 10)
                                                : singlePasien.first.tglLahir),
                                        TitleWidget.boxTitle(
                                            judul1: "Nomor Rekam Medis",
                                            judul2: singlePasien.first.mrn),
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
                                top: 5.sp, bottom: 0, right: 5.sp, left: 5.sp),
                            child: Table(
                                border: TableBorder.all(),
                                columnWidths: const {
                                  // 0: FlexColumnWidth(0.4),
                                },
                                children: [
                                  TableRow(children: [
                                    TitleWidget.headerCenterTitle2(
                                        title: "JAM"),
                                    TitleWidget.headerCenterTitle2(title: "T"),
                                    TitleWidget.headerCenterTitle2(title: "N"),
                                    TitleWidget.headerCenterTitle2(title: "P"),
                                    TitleWidget.headerCenterTitle2(title: "S"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "CVP"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "EKG"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "UKURAN KI"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "UKURAN KA"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "REDAKSI KI"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "REDAKSI KA"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "GERAK ANGGOTA BADAN"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "KESADARAN"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "SPUTUM WARNA"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "ISI CUP"),
                                    TitleWidget.headerCenterTitle2(
                                        title: "KETERANGAN"),
                                  ]),
                                ])),

                        // BLOC BUILDER
                        BlocBuilder<KartuObservasiBloc, KartuObservasiState>(
                          builder: (context, state) {
                            if (state.kartuObservasi.isEmpty) {
                              return Container(
                                height: 200.sp,
                                margin:
                                    EdgeInsets.only(right: 5.sp, left: 5.sp),
                                decoration: BoxDecoration(
                                    color: ThemeColor.primaryColor
                                        .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(0.sp)),
                                child: EmtyScren(
                                  subTitle: "Data Kosong",
                                  textStyle: blackTextStyle,
                                ),
                              );
                            }
                            if (state.kartuObservasi.isNotEmpty) {
                              return Container(
                                  padding:
                                      EdgeInsets.only(right: 5.sp, left: 5.sp),
                                  child: Table(
                                      border: TableBorder.all(),
                                      columnWidths: const {},
                                      children: state.kartuObservasi.map((e) {
                                        return TableRow(children: [
                                          TitleWidget.contentTitle(
                                              title: e.jam.substring(11, 19)),
                                          TitleWidget.contentTitle(title: e.t),
                                          TitleWidget.contentTitle(title: e.n),
                                          TitleWidget.contentTitle(title: e.p),
                                          TitleWidget.contentTitle(title: e.s),
                                          TitleWidget.contentTitle(
                                              title: e.cvp),
                                          TitleWidget.contentTitle(
                                              title: e.ekg),
                                          TitleWidget.contentTitle(
                                              title: e.pupilKiri),
                                          TitleWidget.contentTitle(
                                              title: e.pupilKanan),
                                          TitleWidget.contentTitle(
                                              title: e.redaksiKiri),
                                          TitleWidget.contentTitle(
                                              title: e.redaksiKanan),
                                          TitleWidget.contentTitle(
                                              title: e.anggotaBadan),
                                          TitleWidget.contentTitle(
                                              title: e.kesadaran),
                                          TitleWidget.contentTitle(
                                              title: e.sputumWarna),
                                          TitleWidget.contentTitle(
                                              title: e.isiCup),
                                          TitleWidget.contentTitle(
                                              title: e.keterangan),
                                        ]);
                                      }).toList()));
                            }
                            return Container();
                          },
                        ),

                        SizedBox(
                          height: 50.sp,
                        ),
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
