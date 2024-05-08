import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/kebidanan/bloc/eary_warning_system/early_warning_system_bloc.dart';
import 'package:hms_app/presentation/kebidanan/presentation/chart/line/line_chart_sample2.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class EwsSystemPageWidget extends StatefulWidget {
  const EwsSystemPageWidget({super.key});

  @override
  State<EwsSystemPageWidget> createState() => _EwsSystemPageWidgetState();
}

class _EwsSystemPageWidgetState extends State<EwsSystemPageWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EarlyWarningSystemBloc, EarlyWarningSystemState>(
      builder: (context, state) {
        if (state.status == EarlyWarningSystemStatus.isLoadingGetData) {
          return HeaderContentWidget(widget: Loading.expandedLoading());
        }
        return HeaderContentWidget(
            backgroundColor: ThemeColor.bgColor,
            onPressed: () {},
            isENableAdd: false,
            title: "Tambah",
            widget: RawScrollbar(
              thumbColor: ThemeColor.darkColor,
              thumbVisibility: true,
              interactive: true,
              thickness: 5.sp,
              controller: _scrollController,
              trackVisibility: false,
              radius: Radius.circular(5.sp),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Container(
                  padding: EdgeInsets.all(5.sp),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150.sp,
                        width: Get.width,
                        child: Scaffold(
                          backgroundColor: ThemeColor.darkColor,
                          appBar: AppBar(
                            automaticallyImplyLeading: false,
                            backgroundColor: ThemeColor.primaryColor,
                            title: Text(
                              "NADI",
                              style: whiteCalibriTextStyle,
                            ),
                          ),
                          body: LineChartSample2(
                            spots: state.earlyWarningSystem
                                .asMap()
                                .entries
                                .map((e) {
                              return FlSpot(e.key + 1, e.value.nadi.toDouble());
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 150.sp,
                        width: Get.width,
                        child: Scaffold(
                          backgroundColor: ThemeColor.darkColor,
                          appBar: AppBar(
                            automaticallyImplyLeading: false,
                            backgroundColor: ThemeColor.primaryColor,
                            title: Text(
                              "TEKANAN DARAH (SYSTOLIK)",
                              style: whiteCalibriTextStyle,
                            ),
                          ),
                          body: LineChartSample2(
                            spots: state.earlyWarningSystem
                                .asMap()
                                .entries
                                .map((e) {
                              return FlSpot(e.key + 1, e.value.td.toDouble());
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 150.sp,
                          width: Get.width,
                          child: Scaffold(
                            backgroundColor: ThemeColor.darkColor,
                            appBar: AppBar(
                              automaticallyImplyLeading: false,
                              backgroundColor: ThemeColor.primaryColor,
                              title: Text(
                                "PERNAPASAN",
                                style: whiteCalibriTextStyle,
                              ),
                            ),
                            body: LineChartSample2(
                              spots: state.earlyWarningSystem
                                  .asMap()
                                  .entries
                                  .map((e) {
                                return FlSpot(
                                    e.key + 1, e.value.pernapasan.toDouble());
                              }).toList(),
                            ),
                          )),
                      SizedBox(
                          height: 80.sp,
                          width: Get.width,
                          child: Scaffold(
                            backgroundColor: ThemeColor.darkColor,
                            appBar: AppBar(
                              automaticallyImplyLeading: false,
                              backgroundColor: ThemeColor.primaryColor,
                              title: Text(
                                "REAKSI OTOT",
                                style: whiteCalibriTextStyle,
                              ),
                            ),
                            body: Wrap(
                              alignment: WrapAlignment.spaceAround,
                              runSpacing: 2.sp,
                              runAlignment: WrapAlignment.spaceAround,
                              spacing: 2.sp,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: state.earlyWarningSystem
                                  .map((e) => Container(
                                        padding: const EdgeInsets.all(2),
                                        width: 65.sp,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.sp)),
                                              backgroundColor: ThemeColor
                                                  .primaryColor
                                                  .withOpacity(0.2)),
                                          onPressed: () {},
                                          child: Text(
                                            "Tgl : ${tglIndo(e.waktu.substring(0, 10))},\nJam : ${e.waktu.substring(11, 19)}  - ${e.reaksiOtot}",
                                            style: whiteTextStyle.copyWith(
                                                fontSize: 4.sp),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          )),
                      SizedBox(
                        height: 150.sp,
                        width: Get.width,
                        child: Scaffold(
                          backgroundColor: ThemeColor.darkColor,
                          appBar: AppBar(
                            automaticallyImplyLeading: false,
                            backgroundColor: ThemeColor.primaryColor,
                            title: Text(
                              "SUHU",
                              style: whiteCalibriTextStyle,
                            ),
                          ),
                          body: LineChartSample2(
                            spots: state.earlyWarningSystem
                                .asMap()
                                .entries
                                .map((e) {
                              return FlSpot(e.key + 1, e.value.suhu.toDouble());
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 150.sp,
                        width: Get.width,
                        child: Scaffold(
                          backgroundColor: ThemeColor.darkColor,
                          appBar: AppBar(
                            automaticallyImplyLeading: false,
                            backgroundColor: ThemeColor.primaryColor,
                            title: Text(
                              "SPO2",
                              style: whiteCalibriTextStyle,
                            ),
                          ),
                          body: LineChartSample2(
                            spots: state.earlyWarningSystem
                                .asMap()
                                .entries
                                .map((e) {
                              return FlSpot(e.key + 1, e.value.spo2.toDouble());
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 150.sp,
                        width: Get.width,
                        child: Scaffold(
                          backgroundColor: ThemeColor.darkColor,
                          appBar: AppBar(
                            automaticallyImplyLeading: false,
                            backgroundColor: ThemeColor.primaryColor,
                            title: Text(
                              "CRT",
                              style: whiteCalibriTextStyle,
                            ),
                          ),
                          body: LineChartSample2(
                            spots: state.earlyWarningSystem
                                .asMap()
                                .entries
                                .map((e) {
                              return FlSpot(e.key + 1, e.value.crt.toDouble());
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 150.sp,
                        width: Get.width,
                        child: Scaffold(
                          backgroundColor: ThemeColor.darkColor,
                          appBar: AppBar(
                            automaticallyImplyLeading: false,
                            backgroundColor: ThemeColor.primaryColor,
                            title: Text(
                              "SKALA NYERI",
                              style: whiteCalibriTextStyle,
                            ),
                          ),
                          body: LineChartSample2(
                            spots: state.earlyWarningSystem
                                .asMap()
                                .entries
                                .map((e) {
                              return FlSpot(
                                  e.key + 1, e.value.skalaNyeri.toDouble());
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}
