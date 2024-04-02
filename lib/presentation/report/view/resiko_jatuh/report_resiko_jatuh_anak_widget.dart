import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/qr_code/custom_qr_widget.dart';
import 'package:hms_app/presentation/report/bloc/resiko_jatuh/resiko_jatuh_bloc.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:hms_app/presentation/report/repository/resiko_jatuh_anak_reponse_model.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class ReportResikoJatuhAnakWidget extends StatefulWidget {
  const ReportResikoJatuhAnakWidget({super.key});

  @override
  State<ReportResikoJatuhAnakWidget> createState() =>
      _ReportResikoJatuhAnakWidgetState();
}

class _ReportResikoJatuhAnakWidgetState
    extends State<ReportResikoJatuhAnakWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResikoJatuhReportBloc, ResikoReportJatuhState>(
      builder: (context, state) {
        if (state.reportResikoJatuhAnak != null &&
            state.reportResikoJatuhAnak!.noreg.length > 5) {
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
                  controller: _scrollController,
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
                              "ASSESMEN PASIEN RESIKO JATUH PADA ANAK",
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 8.sp),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Lakukan pengkajian ( skoring risiko jatuh pada saat pasien masuk, ketika terjadi perubahan kondisi pasien/therapi, saat pindah ruangan lain, pasien risiko tinggi dikaji setiap 24 jam atau sesaat setalah terjadi kasus jatuh ).",
                              style: blackTextStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "SKOR  :        7 - 11 Risiko Rendah ( RR )\n                    >= 12 Risiko Tinggi ( RT )",
                              style: blackTextStyle,
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
                                  TableGap.width(880),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Center(
                                        child: Text(
                                          "No.",
                                          style: blackTextStyle.copyWith(
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
                                          "FAKTOR RISIKO",
                                          style: blackTextStyle.copyWith(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableDeskColumn(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    children: [
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
                                              ],
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: (state.reportResikoJatuhAnak !=
                                                              null &&
                                                          state
                                                                  .reportResikoJatuhAnak!
                                                                  .insertDttm
                                                                  .length >
                                                              9)
                                                      ? Text(
                                                          "Tgl : ${state.reportResikoJatuhAnak!.insertDttm.substring(0, 10)}",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: blackTextStyle
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        )
                                                      : Text(
                                                          "Tgl  :",
                                                          textAlign:
                                                              TextAlign.center,
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
                                              ],
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Jam ${state.reportResikoJatuhAnak!.insertDttm.substring(11, 19)}",
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
                                ],
                              ),
                            ),
                          ),

                          ...faktor.asMap().entries.map(
                                (e) => Container(
                                  color: Colors.white,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.sp),
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
                                        TableGap.width(350),
                                        TableGap.weight(),
                                      ],
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Center(
                                              child: Text(
                                                (e.key + 1).toString(),
                                                style:
                                                    blackTextStyle.copyWith(),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                e.value.faktor,
                                                style:
                                                    blackTextStyle.copyWith(),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          child: TableDeskColumn(
                                            border: const BorderSide(
                                                width: 1, color: Colors.black),
                                            children: e.value.risiko
                                                .asMap()
                                                .entries
                                                .map((e) {
                                              if (state
                                                  .reportResikoJatuhAnak!.usia
                                                  .contains(e.value.title)) {
                                                //===//
                                                return resikoTable(
                                                    title: e.value.title,
                                                    total: e.value.skor,
                                                    selectedColor: Colors.green
                                                        .withOpacity(0.5),
                                                    value: "");
                                              }
                                              if (state.reportResikoJatuhAnak!
                                                  .jenisKelamin
                                                  .contains(e.value.title)) {
                                                //===//
                                                return resikoTable(
                                                    title: e.value.title,
                                                    total: e.value.skor,
                                                    selectedColor: Colors.green
                                                        .withOpacity(0.5),
                                                    value: "");
                                              }
                                              if (state.reportResikoJatuhAnak!
                                                  .diagnosis
                                                  .contains(e.value.title)) {
                                                //===//
                                                return resikoTable(
                                                    title: e.value.title,
                                                    total: e.value.skor,
                                                    selectedColor: Colors.green
                                                        .withOpacity(0.5),
                                                    value: "");
                                              }
                                              if (state.reportResikoJatuhAnak!
                                                  .gangguanKognitif
                                                  .contains(e.value.title)) {
                                                //===//
                                                return resikoTable(
                                                    title: e.value.title,
                                                    total: e.value.skor,
                                                    selectedColor: Colors.green
                                                        .withOpacity(0.5),
                                                    value: "");
                                              }
                                              if (state.reportResikoJatuhAnak!
                                                  .faktorLingkungan
                                                  .contains(e.value.title)) {
                                                //===//
                                                return resikoTable(
                                                    title: e.value.title,
                                                    total: e.value.skor,
                                                    selectedColor: Colors.green
                                                        .withOpacity(0.5),
                                                    value: "");
                                              }
                                              if (state
                                                  .reportResikoJatuhAnak!.respon
                                                  .contains(e.value.title)) {
                                                //===//
                                                return resikoTable(
                                                    title: e.value.title,
                                                    total: e.value.skor,
                                                    selectedColor: Colors.green
                                                        .withOpacity(0.5),
                                                    value: "");
                                              }
                                              if (state.reportResikoJatuhAnak!
                                                  .penggunaanObat
                                                  .contains(e.value.title)) {
                                                //===//
                                                return resikoTable(
                                                    title: e.value.title,
                                                    total: e.value.skor,
                                                    selectedColor: Colors.green
                                                        .withOpacity(0.5),
                                                    value: "");
                                              }

                                              return resikoTable(
                                                  title: e.value.title,
                                                  total: e.value.skor,
                                                  value: "");
                                            }).toList(),
                                          ),
                                        )
                                      ],
                                    ),
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
                                  TableGap.width(880),
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
                                        "Total Skor",
                                        style: blackTextStyle.copyWith(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          state.reportResikoJatuhAnak!.total
                                              .toString(),
                                          style: blackTextStyle.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 9.sp),
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
                                  TableGap.width(150),
                                  TableGap.width(880),
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
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          state.reportResikoJatuhAnak!
                                              .namaPerawat,
                                          style: blackTextStyle,
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
                                  TableGap.width(150),
                                  TableGap.width(880),
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
                                  Container(
                                    color: Colors.white,
                                    height: 55.sp,
                                    width: 55.sp,
                                    child: CustomQrWidget(
                                      dimension: 30.sp,
                                      dataBarcode: state
                                          .reportResikoJatuhAnak!.namaPerawat,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 15.sp)
                        ],
                      ),
                    ),
                    SizedBox(height: 15.sp)
                  ],
                ),
              ),
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
              child: ListView(
                controller: _scrollController,
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
                            "ASSESMEN PASIEN RESIKO JATUH PADA ANAK",
                            textAlign: TextAlign.center,
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 8.sp),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Lakukan pengkajian ( skoring risiko jatuh pada saat pasien masuk, ketika terjadi perubahan kondisi pasien/therapi, saat pindah ruangan lain, pasien risiko tinggi dikaji setiap 24 jam atau sesaat setalah terjadi kasus jatuh ).",
                            style: blackTextStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "SKOR  :        7 - 11 Risiko Rendah ( RR )\n                    >= 12 Risiko Tinggi ( RT )",
                            style: blackTextStyle,
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
                                TableGap.width(580),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Text(
                                        "No.",
                                        style: blackTextStyle.copyWith(
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
                                        "FAKTOR RISIKO",
                                        style: blackTextStyle.copyWith(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                TableDeskColumn(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
                                  children: [
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
                                              TableGap.width(205),
                                              TableGap.weight(),
                                            ],
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Tgl",
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: (state.reportResikoJatuhAnak !=
                                                            null &&
                                                        state
                                                                .reportResikoJatuhAnak!
                                                                .insertDttm
                                                                .length >
                                                            9)
                                                    ? Text(
                                                        state
                                                            .reportResikoJatuhAnak!
                                                            .insertDttm
                                                            .substring(0, 10),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: blackTextStyle,
                                                      )
                                                    : const Text(""),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
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
                                              TableGap.width(205),
                                              TableGap.weight(),
                                            ],
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Jam",
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: (state.reportResikoJatuhAnak !=
                                                            null &&
                                                        state
                                                                .reportResikoJatuhAnak!
                                                                .insertDttm
                                                                .length >
                                                            9)
                                                    ? Text(
                                                        state
                                                            .reportResikoJatuhAnak!
                                                            .insertDttm
                                                            .substring(11, 19),
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: blackTextStyle,
                                                      )
                                                    : const Text(""),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        ...faktor.asMap().entries.map(
                              (e) => Container(
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
                                      TableGap.width(250),
                                      TableGap.weight(),
                                      TableGap.width(145),
                                    ],
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Center(
                                            child: Text(
                                              (e.key + 1).toString(),
                                              style: blackTextStyle.copyWith(),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              e.value.faktor,
                                              style: blackTextStyle.copyWith(),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableDeskColumn(
                                        border: const BorderSide(
                                            width: 1, color: Colors.black),
                                        children: e.value.risiko
                                            .asMap()
                                            .entries
                                            .map((e) {
                                          return resikoTable(
                                              title: e.value.title,
                                              total: e.value.skor,
                                              value: "");
                                        }).toList(),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "",
                                              style: blackTextStyle.copyWith(),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
                                TableGap.width(580),
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
                                      "Total Skor",
                                      style: blackTextStyle.copyWith(
                                          fontWeight: FontWeight.bold),
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
                                TableGap.width(580),
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
                                TableGap.width(580),
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
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15.sp)
                      ],
                    ),
                  ),
                  SizedBox(height: 15.sp)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  TableDeskColumn resikoTable(
      {required String title,
      required String total,
      required String value,
      Color? selectedColor}) {
    return TableDeskColumn(
      border: const BorderSide(width: 1, color: Colors.black),
      children: [
        Container(
          color: Colors.white,
          child: TableDeskRow(
            border: const BorderSide(width: 1, color: Colors.black),
            gaps: [
              TableGap.width(530),
              TableGap.weight(),
            ],
            children: [
              Container(
                decoration: BoxDecoration(color: selectedColor ?? Colors.white),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: blackTextStyle.copyWith(),
                    )),
              ),
              Container(
                decoration: BoxDecoration(color: selectedColor ?? Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    total,
                    textAlign: TextAlign.center,
                    style: blackTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Faktor {
  final String faktor;
  final List<Risiko> risiko;
  Faktor({
    required this.faktor,
    required this.risiko,
  });
}

class Risiko {
  final String title;
  final String skor;
  Risiko({
    required this.title,
    required this.skor,
  });
}

String toSkor({required ReportResikoJatuhAnak reportResikoJatuhAnak}) {
  for (var i = 0; i < faktor.length; i++) {
    if (faktor[i].faktor == "") {}
    for (var a = 0; i < faktor[i].risiko.length; a++) {
      //  if(reportResikoJatuhAnak.usia.contains(risiko[a].)){}
    }
  }
  return "";
}

List<Faktor> faktor = [
  Faktor(faktor: "Umur", risiko: [
    Risiko(title: "Kurang dari 3 tahun", skor: "4"),
    Risiko(title: "3-7 tahun", skor: "3"),
    Risiko(title: "7 - 13 tahun", skor: "2"),
    Risiko(title: "Lebih dari 13 tahun", skor: "1"),
  ]),
  Faktor(faktor: "Jenis Kelamin", risiko: [
    Risiko(title: "Laki-laki", skor: "2"),
    Risiko(title: "Perempuan", skor: "1"),
  ]),
  Faktor(faktor: "Diagnosa", risiko: [
    Risiko(title: "Neurologi", skor: "4"),
    Risiko(
        title:
            "Gangguan oxigenasi, Respirator, dehidrasi, anemia, anorexia, syncope,",
        skor: "3"),
    Risiko(title: "Gangguan perilaku", skor: "2"),
    Risiko(title: "Penyakit lain", skor: "1"),
  ]),
  Faktor(faktor: "Gangguan Kognitif", risiko: [
    Risiko(title: "Keterbatasan daya pikir", skor: "3"),
    Risiko(title: "Pelupa, berkurang orientasi sekitar", skor: "2"),
    Risiko(title: "Kemampuan Kognitif/orientasi baik", skor: "1"),
  ]),
  Faktor(faktor: "Fator Lingkungan", risiko: [
    Risiko(
        title:
            "Riwayat jatuh atau bayi / balita yang ditempatkan di tempat tidur (box)",
        skor: "4"),
    Risiko(
        title: "Menggunakan alat bantu (ayunan, tempat tidur lipat)",
        skor: "3"),
    Risiko(title: "Pasien berada pada tempat tidur standar", skor: "2"),
    Risiko(title: "Berada di area pasien rawat jalan", skor: "1"),
  ]),
  Faktor(faktor: "Respon terhadap pembedahan, sedasi dan anestesi", risiko: [
    Risiko(title: "Dalam 24 jam", skor: "3"),
    Risiko(title: "> 48 jam / tanpa respon", skor: "2"),
    Risiko(title: "Dalam 48 jam", skor: "1"),
  ]),
  Faktor(faktor: "Penggunaan Obat-obatan", risiko: [
    Risiko(
        title:
            "Menggunakan obat lain dari 2 jenis: Sedatif,Barbiturat,Antideprasan,Diuretik,Narkotik",
        skor: "3"),
    Risiko(title: "Menggunakan obat-obat lain / Tanpa obat", skor: "2"),
    Risiko(title: "Menggunakan 1 jenis obat dari daftar diatas", skor: "1"),
  ]),
];
