import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/qr_code/custom_qr_widget.dart';
import 'package:hms_app/presentation/report/bloc/pengkajian_awal_kebidanan_report/pengkajian_kebidanan_awal_kebidanan_bloc.dart';
import 'package:hms_app/presentation/report/component/header_with_nomor_rm_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class ReportPengkajianAwalKebidananWidget extends StatefulWidget {
  const ReportPengkajianAwalKebidananWidget({super.key});

  @override
  State<ReportPengkajianAwalKebidananWidget> createState() =>
      _ReportPengkajianAwalKebidananWidgetState();
}

class _ReportPengkajianAwalKebidananWidgetState
    extends State<ReportPengkajianAwalKebidananWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportPengkajianKebidananAwalKebidananBloc,
        PengkajianKebidananAwalKebidananState>(
      builder: (context, state) {
        if (state.status == PengkajianKebidananAwalKebidananStatus.loading) {
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
              child: ListView(
                controller: _scrollController,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 5.sp),
                      child: Text("RM.RI O6 A 1",
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
                        const HeaderWithNomorRMWidget(),
                        const Divider(),

                        SizedBox(height: 10.sp),

                        // =========== KELUHAN UTAMA
                        Container(
                          width: Get.width,
                          decoration:
                              const BoxDecoration(color: ThemeColor.whiteColor),
                          child: Table(
                            border:
                                TableBorder.all(color: ThemeColor.blackColor),
                            columnWidths: const {
                              1: FlexColumnWidth(3),
                            },
                            children: [
                              TableRow(children: [
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Keluhan Utama",
                                        textAlign: TextAlign.left,
                                        style: blackTextStyle.copyWith(
                                            fontSize: 6.sp))),
                                Container(
                                  height: 20.sp,
                                  padding: EdgeInsets.all(1.sp),
                                  color: ThemeColor.whiteColor,
                                  child: Text(
                                    state.report.pengkajian.keluhanUtama,
                                    style:
                                        blackTextStyle.copyWith(fontSize: 6.sp),
                                  ),
                                )
                              ]),
                            ],
                          ),
                        ),

                        // ============== RIWAYAT PENYAKIT SEKARANG
                        Container(
                          width: Get.width,
                          decoration:
                              const BoxDecoration(color: ThemeColor.whiteColor),
                          child: Table(
                            border:
                                TableBorder.all(color: ThemeColor.blackColor),
                            columnWidths: const {
                              1: FlexColumnWidth(3),
                            },
                            children: [
                              TableRow(children: [
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Riwayat Penyakit Sekarang",
                                      textAlign: TextAlign.left,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    )),
                                Container(
                                  height: 20.sp,
                                  padding: const EdgeInsets.all(2.0),
                                  color: ThemeColor.whiteColor,
                                  child: Text(
                                    state.report.pengkajian.rwtPenyakit,
                                    style:
                                        blackTextStyle.copyWith(fontSize: 6.sp),
                                  ),
                                )
                              ]),
                            ],
                          ),
                        ),

                        // ====== RIWAYAT PENYAKIT DAHULU
                        Container(
                          width: Get.width,
                          decoration:
                              const BoxDecoration(color: ThemeColor.whiteColor),
                          child: Table(
                            border:
                                TableBorder.all(color: ThemeColor.blackColor),
                            columnWidths: const {
                              1: FlexColumnWidth(3),
                            },
                            children: [
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Riwayat Penyakit Dahulu",
                                    textAlign: TextAlign.left,
                                    style:
                                        blackTextStyle.copyWith(fontSize: 6.sp),
                                  ),
                                ),
                                Container(
                                  height: 20.sp,
                                  color: ThemeColor.whiteColor,
                                  child: Text(
                                    state.report.pengkajian.penyakitDahulu,
                                    style:
                                        blackTextStyle.copyWith(fontSize: 6.sp),
                                  ),
                                )
                              ]),
                            ],
                          ),
                        ),

                        // Riwayat Penyakit Keluarga
                        Container(
                          width: Get.width,
                          decoration:
                              const BoxDecoration(color: ThemeColor.whiteColor),
                          child: Table(
                            border:
                                TableBorder.all(color: ThemeColor.blackColor),
                            columnWidths: const {
                              1: FlexColumnWidth(3),
                            },
                            children: [
                              TableRow(children: [
                                Padding(
                                  padding: EdgeInsets.all(2.sp),
                                  child: Text(
                                    "Riwayat Penyakit Keluarga",
                                    textAlign: TextAlign.left,
                                    style:
                                        blackTextStyle.copyWith(fontSize: 6.sp),
                                  ),
                                ),
                                Container(
                                  height: 20.sp,
                                  color: ThemeColor.whiteColor,
                                  padding: EdgeInsets.all(2.sp),
                                  child: Wrap(
                                    children: [
                                      SizedBox(
                                        width: 80.sp,
                                        child: Row(
                                          children: state
                                              .report.penyakitKeluarga
                                              .map((e) => Text(
                                                    "${e.alergi}, ",
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontSize: 6.sp),
                                                  ))
                                              .toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                            ],
                          ),
                        ),

                        // === Keluhan Yang Menyertai
                        Container(
                          width: Get.width,
                          decoration:
                              const BoxDecoration(color: ThemeColor.whiteColor),
                          child: Table(
                            border:
                                TableBorder.all(color: ThemeColor.blackColor),
                            columnWidths: const {
                              1: FlexColumnWidth(3),
                            },
                            children: [
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Keluhan Yang Menyertai",
                                    textAlign: TextAlign.left,
                                    style:
                                        blackTextStyle.copyWith(fontSize: 6.sp),
                                  ),
                                ),
                                Container(
                                  height: 20.sp,
                                  color: ThemeColor.whiteColor,
                                  child: Wrap(
                                    children: [
                                      SizedBox(
                                        width: 80.sp,
                                        child: Row(
                                          children: [
                                            Text(
                                              state.report.pengkajian
                                                  .keluhanMenyertai,
                                              style: blackTextStyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                            ],
                          ),
                        ),

                        // Riwayat Menstruasi
                        Container(
                          width: Get.width,
                          decoration:
                              const BoxDecoration(color: ThemeColor.whiteColor),
                          child: Table(
                            border:
                                TableBorder.all(color: ThemeColor.blackColor),
                            columnWidths: const {
                              1: FlexColumnWidth(3),
                            },
                            children: [
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Riwayat Menstruasi",
                                    textAlign: TextAlign.left,
                                    style:
                                        blackTextStyle.copyWith(fontSize: 6.sp),
                                  ),
                                ),
                                Container(
                                  color: ThemeColor.whiteColor,
                                  child: Wrap(
                                    children: [
                                      SizedBox(
                                        width: 80.sp,
                                        child: Row(
                                          children: [
                                            Text(
                                              state
                                                  .report.pengkajian.menstruasi,
                                              style: blackTextStyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                            ],
                          ),
                        ),

                        // SIKLUS HAID
                        Container(
                          width: Get.width,
                          decoration:
                              const BoxDecoration(color: ThemeColor.whiteColor),
                          child: Table(
                            border:
                                TableBorder.all(color: ThemeColor.blackColor),
                            columnWidths: const {
                              1: FlexColumnWidth(3),
                            },
                            children: [
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Siklus Haid",
                                    textAlign: TextAlign.left,
                                    style:
                                        blackTextStyle.copyWith(fontSize: 6.sp),
                                  ),
                                ),
                                Container(
                                  color: ThemeColor.whiteColor,
                                  child: Wrap(
                                    children: [
                                      SizedBox(
                                        width: 80.sp,
                                        child: Row(
                                          children: [
                                            Text(
                                              state
                                                  .report.pengkajian.siklusHaid,
                                              style: blackTextStyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                            ],
                          ),
                        ),

                        // Riwayat PERNIKAHAN
                        Container(
                          width: Get.width,
                          decoration:
                              const BoxDecoration(color: ThemeColor.whiteColor),
                          child: Table(
                            border:
                                TableBorder.all(color: ThemeColor.blackColor),
                            columnWidths: const {
                              1: FlexColumnWidth(3),
                            },
                            children: [
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Riwayat Pernikahan",
                                    textAlign: TextAlign.left,
                                    style:
                                        blackTextStyle.copyWith(fontSize: 6.sp),
                                  ),
                                ),
                                Container(
                                  color: ThemeColor.whiteColor,
                                  child: Wrap(
                                    children: [
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            Text(
                                              state.report.pengkajian
                                                  .rwtPernikahan,
                                              style: blackTextStyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                            ],
                          ),
                        ),

                        // TANDA TANDA VITAL
                        Container(
                          width: Get.width,
                          decoration:
                              const BoxDecoration(color: ThemeColor.whiteColor),
                          child: Table(
                            border:
                                TableBorder.all(color: ThemeColor.blackColor),
                            columnWidths: const {
                              1: FlexColumnWidth(3),
                            },
                            children: [
                              TableRow(children: [
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.sp),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Tanda - Tanda Vital",
                                              textAlign: TextAlign.left,
                                              style: blackTextStyle.copyWith(
                                                  fontSize: 6.sp))),
                                      Text(
                                          "  TD :  ${state.report.vitalSign.tekananDarah} mmHg   Pernafasan :  ${state.report.vitalSign.pernapasan} x/menit    Suhu :  ${state.report.vitalSign.suhu} °c     Nadi :  ${state.report.vitalSign.nadi} x/menit",
                                          style: blackTextStyle),
                                      Text(
                                          "  TD :  ${state.report.vitalSign.ddj} x/I   Berat Badan :  ${state.report.vitalSign.pernapasan} x/menit    Tinggi Badan :  ${state.report.vitalSign.tinggiBadan} cm     GCS : E${state.report.vitalSign.gcsE} V${state.report.vitalSign.gcsV} M${state.report.vitalSign.gcsM}",
                                          style: blackTextStyle),
                                      SizedBox(
                                        height: 5.sp,
                                      )
                                    ],
                                  ),
                                )
                              ]),
                            ],
                          ),
                        ),

                        // ==== //
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Riwayat Kehamilan",
                                style:
                                    blackTextStyle.copyWith(fontSize: 6.sp))),

                        // === //
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
                                TableGap.weight(),
                                TableGap.weight(),
                                TableGap.weight(),
                                TableGap.weight(),
                                TableGap.weight(),
                                TableGap.weight(),
                                TableGap.weight(),
                                TableGap.weight(),
                                TableGap.weight(),
                                TableGap.weight(),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "No. ",
                                    style:
                                        blackTextStyle.copyWith(fontSize: 4.sp),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "Tahun Persalinan",
                                    style:
                                        blackTextStyle.copyWith(fontSize: 4.sp),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "Tempat Bersalin",
                                    style:
                                        blackTextStyle.copyWith(fontSize: 4.sp),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "Umur Kehamilan",
                                    style:
                                        blackTextStyle.copyWith(fontSize: 4.sp),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "Jenis Persalinan",
                                    style:
                                        blackTextStyle.copyWith(fontSize: 4.sp),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "Penolong",
                                    style:
                                        blackTextStyle.copyWith(fontSize: 4.sp),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "Penyulit",
                                    style:
                                        blackTextStyle.copyWith(fontSize: 4.sp),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "Nifas",
                                    style:
                                        blackTextStyle.copyWith(fontSize: 4.sp),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "JK",
                                    style:
                                        blackTextStyle.copyWith(fontSize: 4.sp),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "Berat Badan",
                                    style:
                                        blackTextStyle.copyWith(fontSize: 4.sp),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "Keadaan Sekarang",
                                    style:
                                        blackTextStyle.copyWith(fontSize: 4.sp),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ...state.report.kehamilan.asMap().entries.map(
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
                                      TableGap.weight(),
                                      TableGap.weight(),
                                      TableGap.weight(),
                                      TableGap.weight(),
                                      TableGap.weight(),
                                      TableGap.weight(),
                                      TableGap.weight(),
                                      TableGap.weight(),
                                      TableGap.weight(),
                                      TableGap.weight(),
                                      TableGap.weight(),
                                    ],
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          (e.key + 1).toString(),
                                          style: blackTextStyle.copyWith(
                                              fontSize: 4.sp),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          e.value.tahun,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 4.sp),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          e.value.tempat,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 4.sp),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          e.value.umur,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 4.sp),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          e.value.jenisPersalinan,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 4.sp),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          e.value.penolong,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 4.sp),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          e.value.penyulit,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 4.sp),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          e.value.nifas,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 4.sp),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          e.value.jk,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 4.sp),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          e.value.bb,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 4.sp),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          e.value.keadaanSekarang,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 4.sp),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                        // RIWAYAT KEHAMILAN
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Riwayat Pengobatan dirumah",
                              style: blackTextStyle.copyWith(fontSize: 6.sp),
                            )),

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
                                  TableGap.weight(),
                                  TableGap.weight(),
                                  TableGap.weight(),
                                  TableGap.weight(),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "Nama Obat ",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 4.sp),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                      color: Colors.white,
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "Dosis",
                                        style: blackTextStyle.copyWith(
                                            fontSize: 4.sp),
                                        textAlign: TextAlign.left,
                                      )),
                                  Container(
                                      color: Colors.white,
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "Cara Pemberian",
                                        style: blackTextStyle.copyWith(
                                            fontSize: 4.sp),
                                        textAlign: TextAlign.left,
                                      )),
                                  Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "Frekuensi",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 4.sp),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "Waktu Terakhir Pemberian",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 4.sp),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            )),

                        ...state.report.pengobatanDirumah.asMap().entries.map(
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
                                      TableGap.weight(),
                                      TableGap.weight(),
                                      TableGap.weight(),
                                      TableGap.weight(),
                                      TableGap.weight(),
                                    ],
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          e.value.namaObat,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 4.sp),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          e.value.dosis,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 4.sp),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          e.value.caraPemberian,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 4.sp),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          e.value.frekuensi,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 4.sp),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          e.value.waktu.substring(0, 10),
                                          style: blackTextStyle.copyWith(
                                              fontSize: 4.sp),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Reaksi yang muncul",
                            style: blackTextStyle.copyWith(fontSize: 6.sp),
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
                                  TableGap.weight(),
                                  TableGap.width(300),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "Pengkajian Kebidanan ",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 4.sp),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                      color: Colors.white,
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "Masalah Kebidanan",
                                        style: blackTextStyle.copyWith(
                                            fontSize: 4.sp),
                                        textAlign: TextAlign.left,
                                      )),
                                ],
                              ),
                            )),

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
                                  TableGap.weight(),
                                  TableGap.width(300),
                                ],
                                children: [
                                  Column(
                                    children: [
                                      pengkajianKebidanan(
                                          title: "",
                                          value:
                                              "Kehamilan Sekarang : G ${state.report.pengkajian.gravida} Ab ${state.report.pengkajian.abortus} P ${state.report.pengkajian.para}"),
                                      pengkajianKebidanan(
                                          value:
                                              "Haid  : ${state.report.pengkajian.haid}",
                                          title: ""),
                                      if (state.report.pengkajian.haidTerakhir
                                              .length >
                                          10) ...[
                                        pengkajianKebidanan(
                                            title: "",
                                            value:
                                                "Haid Terakhir  : ${state.report.pengkajian.haidTerakhir.substring(0, 10)}"),
                                      ],

                                      pengkajianKebidanan(
                                          title: "",
                                          value:
                                              "Usia Kehamilan  : ${state.report.pengkajian.usiaKehamilan}"),
                                      pengkajianKebidanan(
                                          value:
                                              "Hamil Muda  : ${state.report.pengkajian.hamilMuda}",
                                          title: ""),
                                      pengkajianKebidanan(
                                          value:
                                              "Hamil Tua  : ${state.report.pengkajian.hamilTua}",
                                          title: ""),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text("OBSTETRIK",
                                              style: blackTextStyle)),
                                      // pengkajianKebidanan(
                                      //     title: "", value: "Pelebaran Vena "),
                                      // pengkajianKebidanan(
                                      //     title: "",
                                      //     value: "Luka Operasi ${state
                                      //         .report.pengkajian.}"),
                                      pengkajianKebidanan(
                                          title: "",
                                          value:
                                              "Palpasi Leopold I  : ${state.report.pengkajian.leopold1}"),
                                      pengkajianKebidanan(
                                          title: "",
                                          value:
                                              "Palpasi Leopold II  : ${state.report.pengkajian.leopold2}"),
                                      pengkajianKebidanan(
                                          title: "",
                                          value:
                                              "Palpasi Leopold III : ${state.report.pengkajian.leopold3}"),
                                      pengkajianKebidanan(
                                          title: "",
                                          value:
                                              "Palpasi Leopold IV  : ${state.report.pengkajian.leopold3}"),
                                      pengkajianKebidanan(
                                          value:
                                              "TFU  : ${state.report.pengkajian.tfu}",
                                          title: ""),
                                      pengkajianKebidanan(
                                          value:
                                              "TBJ  : ${state.report.pengkajian.tbj}",
                                          title: ""),
                                      // pengkajianKebidanan(
                                      //     value: "Auskultasi ${state.report.pengkajian.abortus}",
                                      //     title:
                                      //         ""),
                                      pengkajianKebidanan(
                                          value: "HIS  : ", title: ""),
                                      pengkajianKebidanan(
                                          value:
                                              "Inspeksi  :  ${state.report.pengkajian.inspekuloP}",
                                          title: ""),
                                      pengkajianKebidanan(
                                          value:
                                              "Pembukaan  : ${state.report.pengkajian.pemeriksaaanDalam}",
                                          title: ""),
                                      pengkajianKebidanan(
                                        value:
                                            "Presentasi  : ${state.report.pengkajian.presepsiSakit}",
                                        title: "",
                                      ),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "GYNEKOLOGI",
                                            style: blackTextStyle,
                                          )),
                                      pengkajianKebidanan(
                                          value:
                                              "Hodge  : ${state.report.pengkajian.toString()}",
                                          title: ""),
                                      pengkajianKebidanan(
                                          value:
                                              "Inspeksi  : ${state.report.pengkajian.inspekuloP}",
                                          title: ""),
                                      pengkajianKebidanan(
                                          value:
                                              "Palpasi  : ${state.report.pengkajian.pemeriksaaanDalam}",
                                          title: ""),
                                      pengkajianKebidanan(
                                          value:
                                              "Inspekulo ${state.report.pengkajian.inspekuloP}",
                                          title: ""),
                                      pengkajianKebidanan(
                                          value:
                                              "Pemeriksaan dalam  : ${state.report.pengkajian.pemeriksaaanDalam}",
                                          title: ""),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "PENGKAJIAN PERSISTEM",
                                            style: blackTextStyle,
                                          )),
                                      pengkajianKebidanan(
                                          value:
                                              "KEPALA  : ${state.report.fisik.kepala.toUpperCase()}",
                                          title: ""),
                                      pengkajianKebidanan(
                                          value:
                                              "MATA  : ${state.report.fisik.mata.toUpperCase()}",
                                          title: ""),
                                      pengkajianKebidanan(
                                          value:
                                              "TELINGA  : ${state.report.fisik.telinga.toUpperCase()}",
                                          title: ""),
                                      pengkajianKebidanan(
                                          value:
                                              "LEHER DAN BAHU  : ${state.report.fisik.leherDahBahu.toUpperCase()}",
                                          title: ""),
                                      pengkajianKebidanan(
                                          value:
                                              "MULUT  : ${state.report.fisik.mulut.toUpperCase()}",
                                          title: ""),
                                      pengkajianKebidanan(
                                          value:
                                              "GIGI  : ${state.report.fisik.gigi.toUpperCase()}",
                                          title: ""),
                                      pengkajianKebidanan(
                                          value:
                                              "HIDUNG  : ${state.report.fisik.hidung.toUpperCase()}",
                                          title: ""),
                                      pengkajianKebidanan(
                                          value:
                                              "TENGGOROKAN  : ${state.report.fisik.tenggorokan.toUpperCase()}",
                                          title: ""),
                                      pengkajianKebidanan(
                                          value:
                                              "PAYUDARA  : ${state.report.fisik.payudara.toUpperCase()}",
                                          title: ""),
                                      pengkajianKebidanan(
                                          value:
                                              "ABDOMEN  : ${state.report.fisik.abdomen.toUpperCase()}",
                                          title: ""),
                                      pengkajianKebidanan(
                                          value:
                                              "NUTRISI & HIDRASI  : ${state.report.fisik.nutrisiDanHidrasi.toUpperCase()}",
                                          title: ""),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "PENGKAJIAN NUTRISI",
                                            style: blackTextStyle,
                                          )),
                                      Container(
                                          color: Colors.white,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.sp),
                                          child: TableDesk(
                                            shape: const RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: Colors.black,
                                                  width: 1),
                                            ),
                                            child: TableDeskRow(
                                              border: const BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                              gaps: [
                                                TableGap.weight(),
                                                TableGap.width(150),
                                              ],
                                              children: [
                                                Container(
                                                  color: Colors.white,
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Text(
                                                    "Parameter ",
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontSize: 4.sp),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                Container(
                                                    color: Colors.white,
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Text(
                                                      "Skala",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontSize: 4.sp),
                                                      textAlign: TextAlign.left,
                                                    )),
                                              ],
                                            ),
                                          )),
                                      boxPengkajianKebidanan(
                                          value:
                                              "Apakah pasien mengalami penurunan BB yang tidak diinginkan dalam 6 bulan terakhir ?"),
                                      boxPengkajianKebidanan(
                                          value: state.report.nutrisi.n1),
                                      boxPengkajianKebidanan(
                                          value: state.report.nutrisi.n2),
                                      boxPengkajianKebidananTotal(
                                          value: "Total",
                                          nilaiTotal: state.report.nutrisi.nilai
                                              .toString()),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "ELIMINASI DAN PELEPASAN",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      boxPengkajianKebidanan(
                                          value:
                                              "Eliminasi BAK ${state.report.pengkajian.eliminasiBak}"),
                                      boxPengkajianKebidanan(
                                          value:
                                              "Eliminasi BAB ${state.report.pengkajian.eliminasiBab}"),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "AKTIVITAS / ISTIRAHAT",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      boxPengkajianKebidanan(
                                          value: "Tidur / Istirahat"),
                                      boxPengkajianKebidanan(
                                          value: "Aktivitas"),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "SKOR AKTIFITAS",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      boxPengkajianKebidanan(
                                          value:
                                              "Mandi ${state.report.pengkajian.sistemMandi}"),
                                      boxPengkajianKebidanan(
                                          value:
                                              "Berpakaian: ${state.report.pengkajian.sistemBerpakaian}"),
                                      boxPengkajianKebidanan(
                                          value:
                                              "Makan / Mandi : ${state.report.pengkajian.sistemMakan}"),
                                      boxPengkajianKebidanan(
                                          value:
                                              "Eliminasi ${state.report.pengkajian.eliminasi}"),
                                      boxPengkajianKebidanan(
                                          value:
                                              "Mobilisasi di TT :  ${state.report.pengkajian.mobilisasi}"),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "SISTIM KARDIO-RESPIRATORI",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      boxText(
                                          data:
                                              "KARDIOVASKULER : ${state.report.pengkajian.kardiovaskuler}"),
                                      boxText(
                                          data:
                                              "RESPIRATORI ${state.report.pengkajian.respiratori}"),

                                      /// ==== ///
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "SISTEM PERFUSI SECEBRAL",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      boxText(data: "Demam"),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "THERMOREGULASI",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      boxText(data: "Demam"),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "SISTEM PERFUSI PERIFIER",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      boxText(data: "TAK"),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "SISTEM PENCERNAAN",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      boxText(data: "TAK"),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "INTEGUMEN",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      boxText(data: "Odema"),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "KENYAMANAN",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "PROTEKSI",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "RESIKO JATUH",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                          )),

                                      boxFungsional(
                                          desc: state.report.fungsional.f1,
                                          title: "1.",
                                          value: "Makan"),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "Status Mental",
                                            style: blackTextStyle.copyWith(
                                                fontSize: 5.sp),
                                          )),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "SEKSUAL & REPRODUKSI",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      boxText(
                                          data:
                                              "Hamil ${state.report.pengkajian.hamil}"),
                                      boxText(
                                          data:
                                              "Pendarahan ${state.report.pengkajian.sistemPendarahan}"),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "PENGKAJIAN FUNGSIONAL",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      boxFungsional(
                                          desc: state.report.fungsional.f1,
                                          title: "1.",
                                          value: "Makan"),
                                      boxFungsional(
                                          desc: state.report.fungsional.f2,
                                          title: "2.",
                                          value: "Aktifias di Toilet"),
                                      boxFungsional(
                                          desc: state.report.fungsional.f3,
                                          title: "3.",
                                          value:
                                              "Berpindah dari kursi roda ke tempat tidur / sebaliknya, termasuk duduk di tempat tidur"),
                                      boxFungsional(
                                          desc: state.report.fungsional.f4,
                                          title: "4.",
                                          value:
                                              "Kebersihan diri, mencuci muka, menyisir rambut, menggosok gigi"),
                                      boxFungsional(
                                          desc: state.report.fungsional.f5,
                                          title: "5.",
                                          value: "Mandi"),
                                      boxFungsional(
                                          desc: state.report.fungsional.f6,
                                          title: "6.",
                                          value: "Berjalan di permukaan datar"),
                                      boxFungsional(
                                          desc: state.report.fungsional.f7,
                                          title: "7.",
                                          value: "Naik turun tangga"),
                                      boxFungsional(
                                          desc: state.report.fungsional.f8,
                                          title: "8.",
                                          value: "Berpakaian"),
                                      boxFungsional(
                                          desc: state.report.fungsional.f9,
                                          title: "9.",
                                          value: "Mengontrol defekasi"),
                                      boxFungsional(
                                          desc: state.report.fungsional.f10,
                                          title: "10.",
                                          value: "Mengotrol Berkemih"),
                                      boxFungsional(
                                          desc: state.report.fungsional.nilai
                                              .toString(),
                                          title: "",
                                          value: "TOTAL"),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "KOMUNIKASI / PENDIDIKAN / PENGAJARAN",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "Hambatan Bahasa ${state.report.pengkajian.hambatanBahasa}",
                                            style: blackTextStyle.copyWith(
                                                fontSize: 5.sp),
                                          )),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "Cara Belajar yang disukai ${state.report.pengkajian.caraBelajar}",
                                            style: blackTextStyle.copyWith(
                                                fontSize: 5.sp),
                                          )),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "Bahasa sehari-hari ${state.report.pengkajian.bahasaSehari}",
                                            style: blackTextStyle.copyWith(
                                                fontSize: 5.sp),
                                          )),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "DATA PSIKOLOGIS, SOSIAL, EKONOMI DAN SPIRITUAL",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "Psikologis ${state.report.pengkajian.spikologis}",
                                            style: blackTextStyle.copyWith(
                                                fontSize: 5.sp),
                                          )),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "Hambatan Sosial ${state.report.pengkajian.hambatanSosial}",
                                            style: blackTextStyle.copyWith(
                                                fontSize: 5.sp),
                                          )),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "Hambatan Ekonomi ${state.report.pengkajian.ekonomi}",
                                            style: blackTextStyle.copyWith(
                                                fontSize: 5.sp),
                                          )),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "Hambatan Spritual",
                                            style: blackTextStyle.copyWith(
                                                fontSize: 5.sp),
                                          )),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "RESPONSE EMOSI ",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            state.report.pengkajian
                                                .responseEmosi,
                                            style: blackTextStyle.copyWith(
                                                fontSize: 5.sp),
                                          )),
                                      Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 5.sp),
                                          color: Colors.white,
                                          child: Text(
                                            "NILAI KEPERCAYAAN",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      // pengkajianKebidanan(
                                      //     title: "",
                                      //     value:
                                      //         "Menjalankan Ibadah ${state.report.pengkajian}"),
                                      pengkajianKebidanan(
                                          title: "",
                                          value:
                                              "Persepsi terhadap sakit ${state.report.pengkajian.presepsiSakit}"),
                                      pengkajianKebidanan(
                                          title: "",
                                          value:
                                              "Nilai/aturan Khusus dalam kepercayaan ${state.report.pengkajian.nilaiKepercayaan}"),
                                    ],
                                  ),
                                  Container(
                                      color: Colors.white,
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: state.report.diagnosa
                                            .map((e) => Text(
                                                  e.namaDiagnosa,
                                                  style: blackTextStyle
                                                      .copyWith(fontSize: 6.sp),
                                                  textAlign: TextAlign.left,
                                                ))
                                            .toList(),
                                      )),
                                ],
                              ),
                            )),

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
                                  TableGap.width(500),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 4.sp),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                      color: Colors.white,
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "Pematang Siantar Tgl : ${state.report.pengkajian.tglMasuk}",
                                        style: blackTextStyle.copyWith(
                                            fontSize: 4.sp),
                                        textAlign: TextAlign.left,
                                      )),
                                ],
                              ),
                            )),
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
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Karu/Katim",
                                          style: blackTextStyle.copyWith(
                                              fontSize: 4.sp),
                                          textAlign: TextAlign.center,
                                        ),
                                        CustomQrWidget(
                                          dimension: 30.sp,
                                          dataBarcode: state.report.karu.nama,
                                        ),
                                        Text(
                                          "( ${state.report.karu.nama} )",
                                          style: blackTextStyle.copyWith(
                                              fontSize: 4.sp),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      color: Colors.white,
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Bidan yang Bertugas",
                                            style: blackTextStyle.copyWith(
                                                fontSize: 4.sp),
                                            textAlign: TextAlign.center,
                                          ),
                                          CustomQrWidget(
                                            dimension: 30.sp,
                                            dataBarcode: state.report.user.nama,
                                          ),
                                          Text(
                                            "( ${state.report.user.nama} )",
                                            style: blackTextStyle.copyWith(
                                                fontSize: 4.sp),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            )),

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

  Container pengkajianKebidanan(
      {required String value, required String title}) {
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
            TableGap.weight(),
            TableGap.width(150),
          ],
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              child: Text(
                "$value ",
                style: blackTextStyle.copyWith(fontSize: 4.sp),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              child: Text(
                "",
                style: blackTextStyle.copyWith(fontSize: 5.sp),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container boxText({required String data}) {
    return Container(
        width: Get.width,
        padding: EdgeInsets.only(left: 5.sp),
        color: Colors.white,
        child: Text(
          data,
          style: blackTextStyle.copyWith(fontSize: 5.sp),
        ));
  }

  Container boxPengkajianKebidanan({required String value}) {
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
              TableGap.weight(),
              TableGap.width(150),
            ],
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child: Text(
                  value,
                  style: blackTextStyle.copyWith(fontSize: 4.sp),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "",
                    style: blackTextStyle.copyWith(fontSize: 4.sp),
                    textAlign: TextAlign.left,
                  )),
            ],
          ),
        ));
  }

  Container boxPengkajianKebidananTotal(
      {required String value, required String nilaiTotal}) {
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
              TableGap.weight(),
              TableGap.width(150),
            ],
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child: Text(
                  value,
                  style: blackTextStyle.copyWith(fontSize: 4.sp),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    nilaiTotal,
                    style: blackTextStyle.copyWith(fontSize: 4.sp),
                    textAlign: TextAlign.left,
                  )),
            ],
          ),
        ));
  }

  Container boxFungsional({
    required String title,
    required String value,
    required String desc,
  }) {
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
              TableGap.width(50),
              TableGap.weight(),
              TableGap.width(200),
            ],
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child: Text(
                  title,
                  style: blackTextStyle.copyWith(fontSize: 4.sp),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    value,
                    style: blackTextStyle.copyWith(fontSize: 4.sp),
                    textAlign: TextAlign.left,
                  )),
              Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    desc,
                    style: blackTextStyle.copyWith(fontSize: 4.sp),
                    textAlign: TextAlign.left,
                  )),
            ],
          ),
        ));
  }

  Container boxNilaiKepercayaan({required String value}) {
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
              TableGap.weight(),
              TableGap.width(200),
              TableGap.width(200),
            ],
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child: Text(
                  value,
                  style: blackTextStyle.copyWith(fontSize: 4.sp),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Dengan\nBantuan",
                    style: blackTextStyle.copyWith(fontSize: 4.sp),
                    textAlign: TextAlign.left,
                  )),
              Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Mandiri",
                    style: blackTextStyle.copyWith(fontSize: 4.sp),
                    textAlign: TextAlign.left,
                  )),
            ],
          ),
        ));
  }
}
