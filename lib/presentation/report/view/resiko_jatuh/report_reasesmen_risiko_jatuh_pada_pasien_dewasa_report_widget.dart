// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/qr_code/custom_qr_widget.dart';
import 'package:hms_app/presentation/report/bloc/resiko_jatuh/resiko_jatuh_bloc.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:hms_app/presentation/report/repository/risiko_jatuh_dewasa_response_model.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

import 'package:hms_app/presentation/component/component.dart';

class ReAsesmenRisikoJatuhPadaPasienDewasaWidget extends StatefulWidget {
  const ReAsesmenRisikoJatuhPadaPasienDewasaWidget({super.key});

  @override
  State<ReAsesmenRisikoJatuhPadaPasienDewasaWidget> createState() =>
      _ReAsesmenRisikoJatuhPadaPasienDewasaWidgetState();
}

class _ReAsesmenRisikoJatuhPadaPasienDewasaWidgetState
    extends State<ReAsesmenRisikoJatuhPadaPasienDewasaWidget> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResikoJatuhReportBloc, ResikoReportJatuhState>(
      builder: (context, state) {
        if (state.status ==
            ReportResikoJatuhStatus.isLoadingResikoJatuhPasienDewasa) {
          return Scaffold(
            backgroundColor: ThemeColor.transparentColor,
            body: SizedBox(
              width: Get.width,
              height: Get.height,
              child: Loading.expandedLoading(),
            ),
          );
        }

        if (state.status ==
                ReportResikoJatuhStatus.isLoadedResikoJatuhPasienDewasa &&
            state.resikoJatuhDewasaResponse != null &&
            state.resikoJatuhDewasaResponse!.noreg.length > 5) {
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
                              "RE-ASESMEN RISIKO JATUH PASIEN DEWASA",
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 8.sp),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Lakukan pengkajian ( skoring ) risiko jatuh pada saat terjadi perubahan kondisi pasien/therapi, saat pasien pindah ruangan lain, pasien risiko tinggi dikaji setiap 24 jam atau sesaat terjadi kasus jatuh.",
                              style: blackTextStyle,
                            ),
                          ),

                          Center(
                            child: Text(
                              "SKOR    :    0-5 Risiko Rendah ( RR )           >=14 Risiko Tinggi ( RT ) \n                  6-13 Risiko Sedang ( RS )",
                              style: blackTextStyle,
                            ),
                          ),
                          SizedBox(height: 5.sp),

                          /// ===== //
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
                                  TableGap.width(570),
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
                                                TableGap.width(200),
                                                TableGap.weight(),
                                              ],
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Tgl : ",
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
                                                    state
                                                        .resikoJatuhDewasaResponse!
                                                        .insertDttm
                                                        .substring(0, 10),
                                                    textAlign: TextAlign.left,
                                                    style: blackTextStyle,
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
                                                TableGap.width(200),
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
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ),
                                                (state.resikoJatuhDewasaResponse!
                                                            .insertDttm.length >
                                                        9)
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        child: Text(
                                                          state
                                                              .resikoJatuhMorseResponse!
                                                              .insertDttm
                                                              .substring(
                                                                  11, 19),
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: blackTextStyle,
                                                        ),
                                                      )
                                                    : Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        child: Text(
                                                          "",
                                                          textAlign:
                                                              TextAlign.left,
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
                                ],
                              ),
                            ),
                          ),

                          if (state.resikoJatuhDewasaResponse == null) ...[
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
                                          TableGap.width(240),
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
                                          TableDeskColumn(
                                            border: const BorderSide(
                                                width: 1, color: Colors.black),
                                            children: e.value.risiko
                                                .map(
                                                  (e) => resikoTable(
                                                      isActive: e.enable,
                                                      title: e.title,
                                                      total: e.skor,
                                                      value: ""),
                                                )
                                                .toList(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                          ],

                          if (state.resikoJatuhDewasaResponse != null) ...[
                            ...tofaktor(
                                    resikoJatuh:
                                        state.resikoJatuhDewasaResponse!)
                                .asMap()
                                .entries
                                .map(
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
                                          TableGap.width(240),
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
                                          TableDeskColumn(
                                            border: const BorderSide(
                                                width: 1, color: Colors.black),
                                            children: e.value.risiko
                                                .map(
                                                  (e) => resikoTable(
                                                      isActive: e.enable,
                                                      title: e.title,
                                                      total: e.skor,
                                                      value: ""),
                                                )
                                                .toList(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                          ],

                          footerTableSkor(
                              title: "Total Skor",
                              value: state.resikoJatuhDewasaResponse!.total),
                          footerTable(
                              title: "Lingkari Risiko Jatuh berdasarkan Skor",
                              value: ""),
                          footerTable(
                              title: "Nama Perawat",
                              value:
                                  state.resikoJatuhDewasaResponse!.namaPerawat),
                          footerTable(
                              title: "Paraf",
                              value:
                                  state.resikoJatuhDewasaResponse!.namaPerawat),

                          SizedBox(height: 15.sp),

                          Padding(
                            padding: EdgeInsets.all(8.sp),
                            child: Text(
                              "Daftar obat berisiko :\nAlkohol            Psikotropica                    Bezodiaepine      \nAnti Kejang    Antihistamin                   Hypoglicemic Agent\nDiuretic           Sedative / Narcotica    Antihypertensi",
                              style: blackTextStyle,
                            ),
                          ),

                          SizedBox(
                            height: 25.sp,
                          )
                        ],
                      ),
                    ),
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
                        const Divider(),
                        Center(
                          child: Text(
                            "RE-ASESMEN RISIKO JATUH PASIEN DEWASA",
                            textAlign: TextAlign.center,
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 8.sp),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Lakukan pengkajian ( skoring ) risiko jatuh pada saat terjadi perubahan kondisi pasien/therapi, saat pasien pindah ruangan lain, pasien risiko tinggi dikaji setiap 24 jam atau sesaat terjadi kasus jatuh.",
                            style: blackTextStyle,
                          ),
                        ),

                        Center(
                          child: Text(
                            "SKOR    :    0-5 Risiko Rendah ( RR )           >=14 Risiko Tinggi ( RT ) \n                  6-13 Risiko Sedang ( RS )",
                            style: blackTextStyle,
                          ),
                        ),
                        SizedBox(height: 5.sp),

                        /// ===== //
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
                                TableGap.width(570),
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
                                              TableGap.width(200),
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
                                      TableGap.width(240),
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
                                            .map(
                                              (e) => resikoTable(
                                                  isActive: e.enable,
                                                  title: e.title,
                                                  total: e.skor,
                                                  value: ""),
                                            )
                                            .toList(),
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
                                          TableGap.width(210),
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
                                      "Lingkari Risiko Jatuh berdasarkan Skor",
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
                                          TableGap.width(210),
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

                        /// =====
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
                                          TableGap.width(210),
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
                                          TableGap.width(210),
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
                        SizedBox(height: 15.sp),

                        Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Text(
                            "Daftar obat berisiko :\nAlkohol            Psikotropica                    Bezodiaepine      \nAnti Kejang    Antihistamin                   Hypoglicemic Agent\nDiuretic           Sedative / Narcotica    Antihypertensi",
                            style: blackTextStyle,
                          ),
                        ),

                        SizedBox(
                          height: 25.sp,
                        )
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

  Container footerTable({required String title, required String value}) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: TableDesk(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 1),
        ),
        child: TableDeskRow(
          border: const BorderSide(width: 1, color: Colors.black),
          gaps: [
            TableGap.width(150),
            TableGap.width(570),
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
                  title,
                  style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            TableDeskColumn(
              border: const BorderSide(width: 1, color: Colors.black),
              children: [
                Container(
                  color: Colors.white,
                  child: TableDeskRow(
                    border: const BorderSide(width: 1, color: Colors.black),
                    gaps: [
                      TableGap.width(210),
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
                      if (title == "Paraf") ...[
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: SizedBox(
                            height: 55.sp,
                            width: 55.sp,
                            child: CustomQrWidget(
                              dimension: 30.sp,
                              dataBarcode: value,
                            ),
                          ),
                        ),
                      ],
                      if (title != "Paraf") ...[
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              value,
                              textAlign: TextAlign.left,
                              style: blackTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container footerTableSkor({required String title, required int value}) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: TableDesk(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 1),
        ),
        child: TableDeskRow(
          border: const BorderSide(width: 1, color: Colors.black),
          gaps: [
            TableGap.width(150),
            TableGap.width(570),
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
                  title,
                  style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            TableDeskColumn(
              border: const BorderSide(width: 1, color: Colors.black),
              children: [
                Container(
                  color: Colors.white,
                  child: TableDeskRow(
                    border: const BorderSide(width: 1, color: Colors.black),
                    gaps: [
                      TableGap.width(210),
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
                        child: Center(
                          child: Text(
                            (value <= 5)
                                ? "RT"
                                : (value <= 13)
                                    ? "RS"
                                    : "RT",
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
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
  }

  TableDeskColumn resikoTable(
      {required String title,
      required String total,
      required String value,
      required bool isActive}) {
    return TableDeskColumn(
      border: const BorderSide(width: 1, color: Colors.black),
      children: [
        Container(
          color: Colors.white,
          child: TableDeskRow(
            border: const BorderSide(width: 1, color: Colors.black),
            gaps: [
              TableGap.width(330),
              TableGap.width(205),
              TableGap.weight(),
            ],
            children: [
              Container(
                color: (isActive == true) ? Colors.greenAccent : Colors.white,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: blackTextStyle.copyWith(),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  total,
                  textAlign: TextAlign.center,
                  style: blackTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    (isActive == true) ? "✓" : "",
                    textAlign: TextAlign.left,
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
  final bool enable;
  Risiko({
    required this.title,
    required this.enable,
    required this.skor,
  });
}

List<Faktor> faktor = [
  Faktor(faktor: "Usia", risiko: [
    Risiko(title: "Kurang dari 60 tahun", skor: "0", enable: false),
    Risiko(title: "Antara 60-69", skor: "1", enable: false),
    Risiko(title: ">= 70 tahun", skor: "2", enable: false),
  ]),
  Faktor(faktor: "Riwayat Jatuh", risiko: [
    Risiko(title: "Tidak pernah", skor: "0", enable: false),
    Risiko(title: "Pernah jatuh dalam 1 tahun", skor: "1", enable: false),
    Risiko(title: "Pernah jatuh dalam 1 bulan", skor: "2", enable: false),
    Risiko(title: "Jatuh pada saat dirwat sekarang", skor: "3", enable: false),
  ]),
  Faktor(faktor: "Aktivitas", risiko: [
    Risiko(title: "Mandiri", skor: "0", enable: false),
    Risiko(title: "ADL dibantu sebagaian", skor: "2", enable: false),
    Risiko(title: "ADL dibantu penuh", skor: "3", enable: false),
  ]),
  Faktor(faktor: "Mobilisasi / Motorik", risiko: [
    Risiko(title: "Mandiri", skor: "0", enable: false),
    Risiko(title: "Menggunakan alat bantu", skor: "1", enable: false),
    Risiko(title: "Koordinasi / keseimbangan buruk", skor: "2", enable: false),
  ]),
  Faktor(faktor: "Kognitif", risiko: [
    Risiko(title: "Orientasi baik", skor: "0", enable: false),
    Risiko(title: "Kesulitan mengerti perintah", skor: "1", enable: false),
    Risiko(title: "Gangguan memori", skor: "2", enable: false),
    Risiko(title: "Bingung / Disorientasi", skor: "3", enable: false),
  ]),
  Faktor(faktor: "Defisit Sensori", risiko: [
    Risiko(title: "Kacamata bukan bifokal", skor: "0", enable: false),
    Risiko(
        title: "Kacamata bifokal, gangguan pendengaran",
        skor: "1",
        enable: false),
    Risiko(
        title: "Kacamata moltifokal, Katarak, Glaucoma",
        skor: "2",
        enable: false),
    Risiko(title: "Hampir tidak melihat / Buta", skor: "3", enable: false),
  ]),
  Faktor(faktor: "Pengobatan", risiko: [
    Risiko(
        title: "Menggunakan obat >= 24 jenis obat yang tidak berisiko",
        skor: "1",
        enable: false),
    Risiko(title: "Menggunakan 1 obat berisiko", skor: "1", enable: false),
    Risiko(title: "Menggunakan 2 obat obat berisiko", skor: "2", enable: false),
    Risiko(
        title: "Menggunakan obat Sedative/Narcotica/Psikotropica",
        skor: "3",
        enable: false),
  ]),
  Faktor(faktor: "Komorbiditas", risiko: [
    Risiko(title: "Diabetes / Cardiac / ISK", skor: "1", enable: false),
    Risiko(
        title: "Gangguan SSP / Storke / Parkinson", skor: "2", enable: false),
    Risiko(title: "Paska bedah 24 jam", skor: "3", enable: false),
  ]),
];

List<Faktor> tofaktor({required ResikoJatuhDewasaResponse resikoJatuh}) {
  return [
    Faktor(faktor: "Usia", risiko: [
      Risiko(
          title: "Kurang dari 60 tahun",
          skor: "0",
          enable: (resikoJatuh.usia.contains("Kurang dari 60 tahun"))
              ? true
              : false),
      Risiko(
          title: "Antara 60-69",
          skor: "1",
          enable: (resikoJatuh.usia.contains("Antara 60-69")) ? true : false),
      Risiko(
          title: ">= 70 tahun",
          skor: "2",
          enable: (resikoJatuh.usia.contains(">= 70 tahun")) ? true : false),
    ]),
    Faktor(faktor: "Riwayat Jatuh", risiko: [
      Risiko(
          title: "Tidak pernah",
          skor: "0",
          enable: (resikoJatuh.rJatuh.contains("Tidak pernah")) ? true : false),
      Risiko(
          title: "Pernah jatuh dalam 1 tahun",
          skor: "1",
          enable: (resikoJatuh.rJatuh.contains("Pernah jatuh dalam 1 tahun"))
              ? true
              : false),
      Risiko(
          title: "Pernah jatuh dalam 1 bulan",
          skor: "2",
          enable: (resikoJatuh.rJatuh.contains("Pernah jatuh dalam 1 bulan"))
              ? true
              : false),
      Risiko(
          title: "Jatuh pada saat dirawat sekarang",
          skor: "3",
          enable:
              (resikoJatuh.rJatuh.contains("Jatuh pada saat dirawat sekarang"))
                  ? true
                  : false),
    ]),
    Faktor(faktor: "Aktivitas", risiko: [
      Risiko(
          title: "Mandiri",
          skor: "0",
          enable: (resikoJatuh.aktivitas.contains("Mandiri")) ? true : false),
      Risiko(
          title: "ADL dibantu sebagian",
          skor: "2",
          enable: (resikoJatuh.aktivitas.contains("ADL dibantu sebagian"))
              ? true
              : false),
      Risiko(
          title: "ADL dibantu penuh",
          skor: "3",
          enable: (resikoJatuh.aktivitas.contains("ADL dibantu penuh"))
              ? true
              : false),
    ]),
    Faktor(faktor: "Mobilisasi / Motorik", risiko: [
      Risiko(
          title: "Mandiri",
          skor: "0",
          enable: (resikoJatuh.mobilitas.contains("Mandiri")) ? true : false),
      Risiko(
          title: "Menggunakan alat bantu",
          skor: "1",
          enable: (resikoJatuh.mobilitas.contains("Menggunakan alat bantu"))
              ? true
              : false),
      Risiko(
          title: "Koordinasi / keseimbangan buruk",
          skor: "2",
          enable: (resikoJatuh.mobilitas
                  .contains("Koordinasi / keseimbangan buruk"))
              ? true
              : false),
    ]),
    Faktor(faktor: "Kognitif", risiko: [
      Risiko(
          title: "Orientasi baik",
          skor: "0",
          enable:
              (resikoJatuh.kognitif.contains("Orientasi baik")) ? true : false),
      Risiko(
          title: "Kesulitan mengerti perintah",
          skor: "1",
          enable: (resikoJatuh.kognitif.contains("Kesulitan mengerti perintah"))
              ? true
              : false),
      Risiko(
          title: "Gangguan memori",
          skor: "2",
          enable: (resikoJatuh.kognitif.contains("Gangguan memori"))
              ? true
              : false),
      Risiko(
          title: "Bingung / Disorientasi",
          skor: "3",
          enable: (resikoJatuh.kognitif.contains("Bingung / Disorientasi"))
              ? true
              : false),
    ]),
    Faktor(faktor: "Defisit Sensori", risiko: [
      Risiko(
          title: "Kacamata bukan bifokal",
          skor: "0",
          enable:
              (resikoJatuh.defisitSensori.contains("Kacamata bukan bifokal"))
                  ? true
                  : false),
      Risiko(
          title: "Kacamata bifokal, gangguan pendengaran",
          skor: "1",
          enable: (resikoJatuh.defisitSensori
                  .contains("Kacamata bifokal, gangguan pendengaran"))
              ? true
              : false),
      Risiko(
          title: "Kacamata moltifokal, Katarak, Glaucoma",
          skor: "2",
          enable: (resikoJatuh.defisitSensori
                  .contains("Kacamata moltifokal, Katarak, Glaucoma"))
              ? true
              : false),
      Risiko(
          title: "Hampir tidak melihat/Buta",
          skor: "3",
          enable: (resikoJatuh.defisitSensori.contains("tidak melihat/Buta"))
              ? true
              : false),
    ]),
    Faktor(faktor: "Pengobatan", risiko: [
      Risiko(
          title: "Menggunakan obat >= 24 jenis obat yang tidak berisiko",
          skor: "1",
          enable: (resikoJatuh.pengobatan.contains(
                  "Menggunakan obat >= 24 jenis obat yang tidak berisiko"))
              ? true
              : false),
      Risiko(
          title: "Menggunakan 1 obat berisiko",
          skor: "1",
          enable:
              (resikoJatuh.pengobatan.contains("Menggunakan 1 obat berisiko"))
                  ? true
                  : false),
      Risiko(
          title: "Menggunakan 2 obat obat berisiko",
          skor: "2",
          enable: (resikoJatuh.pengobatan
                  .contains("Menggunakan 2 obat obat berisiko"))
              ? true
              : false),
      Risiko(
          title: "Menggunakan obat Seadative/Narcotica/Psikotaripica",
          skor: "3",
          enable: (resikoJatuh.pengobatan.contains(
                  "Menggunakan obat Seadative/Narcotica/Psikotaripica"))
              ? true
              : false),
    ]),
    Faktor(faktor: "Komorbiditas", risiko: [
      Risiko(
          title: "Diabetes / Cardiac / ISK",
          skor: "1",
          enable:
              (resikoJatuh.komorbiditas.contains("Diabetes / Cardiac / ISK"))
                  ? true
                  : false),
      Risiko(
          title: "Gangguan SSP / Stroke / Parkinson",
          skor: "2",
          enable: (resikoJatuh.komorbiditas
                  .contains("Gangguan SSP / Stroke / Parkinson"))
              ? true
              : false),
      Risiko(
          title: "Paska bedah 24 jam",
          skor: "3",
          enable: (resikoJatuh.komorbiditas.contains("Paska bedah 24 jam"))
              ? true
              : false),
    ]),
  ];
}
