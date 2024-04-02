// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/report/bloc/resiko_jatuh/resiko_jatuh_bloc.dart';
import 'package:hms_app/presentation/report/component/ceklist_widget.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:hms_app/presentation/report/component/header_with_nomor_rm_widget.dart';
import 'package:hms_app/presentation/report/repository/report_resiko_jatuh_morse_response_model.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';
import 'package:hms_app/presentation/component/component.dart';

class ReportReAsesmenResikoJatuhPasienDewasaContentWidget
    extends StatefulWidget {
  const ReportReAsesmenResikoJatuhPasienDewasaContentWidget({super.key});

  @override
  State<ReportReAsesmenResikoJatuhPasienDewasaContentWidget> createState() =>
      _ReportReAsesmenResikoJatuhPasienDewasaContentWidgetState();
}

class _ReportReAsesmenResikoJatuhPasienDewasaContentWidgetState
    extends State<ReportReAsesmenResikoJatuhPasienDewasaContentWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResikoJatuhReportBloc, ResikoReportJatuhState>(
      builder: (context, state) {
        if (state.status == ReportResikoJatuhStatus.loading) {
          return Loading.expandedLoading();
        }

        if (state.status == ReportResikoJatuhStatus.isLoadedResikojatuhMorse) {
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
                          // const HeaderWithNomorRMWidget(),
                          Padding(
                            padding: EdgeInsets.all(8.sp),
                            child: const HeaderAllWidget(),
                          ),
                          const Divider(),
                          Center(
                            child: Text(
                              "RE-ASESMEN RISIKO JATUH PADA PASIEN DEWASA\nBERDASARKAN PENILAIAN Skala Jatuh Morse / Morse Falls Scale (MFS)",
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
                          SizedBox(
                            height: 10.sp,
                          ),

                          // ======================= RIWAYAT JATUH

                          if (state.resikoJatuhMorseResponse != null) ...[
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
                                    TableGap.width(329),
                                    TableGap.weight(),
                                    TableGap.width(150),
                                    TableGap.width(150),
                                  ],
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Center(
                                          child: Text(
                                            "Faktor Resiko",
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
                                            "SKALA",
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
                                            child: Text("POIN",
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 6.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center)),
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
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: (state.resikoJatuhMorseResponse !=
                                                              null &&
                                                          state
                                                                  .resikoJatuhMorseResponse!
                                                                  .insertDttm
                                                                  .length >
                                                              9)
                                                      ? Text(
                                                          "Tgl :  ${state.resikoJatuhMorseResponse!.insertDttm.substring(0, 10)}",
                                                          style: blackTextStyle
                                                              .copyWith(
                                                                  fontSize:
                                                                      6.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        )
                                                      : Text(
                                                          "Tgl :",
                                                          style: blackTextStyle
                                                              .copyWith(
                                                                  fontSize:
                                                                      6.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                ),
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
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: (state.resikoJatuhMorseResponse !=
                                                              null &&
                                                          state
                                                                  .resikoJatuhMorseResponse!
                                                                  .insertDttm
                                                                  .length >
                                                              9)
                                                      ? Text(
                                                          "Pukul : ${state.resikoJatuhMorseResponse!.insertDttm.substring(11, 19)}",
                                                          style: blackTextStyle
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        )
                                                      : Text(
                                                          "Pukul :",
                                                          style: blackTextStyle
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                ),
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
                            ...resiko(
                                    resikoJatuhMorseResponse:
                                        state.resikoJatuhMorseResponse!)
                                .map(
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
                                      TableGap.width(329),
                                      TableGap.weight(),
                                    ],
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Center(
                                            child: Text(
                                              e.title,
                                              style: blackTextStyle.copyWith(),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableDeskColumn(
                                        border: const BorderSide(
                                            width: 1, color: Colors.black),
                                        children: e.skala.asMap().entries.map(
                                          (e) {
                                            return TableDeskRow(
                                              gaps: [
                                                TableGap.weight(),
                                                TableGap.width(150),
                                                TableGap.width(150),
                                              ],
                                              border: const BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                              children: [
                                                Container(
                                                  color: (e.value.isColor)
                                                      ? Colors.green
                                                      : Colors.white,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      e.value.title,
                                                      style: blackTextStyle
                                                          .copyWith(),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  color: Colors.white,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Center(
                                                      child: Text(
                                                        e.value.skor,
                                                        style: blackTextStyle
                                                            .copyWith(),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  color: Colors.white,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: ChecklistWidget(
                                                        isEnable:
                                                            e.value.isColor,
                                                        title: ""),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ).toList(),
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
                                    side: BorderSide(
                                        color: Colors.black, width: 1),
                                  ),
                                  child: TableDeskRow(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    gaps: [
                                      TableGap.width(729),
                                      TableGap.weight(),
                                    ],
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            "TOTAL",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Center(
                                            child: Text(
                                              state.resikoJatuhMorseResponse!
                                                  .total
                                                  .toString(),
                                              style: blackTextStyle.copyWith(),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                          ],

                          if (state.resikoJatuhMorseResponse == null) ...[
                            ...resikoEmty.map(
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
                                      TableGap.width(329),
                                      TableGap.weight(),
                                    ],
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Center(
                                            child: Text(
                                              e.title,
                                              style: blackTextStyle.copyWith(),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableDeskColumn(
                                        border: const BorderSide(
                                            width: 1, color: Colors.black),
                                        children: e.skala
                                            .map(
                                              (e) => TableDeskRow(
                                                gaps: [
                                                  TableGap.width(400),
                                                  TableGap.width(150),
                                                  TableGap.weight(),
                                                ],
                                                border: const BorderSide(
                                                    width: 1,
                                                    color: Colors.black),
                                                children: [
                                                  Container(
                                                    color: Colors.white,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        e.title,
                                                        style: blackTextStyle
                                                            .copyWith(),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    color: Colors.white,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Center(
                                                        child: Text(
                                                          e.skor,
                                                          style: blackTextStyle
                                                              .copyWith(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    color: Colors.white,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        "",
                                                        style: blackTextStyle
                                                            .copyWith(),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
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
                                    side: BorderSide(
                                        color: Colors.black, width: 1),
                                  ),
                                  child: TableDeskRow(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    gaps: [
                                      TableGap.width(729),
                                      TableGap.weight(),
                                    ],
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            "TOTAL",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Center(
                                            child: Text(
                                              "",
                                              style: blackTextStyle.copyWith(),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                          ],

                          SizedBox(height: 15.sp),

                          Padding(
                            padding: EdgeInsets.all(5.sp),
                            child: Text(
                              "Keterangan : \n\n⚫   Tulis jumlah skor yang sesuai pada kolom skor pasien\n⚫   Kategori : \n             -  Resiko rendah  : 0 - 24\n             -  Resiko sedang : 25 - 44\n             -  Resiko tinggi     : >= 45",
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

        // == == //
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
                      const HeaderWithNomorRMWidget(),
                      const Divider(),
                      Center(
                        child: Text(
                          "RE-ASESMEN RISIKO JATUH PADA PASIEN DEWASA\nBERDASARKAN PENILAIAN Skala Jatuh Morse / Morse Falls Scale (MFS)",
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
                      SizedBox(
                        height: 10.sp,
                      ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: TableDesk(
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 1),
                          ),
                          child: TableDeskRow(
                            border:
                                const BorderSide(width: 1, color: Colors.black),
                            gaps: [
                              TableGap.width(329),
                              TableGap.weight(),
                              TableGap.width(400),
                              TableGap.width(80),
                            ],
                            children: [
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Center(
                                    child: Text(
                                      "Faktor Resiko",
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
                                      "SKALA",
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
                                      "POIN",
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
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              "Tgl",
                                              style: blackTextStyle.copyWith(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
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
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              "Pukul",
                                              style: blackTextStyle.copyWith(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
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

                      // ======================= RIWAYAT JATUH

                      ...resikoEmty.map(
                        (e) => Container(
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
                                TableGap.width(329),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Text(
                                        e.title,
                                        style: blackTextStyle.copyWith(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                TableDeskColumn(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
                                  children: e.skala
                                      .map(
                                        (e) => TableDeskRow(
                                          gaps: [
                                            TableGap.width(400),
                                            TableGap.width(150),
                                            TableGap.weight(),
                                          ],
                                          border: const BorderSide(
                                              width: 1, color: Colors.black),
                                          children: [
                                            Container(
                                              color: Colors.white,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  e.title,
                                                  style:
                                                      blackTextStyle.copyWith(),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              color: Colors.white,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: Text(
                                                    e.skor,
                                                    style: blackTextStyle
                                                        .copyWith(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              color: Colors.white,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "",
                                                  style:
                                                      blackTextStyle.copyWith(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
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
                            border:
                                const BorderSide(width: 1, color: Colors.black),
                            gaps: [
                              TableGap.width(729),
                              TableGap.weight(),
                            ],
                            children: [
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "TOTAL",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Center(
                                    child: Text(
                                      "",
                                      style: blackTextStyle.copyWith(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 15.sp),

                      Padding(
                        padding: EdgeInsets.all(5.sp),
                        child: Text(
                          "Keterangan : \n\n⚫   Tulis jumlah skor yang sesuai pada kolom skor pasien\n⚫   Kategori : \n             -  Resiko rendah  : 0 - 24\n             -  Resiko sedang : 25 - 44\n             -  Resiko tinggi     : >= 45",
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
        );
      },
    );
  }

  TableDeskColumn resikoTable(
      {required String title, required String total, required String value}) {
    return TableDeskColumn(
      border: const BorderSide(width: 1, color: Colors.white),
      children: [
        Container(
          color: Colors.white,
          child: TableDeskRow(
            border: const BorderSide(width: 1, color: Colors.black),
            gaps: [
              TableGap.width(400),
              TableGap.width(205),
              TableGap.weight(),
              TableGap.weight(),
            ],
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: blackTextStyle.copyWith(),
                  )),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  total,
                  textAlign: TextAlign.left,
                  style: blackTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  value,
                  textAlign: TextAlign.left,
                  style: blackTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  value,
                  textAlign: TextAlign.left,
                  style: blackTextStyle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Resiko {
  final String title;
  final List<Skala> skala;
  Resiko({
    required this.title,
    required this.skala,
  });
}

class Skala {
  final String title;
  final bool isColor;
  final String skor;
  final String value;
  Skala({
    required this.title,
    required this.isColor,
    required this.skor,
    required this.value,
  });
}

List<Resiko> resiko(
    {required ResikoJatuhMorseResponse resikoJatuhMorseResponse}) {
  return [
    Resiko(title: "Riwayat Jatuh", skala: [
      Skala(
          title: "Ya",
          skor: "25",
          value: "",
          isColor:
              (resikoJatuhMorseResponse.rJatuh.contains("Ya") ? true : false)),
      Skala(
          title: "Tidak",
          skor: "0",
          value: "",
          isColor: (resikoJatuhMorseResponse.rJatuh.contains("Tidak")
              ? true
              : false)),
    ]),
    Resiko(title: "Diagnosis sekunder \n( >= diagnosis medis )", skala: [
      Skala(
          title: "Ya",
          skor: "15",
          value: "",
          isColor: (resikoJatuhMorseResponse.diagnosis.contains("Ya")
              ? true
              : false)),
      Skala(
          title: "Tidak",
          skor: "0",
          value: "",
          isColor: (resikoJatuhMorseResponse.diagnosis.contains("Tidak")
              ? true
              : false)),
    ]),
    Resiko(title: "Bantuan Ambulasi", skala: [
      Skala(
          title: "Furniture : dinding, meja, kursi, lemari",
          skor: "30",
          isColor: (resikoJatuhMorseResponse.ambulasi
                  .contains("Furniture : dinding, meja, kursi, lemari")
              ? true
              : false),
          value: ""),
      Skala(
        title: "Kruk / Tongkat / Walker",
        skor: "15",
        value: "",
        isColor: (resikoJatuhMorseResponse.ambulasi
                .contains("Kruk / Tongkat / Walker")
            ? true
            : false),
      ),
      Skala(
          title: "Di tempat tidur / butuh bantuan perawat / memakai kursi roda",
          isColor: (resikoJatuhMorseResponse.ambulasi.contains(
                  "Di tempat tidur / butuh bantuan perawat / memakai kursi roda")
              ? true
              : false),
          skor: "0",
          value: ""),
    ]),
    Resiko(title: "Terapi IV / anti koagulan", skala: [
      Skala(
        title: "Terapi intravena terus menerus",
        skor: "20",
        value: "",
        isColor: (resikoJatuhMorseResponse.terapi
                .contains("Terapi IV / anti koagulan")
            ? true
            : false),
      ),
    ]),
    Resiko(title: "Terapasang infuse", skala: [
      Skala(
          title: "Ya",
          skor: "20",
          value: "",
          isColor: (resikoJatuhMorseResponse.terpasangInfuse.contains("Ya")
              ? true
              : false)),
      Skala(
        title: "Tidak",
        skor: "0",
        value: "",
        isColor: (resikoJatuhMorseResponse.terpasangInfuse.contains("Tidak")
            ? true
            : false),
      ),
    ]),
    Resiko(title: "Gaya berjalan", skala: [
      Skala(
        title: "Terganggu",
        skor: "20",
        value: "",
        isColor: (resikoJatuhMorseResponse.gayaBerjalan.contains("Terganggu")
            ? true
            : false),
      ),
      Skala(
        title: "Lemah",
        skor: "10",
        value: "",
        isColor: (resikoJatuhMorseResponse.gayaBerjalan.contains("Lemah")
            ? true
            : false),
      ),
      Skala(
        title: "Normal/tirah baring/imobilisasi",
        skor: "0",
        value: "",
        isColor: (resikoJatuhMorseResponse.gayaBerjalan
                .contains("Normal/tirah baring/imobilisasi")
            ? true
            : false),
      ),
    ]),
    Resiko(title: "Status mental", skala: [
      Skala(
          title: "Sering lupa akan keterbatasan yang dimiliki",
          isColor: (resikoJatuhMorseResponse.statusMental
                  .contains("Sering lupa akan keterbatasan yang dimiliki")
              ? true
              : false),
          skor: "15",
          value: ""),
      Skala(
        title: "Sadar akan kemampuan diri sendiri",
        skor: "0",
        value: "",
        isColor: (resikoJatuhMorseResponse.statusMental
                .contains("Sadar akan kemampuan diri sendiri")
            ? true
            : false),
      ),
    ]),
  ];
}

List<Resiko> resikoEmty = [
  Resiko(title: "Riwayat Jatuh", skala: [
    Skala(title: "Ya", skor: "25", value: "", isColor: false),
    Skala(title: "Tidak", skor: "0", value: "", isColor: false),
  ]),
  Resiko(title: "Diagnosis sekunder \n( >= diagnosis medis )", skala: [
    Skala(title: "Ya", skor: "15", value: "", isColor: false),
    Skala(title: "Tidak", skor: "0", value: "", isColor: false),
  ]),
  Resiko(title: "Bantuan Ambulasi", skala: [
    Skala(
        title: "Funiture : dinding. meja, kursi, lemari",
        skor: "30",
        isColor: false,
        value: ""),
    Skala(title: "Kruk/tongkat/walker", skor: "15", value: "", isColor: false),
    Skala(
        title: "Di tempat tidur / butuh bantuan perawat / memakai kursi roda",
        skor: "0",
        isColor: false,
        value: ""),
  ]),
  Resiko(title: "Terapi IV / anti koagulan", skala: [
    Skala(
        title: "Terapi intravena terus menerus",
        isColor: false,
        skor: "20",
        value: ""),
  ]),
  Resiko(title: "Terapasang infuse", skala: [
    Skala(
      title: "Ya",
      skor: "20",
      value: "",
      isColor: false,
    ),
    Skala(
      title: "Tidak",
      skor: "0",
      value: "",
      isColor: false,
    ),
  ]),
  Resiko(title: "Gaya berjalan", skala: [
    Skala(
      title: "Terganggu",
      skor: "20",
      value: "",
      isColor: false,
    ),
    Skala(
      title: "Lemah",
      skor: "10",
      value: "",
      isColor: false,
    ),
    Skala(
      title: "Normal/tirah baring/imobilisasi",
      skor: "0",
      value: "",
      isColor: false,
    ),
  ]),
  Resiko(title: "Status mental", skala: [
    Skala(
      title: "Sering lupa akan keterbatasan yang dimiliki",
      skor: "15",
      value: "",
      isColor: false,
    ),
    Skala(
      title: "Sadar akan kemampuan diri sendiri",
      skor: "0",
      value: "",
      isColor: false,
    ),
  ]),
];
