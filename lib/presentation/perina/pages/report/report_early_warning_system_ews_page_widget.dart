import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/qr_code/qr_code_widget.dart';
import 'package:hms_app/presentation/kebidanan/bloc/eary_warning_system/early_warning_system_bloc.dart';
import 'package:hms_app/presentation/kebidanan/presentation/chart/line/line_chart_sample2.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class ReportEarlyWarningSystemPage extends StatefulWidget {
  const ReportEarlyWarningSystemPage({super.key});

  @override
  State<ReportEarlyWarningSystemPage> createState() =>
      _ReportEarlyWarningSystemPageState();
}

class _ReportEarlyWarningSystemPageState
    extends State<ReportEarlyWarningSystemPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    // AuthState authState = context.watch<AuthBloc>().state;

    return BlocBuilder<EarlyWarningSystemBloc, EarlyWarningSystemState>(
      builder: (context, state) {
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
              thickness: 5.sp,
              controller: _scrollController,
              trackVisibility: false,
              radius: Radius.circular(5.sp),
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 5.sp),
                      child: Text("RM. 15 A",
                          textAlign: TextAlign.right,
                          style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.sp),
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
                        Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: const HeaderAllWidget(),
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 1),
                            ),
                            child: TableDeskRow(
                              border: const BorderSide(
                                  width: 1, color: Colors.white),
                              gaps: [
                                TableGap.weight(),
                                TableGap.width(10),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  width: Get.width / 2.5,
                                  height: 40.sp,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "GRAFIK DAN LEMBAR OBSERVASI \nEARLY WARNING SYSTEM (EWS)",
                                        textAlign: TextAlign.center,
                                        style: blackTextStyle.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 9.sp),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    color: Colors.white,
                                    child: const VerticalDivider()),
                                Container(
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      titleText(
                                          title: "RM",
                                          subTitle: singlePasien.first.mrn),
                                      titleText(
                                          title: "Nama",
                                          subTitle:
                                              singlePasien.first.namaPasien),
                                      titleText(
                                          title: "Tanggal Lahir",
                                          subTitle: (singlePasien
                                                      .first.tglLahir.length >
                                                  6)
                                              ? tglIndo(singlePasien
                                                  .first.tglLahir
                                                  .substring(0, 10))
                                              : ""),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
                            ),
                            child: TableDeskRow(
                              border: const BorderSide(
                                  width: 1, color: Colors.black),
                              gaps: [
                                TableGap.width(120),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Text(
                                        "EWS",
                                        style: blackTextStyle.copyWith(
                                            fontSize: 5.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Text(
                                        "Keterangan",
                                        style: blackTextStyle.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 5.sp),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
                            ),
                            child: TableDeskRow(
                              border: const BorderSide(
                                  width: 1, color: Colors.black),
                              gaps: [
                                TableGap.width(120),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Text(
                                        "TINGKAT KESADARAN",
                                        style: blackTextStyle.copyWith(
                                            fontSize: 4.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 100.sp,
                                            width: Get.width,
                                            child: Scaffold(
                                              backgroundColor:
                                                  ThemeColor.whiteColor,
                                              body: LineChartSample2(
                                                spots: state.earlyWarningSystem
                                                    .asMap()
                                                    .entries
                                                    .map((e) {
                                                  return FlSpot(
                                                      e.key + 1,
                                                      (e.value.tingkatKesadaran ==
                                                              "Sadar (A)")
                                                          ? 2
                                                          : 1);
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                          Wrap(
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            children: state.earlyWarningSystem
                                                .asMap()
                                                .entries
                                                .map((e) => Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: SizedBox(
                                                        width: 50.sp,
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              height: 10.sp,
                                                              width: 10.sp,
                                                              child:
                                                                  FloatingActionButton(
                                                                elevation: 0,
                                                                backgroundColor:
                                                                    ThemeColor
                                                                        .darkGreyColor2
                                                                        .withOpacity(
                                                                            0.2),
                                                                onPressed:
                                                                    () {},
                                                                child: Text(
                                                                  "${e.key + 1}.",
                                                                  style: blackTextStyle
                                                                      .copyWith(
                                                                          fontSize:
                                                                              5.sp),
                                                                ),
                                                              ),
                                                            ),
                                                            Column(
                                                              children: [
                                                                Text(
                                                                  " ${tglIndo(e.value.waktu.substring(0, 10))}\n${e.value.waktu.substring(11, 19)}",
                                                                  style: blackTextStyle
                                                                      .copyWith(
                                                                          fontSize:
                                                                              4.sp),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                TextButton(
                                                                    style: (e.value.tingkatKesadaran ==
                                                                            "V/P/U")
                                                                        ? ElevatedButton.styleFrom(
                                                                            backgroundColor:
                                                                                ThemeColor.primaryColor.withOpacity(0.3))
                                                                        : (e.value.tingkatKesadaran == "Sadar (A)")
                                                                            ? ElevatedButton.styleFrom(backgroundColor: ThemeColor.greenColor.withOpacity(0.3))
                                                                            : ElevatedButton.styleFrom(backgroundColor: ThemeColor.primaryColor.withOpacity(0.3)),
                                                                    onPressed: () {},
                                                                    child: Text(
                                                                      e.value
                                                                          .tingkatKesadaran,
                                                                      style: blackTextStyle.copyWith(
                                                                          fontSize:
                                                                              4.sp),
                                                                    ))
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
                            ),
                            child: TableDeskRow(
                              border: const BorderSide(
                                  width: 1, color: Colors.black),
                              gaps: [
                                TableGap.width(120),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Text(
                                        "TEKANAN DARAH\n(SYSTETOLIK)",
                                        style: blackTextStyle.copyWith(
                                            fontSize: 4.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 100.sp,
                                            width: Get.width,
                                            child: Scaffold(
                                              backgroundColor:
                                                  ThemeColor.whiteColor,
                                              body: LineChartSample2(
                                                spots: state.earlyWarningSystem
                                                    .asMap()
                                                    .entries
                                                    .map((e) {
                                                  return FlSpot(e.key + 1,
                                                      e.value.td.toDouble());
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                          Wrap(
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            children: state.earlyWarningSystem
                                                .asMap()
                                                .entries
                                                .map((e) => Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: SizedBox(
                                                        width: 50.sp,
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              height: 10.sp,
                                                              width: 10.sp,
                                                              child:
                                                                  FloatingActionButton(
                                                                elevation: 0,
                                                                backgroundColor:
                                                                    ThemeColor
                                                                        .darkGreyColor2
                                                                        .withOpacity(
                                                                            0.2),
                                                                onPressed:
                                                                    () {},
                                                                child: Text(
                                                                  "${e.key + 1}.",
                                                                  style: blackTextStyle
                                                                      .copyWith(
                                                                          fontSize:
                                                                              5.sp),
                                                                ),
                                                              ),
                                                            ),
                                                            Column(
                                                              children: [
                                                                Text(
                                                                  " ${tglIndo(e.value.waktu.substring(0, 10))}\n${e.value.waktu.substring(11, 19)}, ",
                                                                  style: blackTextStyle
                                                                      .copyWith(
                                                                          fontSize:
                                                                              4.sp),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                TextButton(
                                                                  onPressed:
                                                                      () {},
                                                                  child: Text(
                                                                    " ${e.value.td} mmHg",
                                                                    style: blackTextStyle.copyWith(
                                                                        fontSize:
                                                                            4.sp),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
                            ),
                            child: TableDeskRow(
                              border: const BorderSide(
                                  width: 1, color: Colors.black),
                              gaps: [
                                TableGap.width(120),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Text(
                                        "NADI",
                                        style: blackTextStyle.copyWith(
                                            fontSize: 4.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 100.sp,
                                            width: Get.width,
                                            child: Scaffold(
                                              backgroundColor:
                                                  ThemeColor.whiteColor,
                                              body: LineChartSample2(
                                                spots: state.earlyWarningSystem
                                                    .asMap()
                                                    .entries
                                                    .map((e) {
                                                  return FlSpot(e.key + 1,
                                                      e.value.nadi.toDouble());
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                          Wrap(
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            children: state.earlyWarningSystem
                                                .asMap()
                                                .entries
                                                .map((e) => Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: SizedBox(
                                                        width: 50.sp,
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              height: 10.sp,
                                                              width: 10.sp,
                                                              child:
                                                                  FloatingActionButton(
                                                                elevation: 0,
                                                                backgroundColor:
                                                                    ThemeColor
                                                                        .darkGreyColor2
                                                                        .withOpacity(
                                                                            0.2),
                                                                onPressed:
                                                                    () {},
                                                                child: Text(
                                                                  "${e.key + 1}.",
                                                                  style: blackTextStyle
                                                                      .copyWith(
                                                                          fontSize:
                                                                              5.sp),
                                                                ),
                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  " ${tglIndo(e.value.waktu.substring(0, 10))}\n${e.value.waktu.substring(11, 19)}, ",
                                                                  style: blackTextStyle
                                                                      .copyWith(
                                                                          fontSize:
                                                                              4.sp),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                TextButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor: ThemeColor
                                                                            .primaryColor
                                                                            .withOpacity(
                                                                                0.3)),
                                                                    onPressed:
                                                                        () {},
                                                                    child: Text(
                                                                      "${e.value.nadi} x/menit",
                                                                      style: blackTextStyle.copyWith(
                                                                          fontSize:
                                                                              4.sp),
                                                                    ))
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
                            ),
                            child: TableDeskRow(
                              border: const BorderSide(
                                  width: 1, color: Colors.black),
                              gaps: [
                                TableGap.width(120),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Text(
                                        "PERNAPASAN",
                                        style: blackTextStyle.copyWith(
                                            fontSize: 4.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 100.sp,
                                            width: Get.width,
                                            child: Scaffold(
                                              backgroundColor:
                                                  ThemeColor.whiteColor,
                                              body: LineChartSample2(
                                                spots: state.earlyWarningSystem
                                                    .asMap()
                                                    .entries
                                                    .map((e) {
                                                  return FlSpot(
                                                      e.key + 1,
                                                      e.value.pernapasan
                                                          .toDouble());
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                          Wrap(
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            children: state.earlyWarningSystem
                                                .asMap()
                                                .entries
                                                .map((e) => Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: SizedBox(
                                                        width: 50.sp,
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              height: 10.sp,
                                                              width: 10.sp,
                                                              child:
                                                                  FloatingActionButton(
                                                                elevation: 0,
                                                                backgroundColor:
                                                                    ThemeColor
                                                                        .darkGreyColor2
                                                                        .withOpacity(
                                                                            0.2),
                                                                onPressed:
                                                                    () {},
                                                                child: Text(
                                                                  "${e.key + 1}.",
                                                                  style: blackTextStyle
                                                                      .copyWith(
                                                                          fontSize:
                                                                              5.sp),
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              " ${tglIndo(e.value.waktu.substring(0, 10))}\n${e.value.waktu.substring(11, 19)}, ${e.value.pernapasan}",
                                                              style: blackTextStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          4.sp),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
                            ),
                            child: TableDeskRow(
                              border: const BorderSide(
                                  width: 1, color: Colors.black),
                              gaps: [
                                TableGap.width(120),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Text(
                                        "REAKSI OTOT",
                                        style: blackTextStyle.copyWith(
                                            fontSize: 4.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 100.sp,
                                            width: Get.width,
                                            child: Scaffold(
                                              backgroundColor:
                                                  ThemeColor.whiteColor,
                                              body: LineChartSample2(
                                                spots: state.earlyWarningSystem
                                                    .asMap()
                                                    .entries
                                                    .map((e) {
                                                  return FlSpot(
                                                      e.key + 1,
                                                      (e.value.reaksiOtot ==
                                                              "Sedang")
                                                          ? 2
                                                          : (e.value.reaksiOtot ==
                                                                  "Ringan")
                                                              ? 1
                                                              : 3);
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                          Wrap(
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            children: state.earlyWarningSystem
                                                .asMap()
                                                .entries
                                                .map((e) => Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: SizedBox(
                                                        width: 50.sp,
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              height: 10.sp,
                                                              width: 10.sp,
                                                              child:
                                                                  FloatingActionButton(
                                                                elevation: 0,
                                                                backgroundColor:
                                                                    ThemeColor
                                                                        .darkGreyColor2
                                                                        .withOpacity(
                                                                            0.2),
                                                                onPressed:
                                                                    () {},
                                                                child: Text(
                                                                  "${e.key + 1}.",
                                                                  style: blackTextStyle
                                                                      .copyWith(
                                                                          fontSize:
                                                                              5.sp),
                                                                ),
                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "  ${tglIndo(e.value.waktu.substring(0, 10))}\n${e.value.waktu.substring(11, 19)},",
                                                                  style: blackTextStyle
                                                                      .copyWith(
                                                                          fontSize:
                                                                              4.sp),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                TextButton(
                                                                    style: (e.value.reaksiOtot ==
                                                                            "Berat")
                                                                        ? ElevatedButton.styleFrom(
                                                                            backgroundColor:
                                                                                ThemeColor.dangerColor.withOpacity(0.3))
                                                                        : (e.value.reaksiOtot == "Ringan")
                                                                            ? ElevatedButton.styleFrom(backgroundColor: ThemeColor.greenColor.withOpacity(0.3))
                                                                            : ElevatedButton.styleFrom(backgroundColor: ThemeColor.primaryColor.withOpacity(0.3)),
                                                                    onPressed: () {},
                                                                    child: Text(
                                                                      e.value
                                                                          .reaksiOtot,
                                                                      style: blackTextStyle.copyWith(
                                                                          fontSize:
                                                                              4.sp),
                                                                    ))
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
                            ),
                            child: TableDeskRow(
                              border: const BorderSide(
                                  width: 1, color: Colors.black),
                              gaps: [
                                TableGap.width(120),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Text(
                                        "SUHU",
                                        style: blackTextStyle.copyWith(
                                            fontSize: 4.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 100.sp,
                                            width: Get.width,
                                            child: Scaffold(
                                              backgroundColor:
                                                  ThemeColor.whiteColor,
                                              body: LineChartSample2(
                                                spots: state.earlyWarningSystem
                                                    .asMap()
                                                    .entries
                                                    .map((e) {
                                                  return FlSpot(
                                                      e.key + 1,
                                                      e.value.pernapasan
                                                          .toDouble());
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                          Wrap(
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            children: state.earlyWarningSystem
                                                .asMap()
                                                .entries
                                                .map((e) => Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: SizedBox(
                                                        width: 50.sp,
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              height: 10.sp,
                                                              width: 10.sp,
                                                              child:
                                                                  FloatingActionButton(
                                                                elevation: 0,
                                                                backgroundColor:
                                                                    ThemeColor
                                                                        .darkGreyColor2
                                                                        .withOpacity(
                                                                            0.2),
                                                                onPressed:
                                                                    () {},
                                                                child: Text(
                                                                  "${e.key + 1}.",
                                                                  style: blackTextStyle
                                                                      .copyWith(
                                                                          fontSize:
                                                                              5.sp),
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              " ${tglIndo(e.value.waktu.substring(0, 10))}\n${e.value.waktu.substring(11, 19)}, ${e.value.suhu}",
                                                              style: blackTextStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          4.sp),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
                            ),
                            child: TableDeskRow(
                              border: const BorderSide(
                                  width: 1, color: Colors.black),
                              gaps: [
                                TableGap.width(120),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Text(
                                        "SPO2",
                                        style: blackTextStyle.copyWith(
                                            fontSize: 4.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 100.sp,
                                            width: Get.width,
                                            child: Scaffold(
                                              backgroundColor:
                                                  ThemeColor.whiteColor,
                                              body: LineChartSample2(
                                                spots: state.earlyWarningSystem
                                                    .asMap()
                                                    .entries
                                                    .map((e) {
                                                  return FlSpot(
                                                      e.key + 1,
                                                      e.value.pernapasan
                                                          .toDouble());
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                          Wrap(
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            children: state.earlyWarningSystem
                                                .asMap()
                                                .entries
                                                .map((e) => Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: SizedBox(
                                                        width: 50.sp,
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              height: 10.sp,
                                                              width: 10.sp,
                                                              child:
                                                                  FloatingActionButton(
                                                                elevation: 0,
                                                                backgroundColor:
                                                                    ThemeColor
                                                                        .darkGreyColor2
                                                                        .withOpacity(
                                                                            0.2),
                                                                onPressed:
                                                                    () {},
                                                                child: Text(
                                                                  "${e.key + 1}.",
                                                                  style: blackTextStyle
                                                                      .copyWith(
                                                                          fontSize:
                                                                              5.sp),
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              " ${tglIndo(e.value.waktu.substring(0, 10))}\n${e.value.waktu.substring(11, 19)}, ${e.value.spo2}",
                                                              style: blackTextStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          4.sp),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
                            ),
                            child: TableDeskRow(
                              border: const BorderSide(
                                  width: 1, color: Colors.black),
                              gaps: [
                                TableGap.width(120),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Text(
                                        "CRT",
                                        style: blackTextStyle.copyWith(
                                            fontSize: 4.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 100.sp,
                                            width: Get.width,
                                            child: Scaffold(
                                              backgroundColor:
                                                  ThemeColor.whiteColor,
                                              body: LineChartSample2(
                                                spots: state.earlyWarningSystem
                                                    .asMap()
                                                    .entries
                                                    .map((e) {
                                                  return FlSpot(e.key + 1,
                                                      e.value.crt.toDouble());
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                          Wrap(
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            children: state.earlyWarningSystem
                                                .asMap()
                                                .entries
                                                .map((e) => Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: SizedBox(
                                                        width: 50.sp,
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              height: 10.sp,
                                                              width: 10.sp,
                                                              child:
                                                                  FloatingActionButton(
                                                                elevation: 0,
                                                                backgroundColor:
                                                                    ThemeColor
                                                                        .darkGreyColor2
                                                                        .withOpacity(
                                                                            0.2),
                                                                onPressed:
                                                                    () {},
                                                                child: Text(
                                                                  "${e.key + 1}.",
                                                                  style: blackTextStyle
                                                                      .copyWith(
                                                                          fontSize:
                                                                              5.sp),
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              " ${tglIndo(e.value.waktu.substring(0, 10))}\n${e.value.waktu.substring(11, 19)}, ${e.value.crt}",
                                                              style: blackTextStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          4.sp),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
                            ),
                            child: TableDeskRow(
                              border: const BorderSide(
                                  width: 1, color: Colors.black),
                              gaps: [
                                TableGap.width(120),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Text(
                                        "SKALA NYERI",
                                        style: blackTextStyle.copyWith(
                                            fontSize: 4.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 100.sp,
                                            width: Get.width,
                                            child: Scaffold(
                                              backgroundColor:
                                                  ThemeColor.whiteColor,
                                              body: LineChartSample2(
                                                spots: state.earlyWarningSystem
                                                    .asMap()
                                                    .entries
                                                    .map((e) {
                                                  return FlSpot(
                                                      e.key + 1,
                                                      e.value.skalaNyeri
                                                          .toDouble());
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                          Wrap(
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            children: state.earlyWarningSystem
                                                .asMap()
                                                .entries
                                                .map((e) => Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: SizedBox(
                                                        width: 50.sp,
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              height: 10.sp,
                                                              width: 10.sp,
                                                              child:
                                                                  FloatingActionButton(
                                                                elevation: 0,
                                                                backgroundColor:
                                                                    ThemeColor
                                                                        .darkGreyColor2
                                                                        .withOpacity(
                                                                            0.2),
                                                                onPressed:
                                                                    () {},
                                                                child: Text(
                                                                  "${e.key + 1}.",
                                                                  style: blackTextStyle
                                                                      .copyWith(
                                                                          fontSize:
                                                                              5.sp),
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              " ${tglIndo(e.value.waktu.substring(0, 10))}\n${e.value.waktu.substring(11, 19)}, ${e.value.skalaNyeri}",
                                                              style: blackTextStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          4.sp),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
                            ),
                            child: TableDeskRow(
                              border: const BorderSide(
                                  width: 1, color: Colors.black),
                              gaps: [
                                TableGap.width(120),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Text(
                                        "PETUGAS",
                                        style: blackTextStyle.copyWith(
                                            fontSize: 4.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Wrap(
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            children: state.earlyWarningSystem
                                                .asMap()
                                                .entries
                                                .map((e) => Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: SizedBox(
                                                        width: 50.sp,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              height: 10.sp,
                                                              width: 10.sp,
                                                              child:
                                                                  FloatingActionButton(
                                                                elevation: 0,
                                                                backgroundColor:
                                                                    ThemeColor
                                                                        .darkGreyColor2
                                                                        .withOpacity(
                                                                            0.2),
                                                                onPressed:
                                                                    () {},
                                                                child: Text(
                                                                  "${e.key + 1}.",
                                                                  style: blackTextStyle
                                                                      .copyWith(
                                                                          fontSize:
                                                                              5.sp),
                                                                ),
                                                              ),
                                                            ),
                                                            Column(
                                                              children: [
                                                                Text(
                                                                  " ${tglIndo(e.value.waktu.substring(0, 10))}\n${e.value.waktu.substring(11, 19)},",
                                                                  style: blackTextStyle
                                                                      .copyWith(
                                                                          fontSize:
                                                                              4.sp),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                SizedBox(
                                                                  height: 20.sp,
                                                                  width: 20.sp,
                                                                  child: BarcodeGreenWidget(
                                                                      dataBarcode: e
                                                                          .value
                                                                          .karyawan
                                                                          .nama),
                                                                ),
                                                                Text(
                                                                  e
                                                                      .value
                                                                      .karyawan
                                                                      .nama,
                                                                  style: blackTextStyle
                                                                      .copyWith(
                                                                          fontSize:
                                                                              4.sp),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.sp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Container titleText({required String title, required String subTitle}) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: TableDesk(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 1),
        ),
        child: TableDeskRow(
          border: const BorderSide(width: 1, color: Colors.white),
          gaps: [
            TableGap.width(150),
            TableGap.width(10),
            TableGap.weight(),
          ],
          children: [
            Container(
                color: Colors.white,
                child: Text(
                  title,
                  style: blackTextStyle.copyWith(fontSize: 5.sp),
                )),
            Container(
              color: Colors.white,
              child: Text(
                ":",
                style: blackTextStyle.copyWith(fontSize: 5.sp),
              ),
            ),
            Container(
              color: Colors.white,
              child: Text(
                subTitle,
                style: blackTextStyle.copyWith(fontSize: 5.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
