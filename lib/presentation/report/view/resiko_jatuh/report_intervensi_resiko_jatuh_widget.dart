import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/qr_code/custom_qr_widget.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:hms_app/presentation/report/component/header_with_nomor_rm_widget.dart';
import 'package:hms_app/presentation/report/repository/intervensi_resiko_jatuh_response_model.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/presentation/report/bloc/resiko_jatuh/resiko_jatuh_bloc.dart';
import 'package:table_desk/table_desk.dart';

class ReportIntervensiResikoJatuhWidget extends StatefulWidget {
  const ReportIntervensiResikoJatuhWidget({super.key});

  @override
  State<ReportIntervensiResikoJatuhWidget> createState() =>
      _ReportIntervensiResikoJatuhWidgetState();
}

class _ReportIntervensiResikoJatuhWidgetState
    extends State<ReportIntervensiResikoJatuhWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResikoJatuhReportBloc, ResikoReportJatuhState>(
      builder: (context, state) {
        log("STATE STATE");
        log(state.status.toString());
        log(state.reportIntervensiResikoModel.toString());

        if (state.status == ReportResikoJatuhStatus.isLoadingIntervensi) {
          return Scaffold(
            backgroundColor: ThemeColor.transparentColor,
            body: Loading.circleLoading(),
          );
        }

        if (state.status == ReportResikoJatuhStatus.loadedIntervensi) {
          if (state.reportIntervensiResikoModel != null) {
            // LAKUKAN FILTER
            Iterable<ResikoJatuhReport> sore = state
                .reportIntervensiResikoModel!.resikoJatuh
                .where((element) => element.shift == "Sore");
            Iterable<ResikoJatuhReport> malam = state
                .reportIntervensiResikoModel!.resikoJatuh
                .where((element) => element.shift == "Malam");
            Iterable<ResikoJatuhReport> pagi = state
                .reportIntervensiResikoModel!.resikoJatuh
                .where((element) => element.shift == "Pagi");

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
                  child: ListView(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 5.sp),
                          child: Text("RM. RI 38",
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
                            // TAMPILKAN DATA // TAMPILKAN HEADER
                            Padding(
                              padding: EdgeInsets.all(8.sp),
                              child: const HeaderAllWidget(),
                            ),

                            // const HeaderWithNomorRMWidget(),
                            const Divider(),
                            Center(
                              child: Text(
                                "INTERVENSI RISIKO JATUH PASIEN DEWASA ( Morse )",
                                textAlign: TextAlign.center,
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8.sp),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Beri tanda (✓) pada tindakan yang dilaksanakan",
                                style: blackTextStyle,
                              ),
                            ),

                            SizedBox(height: 15.sp),

                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: TableDesk(
                                shape: const RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: Colors.black, width: 1),
                                ),
                                child: TableDeskRow(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
                                  gaps: [
                                    TableGap.width(150),
                                    TableGap.weight(),
                                    TableGap.weight(),
                                  ],
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "No.",
                                          style: blackTextStyle.copyWith(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "INTERVENSI",
                                          style: blackTextStyle.copyWith(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    TableDeskColumn(
                                      border: const BorderSide(
                                          width: 1, color: Colors.black),
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              "TANGGAL / SIHIF",
                                              style: blackTextStyle.copyWith(
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          color: Colors.white,
                                          child: TableDeskRow(
                                            border: const BorderSide(
                                                width: 1, color: Colors.black),
                                            gaps: [
                                              TableGap.weight(),
                                            ],
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: (pagi.isNotEmpty)
                                                    ? Text(
                                                        "TANGGAL, ${tglIndo(pagi.first.insertDttm.substring(0, 10))}",
                                                        style: blackTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                        textAlign:
                                                            TextAlign.center,
                                                      )
                                                    : Text(
                                                        "TANGGAL ",
                                                        style: blackTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
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
                                  side:
                                      BorderSide(color: Colors.black, width: 1),
                                ),
                                child: TableDeskRow(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
                                  gaps: [
                                    TableGap.width(150),
                                    TableGap.weight(),
                                    TableGap.weight(),
                                  ],
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "",
                                          style: blackTextStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.blueAccent,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "Resiko Rendah",
                                          style: whiteTextStyle.copyWith(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    TableDeskColumn(
                                      border: const BorderSide(
                                          width: 1, color: Colors.black),
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          child: TableDeskRow(
                                            border: const BorderSide(
                                                width: 1, color: Colors.black),
                                            gaps: [
                                              TableGap.weight(),
                                              TableGap.weight(),
                                              TableGap.weight(),
                                            ],
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "PAGI",
                                                  style: blackTextStyle,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Text(
                                                  "SORE",
                                                  textAlign: TextAlign.left,
                                                  style: blackTextStyle,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Text(
                                                  "MALAM",
                                                  textAlign: TextAlign.left,
                                                  style: blackTextStyle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // ===  TANGGAL === //

                            ...resikoRendah.asMap().entries.map((e) {
                              return Container(
                                color: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 5.sp),
                                child: TableDesk(
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black, width: 1),
                                  ),
                                  child: TableDeskRow(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    gaps: [
                                      TableGap.width(150),
                                      TableGap.weight(),
                                      TableGap.weight(),
                                    ],
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            (e.key + 1).toString(),
                                            style: blackTextStyle,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            e.value.toString(),
                                            style: blackTextStyle.copyWith(),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      TableDeskColumn(
                                        border: const BorderSide(
                                            width: 1, color: Colors.black),
                                        children: [
                                          Container(
                                            color: Colors.white,
                                            child: TableDeskRow(
                                              border: const BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                              gaps: [
                                                TableGap.width(200),
                                                TableGap.weight(),
                                                TableGap.weight(),
                                              ],
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Center(
                                                    child: Text(
                                                      toChecklist(
                                                          pagi: pagi,
                                                          index: e.key + 1),
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Center(
                                                    child: Text(
                                                      toChecklist(
                                                          pagi: sore,
                                                          index: e.key + 1),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Text(
                                                    toChecklist(
                                                        pagi: malam,
                                                        index: e.key + 1),
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),

                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: TableDesk(
                                shape: const RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: Colors.black, width: 1),
                                ),
                                child: TableDeskRow(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
                                  gaps: [
                                    TableGap.width(150),
                                    TableGap.weight(),
                                    TableGap.weight(),
                                  ],
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "",
                                          style: blackTextStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.deepOrangeAccent,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "Resiko Sedang dan tinggi",
                                          style: whiteTextStyle.copyWith(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    TableDeskColumn(
                                      border: const BorderSide(
                                          width: 1, color: Colors.black),
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          child: TableDeskRow(
                                            border: const BorderSide(
                                                width: 1, color: Colors.black),
                                            gaps: [
                                              TableGap.width(200),
                                              TableGap.weight(),
                                              TableGap.weight(),
                                            ],
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "",
                                                  style: blackTextStyle,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Text(
                                                  "",
                                                  textAlign: TextAlign.left,
                                                  style: blackTextStyle,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Text(
                                                  "",
                                                  textAlign: TextAlign.left,
                                                  style: blackTextStyle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            ...resikoSedangTinggi.asMap().entries.map((e) {
                              return Container(
                                color: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 5.sp),
                                child: TableDesk(
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black, width: 1),
                                  ),
                                  child: TableDeskRow(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    gaps: [
                                      TableGap.width(150),
                                      TableGap.weight(),
                                      TableGap.weight(),
                                    ],
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            (e.key + 8).toString(),
                                            style: blackTextStyle,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            e.value.toString(),
                                            style: blackTextStyle.copyWith(),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      TableDeskColumn(
                                        border: const BorderSide(
                                            width: 1, color: Colors.black),
                                        children: [
                                          Container(
                                            color: Colors.white,
                                            child: TableDeskRow(
                                              border: const BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                              gaps: [
                                                TableGap.width(200),
                                                TableGap.weight(),
                                                TableGap.weight(),
                                              ],
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Center(
                                                    child: Text(
                                                      toChecklist(
                                                          pagi: pagi,
                                                          index: e.key + 7),
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Text(
                                                    toChecklist(
                                                        pagi: sore,
                                                        index: e.key + 7),
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Text(
                                                    toChecklist(
                                                        pagi: malam,
                                                        index: e.key + 7),
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),

                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: TableDesk(
                                shape: const RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: Colors.black, width: 1),
                                ),
                                child: TableDeskRow(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
                                  gaps: [
                                    TableGap.width(150),
                                    TableGap.weight(),
                                    TableGap.weight(),
                                  ],
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "",
                                          style: blackTextStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "Nama Perawat",
                                          style: blackTextStyle.copyWith(),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ),
                                    TableDeskColumn(
                                      border: const BorderSide(
                                          width: 1, color: Colors.black),
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          child: TableDeskRow(
                                            border: const BorderSide(
                                                width: 1, color: Colors.black),
                                            gaps: [
                                              TableGap.width(200),
                                              TableGap.weight(),
                                              TableGap.weight(),
                                            ],
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  (pagi.isNotEmpty)
                                                      ? pagi.first.namaPerawat
                                                      : "",
                                                  textAlign: TextAlign.center,
                                                  style: blackTextStyle
                                                      .copyWith(fontSize: 5.sp),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Text(
                                                  (sore.isNotEmpty)
                                                      ? sore.first.namaPerawat
                                                      : "",
                                                  textAlign: TextAlign.center,
                                                  style: blackTextStyle
                                                      .copyWith(fontSize: 5.sp),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Text(
                                                  (malam.isNotEmpty)
                                                      ? malam.first.namaPerawat
                                                      : "",
                                                  textAlign: TextAlign.center,
                                                  style: blackTextStyle
                                                      .copyWith(fontSize: 5.sp),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
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
                                  side:
                                      BorderSide(color: Colors.black, width: 1),
                                ),
                                child: TableDeskRow(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
                                  gaps: [
                                    TableGap.width(150),
                                    TableGap.weight(),
                                    TableGap.weight(),
                                  ],
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "",
                                          style: blackTextStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "Paraf",
                                          style: blackTextStyle.copyWith(),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ),
                                    TableDeskColumn(
                                      border: const BorderSide(
                                          width: 1, color: Colors.black),
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          child: TableDeskRow(
                                            border: const BorderSide(
                                                width: 1, color: Colors.black),
                                            gaps: [
                                              TableGap.weight(),
                                              TableGap.weight(),
                                              TableGap.weight(),
                                            ],
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  height: 100,
                                                  width: 100,
                                                  child: (pagi.isNotEmpty)
                                                      ? CustomQrWidget(
                                                          dimension: 30.sp,
                                                          dataBarcode: pagi
                                                              .first
                                                              .namaPerawat,
                                                        )
                                                      : const SizedBox(),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  height: 100,
                                                  width: 100,
                                                  child: (sore.isNotEmpty)
                                                      ? CustomQrWidget(
                                                          dimension: 30.sp,
                                                          dataBarcode: sore
                                                              .first
                                                              .namaPerawat,
                                                        )
                                                      : const SizedBox(),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  height: 100,
                                                  width: 100,
                                                  child: (malam.isNotEmpty)
                                                      ? CustomQrWidget(
                                                          dimension: 30.sp,
                                                          dataBarcode: malam
                                                              .first
                                                              .namaPerawat,
                                                        )
                                                      : const SizedBox(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
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
          }

          if (state.reportIntervensiResikoModel == null) {
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
                  child: ListView(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 5.sp),
                          child: Text("RM. RI 38",
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
                            // TAMPILKAN DATA
                            // TAMPILKAN HEADER
                            Padding(
                              padding: EdgeInsets.all(8.sp),
                              child: const HeaderAllWidget(),
                            ),
                            // const HeaderWithNomorRMWidget(),
                            const Divider(),
                            Center(
                              child: Text(
                                "INTERVENSI RISIKO JATUH PASIEN DEWASA ( Morse )",
                                textAlign: TextAlign.center,
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8.sp),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Beri tanda (✓) pada tindakan yang dilaksanakan",
                                style: blackTextStyle,
                              ),
                            ),

                            SizedBox(
                              height: 15.sp,
                            ),

                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: TableDesk(
                                shape: const RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: Colors.black, width: 1),
                                ),
                                child: TableDeskRow(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
                                  gaps: [
                                    TableGap.width(150),
                                    TableGap.weight(),
                                    TableGap.weight(),
                                  ],
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "No.",
                                          style: blackTextStyle.copyWith(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "INTERVENSI",
                                          style: blackTextStyle.copyWith(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    TableDeskColumn(
                                      border: const BorderSide(
                                          width: 1, color: Colors.black),
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              "TANGGAL / SIHIF",
                                              style: blackTextStyle.copyWith(
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          color: Colors.white,
                                          child: TableDeskRow(
                                            border: const BorderSide(
                                                width: 1, color: Colors.black),
                                            gaps: [
                                              TableGap.weight(),
                                            ],
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "TANGGAL ",
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
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
                                  side:
                                      BorderSide(color: Colors.black, width: 1),
                                ),
                                child: TableDeskRow(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
                                  gaps: [
                                    TableGap.weight(),
                                    TableGap.weight(),
                                    TableGap.weight(),
                                  ],
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "",
                                          style: blackTextStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.blueAccent,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "Resiko Rendah",
                                          style: whiteTextStyle.copyWith(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    TableDeskColumn(
                                      border: const BorderSide(
                                          width: 1, color: Colors.black),
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          child: TableDeskRow(
                                            border: const BorderSide(
                                                width: 1, color: Colors.black),
                                            gaps: [
                                              TableGap.weight(),
                                              TableGap.weight(),
                                              TableGap.weight(),
                                            ],
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "PAGI",
                                                  style: blackTextStyle,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Text(
                                                  "SORE",
                                                  textAlign: TextAlign.left,
                                                  style: blackTextStyle,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Text(
                                                  "MALAM",
                                                  textAlign: TextAlign.left,
                                                  style: blackTextStyle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // ===  TANGGAL === //

                            ...resikoRendah.asMap().entries.map((e) {
                              return Container(
                                color: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 5.sp),
                                child: TableDesk(
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black, width: 1),
                                  ),
                                  child: TableDeskRow(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    gaps: [
                                      TableGap.width(150),
                                      TableGap.weight(),
                                      TableGap.weight(),
                                    ],
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            (e.key + 1).toString(),
                                            style: blackTextStyle,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            e.value.toString(),
                                            style: blackTextStyle.copyWith(),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      TableDeskColumn(
                                        border: const BorderSide(
                                            width: 1, color: Colors.black),
                                        children: [
                                          Container(
                                            color: Colors.white,
                                            child: TableDeskRow(
                                              border: const BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                              gaps: [
                                                TableGap.weight(),
                                                TableGap.weight(),
                                                TableGap.weight(),
                                              ],
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "✓",
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Text(
                                                    "",
                                                    textAlign: TextAlign.left,
                                                    style: blackTextStyle,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Text(
                                                    "",
                                                    textAlign: TextAlign.left,
                                                    style: blackTextStyle,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),

                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: TableDesk(
                                shape: const RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: Colors.black, width: 1),
                                ),
                                child: TableDeskRow(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
                                  gaps: [
                                    TableGap.weight(),
                                    TableGap.weight(),
                                    TableGap.weight(),
                                  ],
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "",
                                          style: blackTextStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.deepOrangeAccent,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "Resiko Sedang dan tinggi",
                                          style: whiteTextStyle.copyWith(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    TableDeskColumn(
                                      border: const BorderSide(
                                          width: 1, color: Colors.black),
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          child: TableDeskRow(
                                            border: const BorderSide(
                                                width: 1, color: Colors.black),
                                            gaps: [
                                              TableGap.width(200),
                                              TableGap.weight(),
                                              TableGap.weight(),
                                            ],
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "",
                                                  style: blackTextStyle,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Text(
                                                  "",
                                                  textAlign: TextAlign.left,
                                                  style: blackTextStyle,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Text(
                                                  "",
                                                  textAlign: TextAlign.left,
                                                  style: blackTextStyle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            ...resikoSedangTinggi.asMap().entries.map((e) {
                              return Container(
                                color: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 5.sp),
                                child: TableDesk(
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black, width: 1),
                                  ),
                                  child: TableDeskRow(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    gaps: [
                                      TableGap.width(150),
                                      TableGap.weight(),
                                      TableGap.weight(),
                                    ],
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            (e.key + 8).toString(),
                                            style: blackTextStyle,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            e.value.toString(),
                                            style: blackTextStyle.copyWith(),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      TableDeskColumn(
                                        border: const BorderSide(
                                            width: 1, color: Colors.black),
                                        children: [
                                          Container(
                                            color: Colors.white,
                                            child: TableDeskRow(
                                              border: const BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                              gaps: [
                                                TableGap.width(200),
                                                TableGap.weight(),
                                                TableGap.weight(),
                                              ],
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "",
                                                    style: blackTextStyle,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Text(
                                                    "",
                                                    textAlign: TextAlign.left,
                                                    style: blackTextStyle,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Text(
                                                    "",
                                                    textAlign: TextAlign.left,
                                                    style: blackTextStyle,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),

                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: TableDesk(
                                shape: const RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: Colors.black, width: 1),
                                ),
                                child: TableDeskRow(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
                                  gaps: [
                                    TableGap.weight(),
                                    TableGap.weight(),
                                    TableGap.weight(),
                                  ],
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "",
                                          style: blackTextStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "Nama Perawat",
                                          style: blackTextStyle.copyWith(),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ),
                                    TableDeskColumn(
                                      border: const BorderSide(
                                          width: 1, color: Colors.black),
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          child: TableDeskRow(
                                            border: const BorderSide(
                                                width: 1, color: Colors.black),
                                            gaps: [
                                              TableGap.width(200),
                                              TableGap.weight(),
                                              TableGap.weight(),
                                            ],
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "",
                                                  style: blackTextStyle,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Text(
                                                  "",
                                                  textAlign: TextAlign.left,
                                                  style: blackTextStyle,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Text(
                                                  "",
                                                  textAlign: TextAlign.left,
                                                  style: blackTextStyle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
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
                                  side:
                                      BorderSide(color: Colors.black, width: 1),
                                ),
                                child: TableDeskRow(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
                                  gaps: [
                                    TableGap.weight(),
                                    TableGap.weight(),
                                    TableGap.weight(),
                                  ],
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "",
                                          style: blackTextStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "Paraf",
                                          style: blackTextStyle.copyWith(),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ),
                                    TableDeskColumn(
                                      border: const BorderSide(
                                          width: 1, color: Colors.black),
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          child: TableDeskRow(
                                            border: const BorderSide(
                                                width: 1, color: Colors.black),
                                            gaps: [
                                              TableGap.width(200),
                                              TableGap.weight(),
                                              TableGap.weight(),
                                            ],
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "",
                                                  style: blackTextStyle,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Text(
                                                  "",
                                                  textAlign: TextAlign.left,
                                                  style: blackTextStyle,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Text(
                                                  "",
                                                  textAlign: TextAlign.left,
                                                  style: blackTextStyle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
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
          }
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
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 5.sp),
                      child: Text("RM. RI 38",
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
                        // TAMPILKAN DATA                      // TAMPILKAN HEADER
                        const HeaderWithNomorRMWidget(),
                        const Divider(),
                        Center(
                          child: Text(
                            "INTERVENSI RISIKO JATUH PASIEN DEWASA ( Morse )",
                            textAlign: TextAlign.center,
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 8.sp),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Beri tanda (✓) pada tindakan yang dilaksanakan",
                            style: blackTextStyle,
                          ),
                        ),

                        SizedBox(
                          height: 15.sp,
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
                                TableGap.width(150),
                                TableGap.weight(),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "No.",
                                      style: blackTextStyle.copyWith(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "INTERVENSI",
                                      style: blackTextStyle.copyWith(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                TableDeskColumn(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "TANGGAL / SIHIF",
                                          style: blackTextStyle.copyWith(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: TableDeskRow(
                                        border: const BorderSide(
                                            width: 1, color: Colors.black),
                                        gaps: [
                                          // TableGap.width(200),
                                          TableGap.weight(),
                                          // TableGap.weight(),
                                        ],
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "TANGGAL",
                                              style: blackTextStyle.copyWith(
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
                                TableGap.width(150),
                                TableGap.weight(),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "",
                                      style: blackTextStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.blueAccent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "Resiko Rendah",
                                      style: whiteTextStyle.copyWith(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                TableDeskColumn(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: TableDeskRow(
                                        border: const BorderSide(
                                            width: 1, color: Colors.black),
                                        gaps: [
                                          TableGap.width(200),
                                          TableGap.weight(),
                                          TableGap.weight(),
                                        ],
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "PAGI",
                                              style: blackTextStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              "SORE",
                                              textAlign: TextAlign.left,
                                              style: blackTextStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              "MALAM",
                                              textAlign: TextAlign.left,
                                              style: blackTextStyle,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        // ===  TANGGAL === //

                        ...resikoRendah.asMap().entries.map((e) {
                          return Container(
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
                                  TableGap.width(150),
                                  TableGap.weight(),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        (e.key + 1).toString(),
                                        style: blackTextStyle,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        e.value.toString(),
                                        style: blackTextStyle.copyWith(),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  TableDeskColumn(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: TableDeskRow(
                                          border: const BorderSide(
                                              width: 1, color: Colors.black),
                                          gaps: [
                                            TableGap.width(200),
                                            TableGap.weight(),
                                            TableGap.weight(),
                                          ],
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "",
                                                style: blackTextStyle,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                "",
                                                textAlign: TextAlign.left,
                                                style: blackTextStyle,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                "",
                                                textAlign: TextAlign.left,
                                                style: blackTextStyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),

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
                                TableGap.width(150),
                                TableGap.weight(),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "",
                                      style: blackTextStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.deepOrangeAccent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "Resiko Sedang dan tinggi",
                                      style: whiteTextStyle.copyWith(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                TableDeskColumn(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: TableDeskRow(
                                        border: const BorderSide(
                                            width: 1, color: Colors.black),
                                        gaps: [
                                          TableGap.width(200),
                                          TableGap.weight(),
                                          TableGap.weight(),
                                        ],
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "",
                                              style: blackTextStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              "",
                                              textAlign: TextAlign.left,
                                              style: blackTextStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              "",
                                              textAlign: TextAlign.left,
                                              style: blackTextStyle,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        ...resikoSedangTinggi.asMap().entries.map((e) {
                          return Container(
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
                                  TableGap.width(150),
                                  TableGap.weight(),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        (e.key + 8).toString(),
                                        style: blackTextStyle,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        e.value.toString(),
                                        style: blackTextStyle.copyWith(),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  TableDeskColumn(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: TableDeskRow(
                                          border: const BorderSide(
                                              width: 1, color: Colors.black),
                                          gaps: [
                                            TableGap.width(200),
                                            TableGap.weight(),
                                            TableGap.weight(),
                                          ],
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "",
                                                style: blackTextStyle,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                "",
                                                textAlign: TextAlign.left,
                                                style: blackTextStyle,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                "",
                                                textAlign: TextAlign.left,
                                                style: blackTextStyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),

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
                                TableGap.width(150),
                                TableGap.weight(),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "",
                                      style: blackTextStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "Nama Perawat",
                                      style: blackTextStyle.copyWith(),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                                TableDeskColumn(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: TableDeskRow(
                                        border: const BorderSide(
                                            width: 1, color: Colors.black),
                                        gaps: [
                                          TableGap.width(200),
                                          TableGap.weight(),
                                          TableGap.weight(),
                                        ],
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "",
                                              style: blackTextStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              "",
                                              textAlign: TextAlign.left,
                                              style: blackTextStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              "",
                                              textAlign: TextAlign.left,
                                              style: blackTextStyle,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
                                TableGap.width(150),
                                TableGap.weight(),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "",
                                      style: blackTextStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "Paraf",
                                      style: blackTextStyle.copyWith(),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                                TableDeskColumn(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: TableDeskRow(
                                        border: const BorderSide(
                                            width: 1, color: Colors.black),
                                        gaps: [
                                          TableGap.width(200),
                                          TableGap.weight(),
                                          TableGap.weight(),
                                        ],
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "",
                                              style: blackTextStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              "",
                                              textAlign: TextAlign.left,
                                              style: blackTextStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              "",
                                              textAlign: TextAlign.left,
                                              style: blackTextStyle,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
}

List<String> resikoRendah = [
  "Pastikan bel, peralatan pribadi mudah dijangkau",
  "Pastikan posisi tempat tidur pada poisisi terendah dan terkunci",
  "Pasang pagar  tempat tidur /Brakard",
  "Orientasi pasien / penunggu tentang lingkungan/ruang sekitar",
  "Pasang busa penyanggah pagar tempat tidur pada pasien anak-anak",
  "Anjurkan pasien menggunakan alas kaki anti selip/tidak licin",
  "Edukasi pasien toileting dan edukasi perilaku pencegahan jatuh",
];
List<String> resikoSedangTinggi = [
  "Pasang tanda resiko jatuh (tempel striker kuning) pada gelang identitas pasien",
  "Pasang tanda risiko jatuh pada tempat tidur bagian kaki pasien (segitiga kuning/segitiga merah)",
  "Beri tanda resiko jatuh pada pintu kamar pasien ( RT )",
  "Libatkan keluarga dengan edukasi lebih ketat tentang pencegahan jatuh",
  "Tingkatkan observasi/bantuan saat ambulansi",
  "Instruksikan pasien untuk tidak bangun tanpa pertolongan",
  "Dampingi pasien dalam kegiatan ADL",
  "Kunjungi dan monitor pasien setiap jam",
  "Pasien ditempatkan dekat Nurse Station",
  "Lakukan Fiksasi fisik (Restrain) dengan persetujuan keluarga",
];

String toChecklist(
    {required Iterable<ResikoJatuhReport> pagi, required int index}) {
  switch (index) {
    case 1:
      if (pagi.isNotEmpty && pagi.first.resiko1 == true) {
        return "✓";
      }
    case 2:
      if (pagi.isNotEmpty && pagi.first.resiko2 == true) {
        return "✓";
      }
    case 3:
      if (pagi.isNotEmpty && pagi.first.resiko3 == true) {
        return "✓";
      }
    case 4:
      if (pagi.isNotEmpty && pagi.first.resiko4 == true) {
        return "✓";
      }
    case 5:
      if (pagi.isNotEmpty && pagi.first.resiko5 == true) {
        return "✓";
      }
    case 6:
      if (pagi.isNotEmpty && pagi.first.resiko6 == true) {
        return "✓";
      }
    case 7:
      if (pagi.isNotEmpty && pagi.first.resiko7 == true) {
        return "✓";
      }
    case 8:
      if (pagi.isNotEmpty && pagi.first.resiko8 == true) {
        return "✓";
      }
    case 9:
      if (pagi.isNotEmpty && pagi.first.resiko9 == true) {
        return "✓";
      }
    case 10:
      if (pagi.isNotEmpty && pagi.first.resiko10 == true) {
        return "✓";
      }
    case 11:
      if (pagi.isNotEmpty && pagi.first.resiko11 == true) {
        return "✓";
      }
    case 12:
      if (pagi.isNotEmpty && pagi.first.resiko12 == true) {
        return "✓";
      }
    case 13:
      if (pagi.isNotEmpty && pagi.first.resiko13 == true) {
        return "✓";
      }
    case 14:
      if (pagi.isNotEmpty && pagi.first.resiko14 == true) {
        return "✓";
      }
    case 15:
      if (pagi.isNotEmpty && pagi.first.resiko15 == true) {
        return "✓";
      }
    case 16:
      if (pagi.isNotEmpty && pagi.first.resiko16 == true) {
        return "✓";
      }
    case 17:
      if (pagi.isNotEmpty && pagi.first.resiko17 == true) {
        return "✓";
      }
    default:
      return "";
  }

  return "";
}
