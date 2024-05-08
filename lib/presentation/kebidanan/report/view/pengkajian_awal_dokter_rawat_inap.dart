import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/core/api/api_db.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/report/report_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/qr_code/custom_qr_widget.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class ReportPengkajianAwalDokterRawatInap extends StatefulWidget {
  const ReportPengkajianAwalDokterRawatInap({super.key});

  @override
  State<ReportPengkajianAwalDokterRawatInap> createState() =>
      _ReportPengkajianAwalKebidananRawatInapState();
}

class _ReportPengkajianAwalKebidananRawatInapState
    extends State<ReportPengkajianAwalDokterRawatInap> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;

    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocBuilder<ReportBloc, ReportState>(
      builder: (context, state) {
        if (state.status == ReportStatus.isLoadingReportPengkajianRawatInap) {
          return Scaffold(
            backgroundColor: ThemeColor.transparentColor,
            body: Loading.expandedLoading(),
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
              thickness: 5.sp,
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
                        // TAMPILKAN DATA // TAMPILKAN HEADER
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
                                        "Pengkajian Awal\nPasien Dewasa Rawat Inap",
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
                                  child: const VerticalDivider(),
                                ),
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
                                      // titleText(
                                      //     title: "Tanggal Lahir",
                                      //     subTitle: (singlePasien
                                      //                 .first.tglLahir.length >
                                      //             6)
                                      //         ? tglIndo(singlePasien
                                      //             .first.tglLahir
                                      //             .substring(0, 10))
                                      //         : ""),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "I. PENGKAJIAN AWAL MEDIS (di isi oleh dokter)",
                            textAlign: TextAlign.left,
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 8.sp),
                          ),
                        ),

                        // if (authState is Authenticated) ...[
                        //   Container(
                        //     color: Colors.white,
                        //     padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        //     child: TableDesk(
                        //       shape: const RoundedRectangleBorder(
                        //         side: BorderSide(color: Colors.white, width: 1),
                        //       ),
                        //       child: TableDeskRow(
                        //         border: const BorderSide(
                        //             width: 1, color: Colors.white),
                        //         gaps: [
                        //           TableGap.weight(),
                        //           TableGap.weight(),
                        //         ],
                        //         children: [
                        //           Container(
                        //             color: Colors.white,
                        //             padding: const EdgeInsets.all(8),
                        //             child: (state.reportPengkajianAwalMedis
                        //                         .asesmenDokter.tglMasuk.length >
                        //                     10)
                        //                 ? Text(
                        //                     "Tanggal Masuk         :       ${tglIndo(state.reportPengkajianAwalMedis.asesmenDokter.tglMasuk.substring(0, 10))}\nTanggal Asesmen         :       ${tglIndo(state.reportPengkajianAwalMedis.asesmenDokter.insertDttm.substring(0, 10))}",
                        //                     style: blackTextStyle.copyWith(
                        //                         fontSize: 6.sp),
                        //                     textAlign: TextAlign.left,
                        //                   )
                        //                 : Text(
                        //                     "Tanggal Masuk        :      ${(state.reportPengkajianAwalMedis.asesmenDokter.tglMasuk.length > 10) ? tglIndo(state.reportPengkajianAwalMedis.asesmenDokter.tglMasuk.substring(0, 10)) : state.reportPengkajianAwalMedis.asesmenDokter.tglMasuk}\nTanggal Asesmen         :       ${tglIndo(state.reportPengkajianAwalMedis.asesmenDokter.insertDttm.substring(0, 10))}",
                        //                     style: blackTextStyle.copyWith(
                        //                         fontSize: 6.sp),
                        //                     textAlign: TextAlign.left,
                        //                   ),
                        //           ),
                        //           Container(
                        //             color: Colors.white,
                        //             padding: const EdgeInsets.all(8),
                        //             child: Text(
                        //               "Jam                                :      "
                        //               "${state.reportPengkajianAwalMedis.asesmenDokter.jamMasuk}",
                        //               style: blackTextStyle.copyWith(
                        //                   fontSize: 6.sp),
                        //               textAlign: TextAlign.left,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ],

                        SizedBox(
                          height: 5.sp,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "1.  SUBJEKTIF : ",
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Keluhan Utama : \n${state.reportPengkajianAwalMedis.asesmenDokter.keluhUtama}",
                            style: blackTextStyle,
                          ),
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Riwayat Penyakit Sekarang : \n${state.reportPengkajianAwalMedis.asesmenDokter.rwtSekarang}",
                            style: blackTextStyle,
                          ),
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Riwayat Penyakit Dahulu : \n${state.reportPengkajianAwalMedis.asesmenDokter.rwtSekarang}",
                            style: blackTextStyle,
                          ),
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Riwayat Penyakit Keluarga : ",
                            style: blackTextStyle,
                          ),
                        ),

                        SizedBox(
                          height: 5.sp,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "2.  OBJEKTIF : ",
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Tanda-Tanda Vital : ",
                            style: blackTextStyle,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "TD : ${state.reportPengkajianAwalMedis.vitalSignDokter.td} mmHg.      RR : ${state.reportPengkajianAwalMedis.vitalSignDokter.pernafasan} x/menit.      Nadi : ${state.reportPengkajianAwalMedis.vitalSignDokter.nadi} x/menit      Temp : ${state.reportPengkajianAwalMedis.vitalSignDokter.suhu} °C\nBB : ${state.reportPengkajianAwalMedis.vitalSignDokter.beratBadan} kg.     TB : ${state.reportPengkajianAwalMedis.vitalSignDokter.tinggiBadan} cm.       Spo2 : ${state.reportPengkajianAwalMedis.vitalSignDokter.spo2} %    GCS: E :${state.reportPengkajianAwalMedis.fisikModel.gcsE}  V :${state.reportPengkajianAwalMedis.fisikModel.gcsV}  M :${state.reportPengkajianAwalMedis.fisikModel.gcsM}",
                            style: blackTextStyle.copyWith(fontSize: 5.sp),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Pemeriksaan Fisik : \n",
                            style: blackTextStyle,
                          ),
                        ),

                        pemeriksaanFisik(
                            title: "Kepala",
                            value: state
                                .reportPengkajianAwalMedis.fisikModel.kepala,
                            title1: "Limpa",
                            value1: state
                                .reportPengkajianAwalMedis.fisikModel.limpa),
                        pemeriksaanFisik(
                            title: "Mata",
                            value:
                                state.reportPengkajianAwalMedis.fisikModel.mata,
                            title1: "Ginjal",
                            value1: state
                                .reportPengkajianAwalMedis.fisikModel.ginjal),
                        pemeriksaanFisik(
                            title: "THT",
                            value:
                                state.reportPengkajianAwalMedis.fisikModel.tht,
                            title1: "Alat Kelamin",
                            value1: state.reportPengkajianAwalMedis.fisikModel
                                .alatKelamin),
                        pemeriksaanFisik(
                            title: "Mulut",
                            value: state
                                .reportPengkajianAwalMedis.fisikModel.mulut,
                            title1: "Anggota Gerak",
                            value1: state.reportPengkajianAwalMedis.fisikModel
                                .anggotaGerak),
                        pemeriksaanFisik(
                            title: "Leher",
                            value: state
                                .reportPengkajianAwalMedis.fisikModel.leher,
                            title1: "Refleks",
                            value1: state
                                .reportPengkajianAwalMedis.fisikModel.refleks),
                        pemeriksaanFisik(
                            title: "Dada",
                            value:
                                state.reportPengkajianAwalMedis.fisikModel.dada,
                            title1: "Kekuatan Otot",
                            value1: state
                                .reportPengkajianAwalMedis.fisikModel.otot),
                        pemeriksaanFisik(
                            title: "Jantung",
                            value: state
                                .reportPengkajianAwalMedis.fisikModel.jantung,
                            title1: "Kulit",
                            value1: state
                                .reportPengkajianAwalMedis.fisikModel.kulit),
                        pemeriksaanFisik(
                            title: "Paru",
                            value:
                                state.reportPengkajianAwalMedis.fisikModel.paru,
                            title1: "Kelenjar Getah Bening",
                            value1: state
                                .reportPengkajianAwalMedis.fisikModel.thyroid),
                        pemeriksaanFisik(
                            title: "Perut",
                            value: state
                                .reportPengkajianAwalMedis.fisikModel.perut,
                            title1: "RT/VT",
                            value1: state
                                .reportPengkajianAwalMedis.fisikModel.rtVt),
                        pemeriksaanFisik(
                            title: "Hati",
                            value:
                                state.reportPengkajianAwalMedis.fisikModel.hati,
                            title1: "",
                            value1: ""),
                        SizedBox(
                          height: 5.sp,
                        ),
                        // STATUS LOKALIS
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
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
                                  TableGap.width(450),
                                ],
                                children: [
                                  // === //
                                  (state.reportPengkajianAwalMedis.asesmenDokter
                                              .imageLokalis ==
                                          "")
                                      ? Container(
                                          height: 200.sp,
                                          width: Get.width,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              image: DecorationImage(
                                                fit: BoxFit.fitWidth,
                                                image: NetworkImage(
                                                  "${ApiDb.baseUrl}images/lokalis/lokalis_default.png",
                                                ),
                                              )),
                                        )
                                      : Container(
                                          height: 200.sp,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              image: DecorationImage(
                                                fit: BoxFit.fitWidth,
                                                image: NetworkImage(
                                                  "${ApiDb.baseUrl}images/lokalis/${state.reportPengkajianAwalMedis.asesmenDokter.imageLokalis}",
                                                ),
                                              )),
                                        ),

                                  // Text("data"),

                                  Center(
                                    child: Container(
                                      width: Get.width / 4.5,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: TableDesk(
                                        shape: const RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Colors.white, width: 1),
                                        ),
                                        child: Container(
                                          color: Colors.white,
                                          child: TableDeskRow(
                                            border: const BorderSide(
                                                width: 1, color: Colors.white),
                                            gaps: [
                                              TableGap.weight(),
                                            ],
                                            children: [
                                              // ROW PERTAMA
                                              Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(5.sp),
                                                    color: Colors.white,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "KODE GAMBAR",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: blackTextStyle
                                                            .copyWith(
                                                                fontSize: 6.sp),
                                                      ),
                                                    ),
                                                  ),

                                                  //  TABLE
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(5.sp),
                                                    width: Get.width,
                                                    child: Table(
                                                      border: TableBorder.all(
                                                          color: ThemeColor
                                                              .whiteColor),
                                                      columnWidths: const {
                                                        0: FlexColumnWidth(0.1),
                                                        1: FlexColumnWidth(0.6),
                                                      },
                                                      children: [
                                                        pemeriksaanFisikTableSatu(
                                                            judul1: "A",
                                                            judul2: "Abrasi"),
                                                        pemeriksaanFisikTableSatu(
                                                            judul1: "C",
                                                            judul2:
                                                                "Combustio"),
                                                        pemeriksaanFisikTableSatu(
                                                            judul1: "VA",
                                                            judul2:
                                                                "Vulnus Appertum"),
                                                        pemeriksaanFisikTableSatu(
                                                            judul1: "D",
                                                            judul2:
                                                                "Deformitas"),
                                                        pemeriksaanFisikTableSatu(
                                                            judul1: "U",
                                                            judul2: "Ulkus"),
                                                        pemeriksaanFisikTableSatu(
                                                            judul1: "H",
                                                            judul2: "Hematoma"),
                                                        pemeriksaanFisikTableSatu(
                                                            judul1: "L",
                                                            judul2:
                                                                "Lain-Lain (beri keterangan)"),
                                                        pemeriksaanFisikTableSatu(
                                                            judul1: "N",
                                                            judul2: "Nyeri"),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // ===== // PEMERIKSAAN FISIK
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
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
                                ],
                                children: [
                                  // ROW PERTAMA
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5.sp),
                                        color: Colors.white,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "PEMERIKSAAN PENUNJANG",
                                            textAlign: TextAlign.left,
                                            style: blackTextStyle.copyWith(
                                                fontSize: 6.sp),
                                          ),
                                        ),
                                      ),

                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.sp),
                                          child: Text("Laboratorium",
                                              textAlign: TextAlign.left,
                                              style: blackTextStyle)),

                                      Padding(
                                        padding: EdgeInsets.all(2.sp),
                                        child: Column(
                                          children: state
                                              .reportPengkajianAwalMedis.dPenLab
                                              .map((e) => Container(
                                                    width: Get.width,
                                                    decoration:
                                                        const BoxDecoration(),
                                                    margin: EdgeInsets.only(
                                                        right: 10.sp),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Container(
                                                          width: Get.width,
                                                          decoration:
                                                              const BoxDecoration(
                                                                  color: ThemeColor
                                                                      .greyColor),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            "Tanggal : ${tglIndo(e.tanggal)} Jam : ${e.tanggal.substring(11, 19)}",
                                                            textAlign:
                                                                TextAlign.start,
                                                            style:
                                                                blackTextStyle,
                                                          ),
                                                        ),
                                                        Container(
                                                            width: Get.width,
                                                            decoration: const BoxDecoration(
                                                                color: ThemeColor
                                                                    .darkGreyColor2),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2.sp),
                                                            child: Text(
                                                              e.namaKelompok,
                                                              style: blackTextStyle
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                            )),
                                                        SizedBox(
                                                          child: Table(
                                                            border:
                                                                TableBorder.all(
                                                                    color: Colors
                                                                        .black),
                                                            children: [
                                                              TableRow(
                                                                  children: [
                                                                    headerTitle(
                                                                        title:
                                                                            "Deskripsi"),
                                                                    headerTitle(
                                                                        title:
                                                                            "Satuan"),
                                                                    headerTitle(
                                                                        title:
                                                                            "Normal"),
                                                                    headerTitle(
                                                                        title:
                                                                            "Hasil"),
                                                                  ]),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          child: Table(
                                                            border: TableBorder
                                                                .all(),
                                                            children: e.penlab
                                                                .map((e) {
                                                              return TableRow(
                                                                  children: [
                                                                    textBox(
                                                                        title:
                                                                            "${e.pemeriksaanDeskripsi} ${e.hasil}"),
                                                                    textBox(
                                                                        title: e
                                                                            .satuan),
                                                                    textBox(
                                                                        title: e
                                                                            .normal),
                                                                    textBox(
                                                                        title: e
                                                                            .hasil),
                                                                  ]);
                                                            }).toList(),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                                      ),

                                      //  TABLE

                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.sp),
                                        child: Text(
                                          "Radiologi",
                                          textAlign: TextAlign.left,
                                          style: blackTextStyle,
                                        ),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.all(2.sp),
                                        child: Column(
                                          children:
                                              state.reportPengkajianAwalMedis
                                                  .radiologi
                                                  .map((e) => Container(
                                                        margin: EdgeInsets.only(
                                                            right: 10.sp),
                                                        width: Get.width,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: Get.width,
                                                              decoration: const BoxDecoration(
                                                                  color: ThemeColor
                                                                      .greyColor),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                "${e.namaKelompok} - Tangggal : ${tglIndo(e.tanggal)}",
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style:
                                                                    blackTextStyle,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              child: Table(
                                                                border: TableBorder.all(
                                                                    color: Colors
                                                                        .black),
                                                                children: [
                                                                  TableRow(
                                                                      children: [
                                                                        headerTitle(
                                                                            title:
                                                                                "Pemeriksaan : ")
                                                                      ]),
                                                                  ...e.radiologi
                                                                      .map((e) =>
                                                                          TableRow(children: [
                                                                            textBox(title: e.pemeriksaanDeskripsi)
                                                                          ])),
                                                                  TableRow(
                                                                      children: [
                                                                        headerTitle(
                                                                            title:
                                                                                "Uraian : ")
                                                                      ]),
                                                                  ...e.radiologi
                                                                      .map((e) =>
                                                                          TableRow(children: [
                                                                            textBox(title: e.uraian)
                                                                          ])),
                                                                  TableRow(
                                                                      children: [
                                                                        headerTitle(
                                                                            title:
                                                                                "Hasil : ")
                                                                      ]),
                                                                  ...e.radiologi
                                                                      .map((e) =>
                                                                          TableRow(
                                                                              children: [
                                                                                textBox(title: e.hasil)
                                                                              ]))
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ))
                                                  .toList(),
                                        ),
                                      ),

                                      // ======================== END PENDUNJANG MEDIK =========================== //
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
                            ),
                            child: Container(
                              color: Colors.white,
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.white),
                                gaps: [
                                  TableGap.weight(),
                                ],
                                children: [
                                  // ROW PERTAMA
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.all(5.sp),
                                          color: Colors.white,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "ASESMEN (DIAGNOSA KERJA)",
                                              textAlign: TextAlign.left,
                                              style: blackTextStyle.copyWith(
                                                  fontSize: 6.sp),
                                            ),
                                          )),
                                      Container(
                                          padding: EdgeInsets.all(5.sp),
                                          color: Colors.white,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: state
                                                .reportPengkajianAwalMedis
                                                .diagnosa
                                                .map((e) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "${e.diagnosa} - ${e.description} ,",
                                                  style: blackTextStyle,
                                                ),
                                              );
                                            }).toList(),
                                          )),
                                      //  TABLE
                                      SizedBox(
                                        height: 10.sp,
                                      ),

                                      Container(
                                          padding: EdgeInsets.all(5.sp),
                                          color: Colors.white,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "DIAGNOSA BANDING \n${state.reportPengkajianAwalMedis.asesmenDokter.diagnosaBanding}",
                                              textAlign: TextAlign.left,
                                              style: blackTextStyle.copyWith(
                                                  fontSize: 6.sp),
                                            ),
                                          )),
                                      SizedBox(
                                        height: 25.sp,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
                            ),
                            child: Container(
                              color: Colors.white,
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.white),
                                gaps: [
                                  TableGap.weight(),
                                ],
                                children: [
                                  // ROW PERTAMA
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5.sp),
                                        color: Colors.white,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "PLANNING : (Penatalaksanaan/Pengobatan/Rencana Tindakan / Konsultasi) \n\n${state.reportPengkajianAwalMedis.asesmenDokter.terapi}",
                                                textAlign: TextAlign.left,
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 6.sp),
                                              ),
                                              if (state
                                                      .reportPengkajianAwalMedis
                                                      .asesmenDokter
                                                      .konsulke !=
                                                  "") ...[
                                                Text(
                                                  "\nKonsul Ke${state.reportPengkajianAwalMedis.asesmenDokter.konsulke}",
                                                  textAlign: TextAlign.left,
                                                  style: blackTextStyle
                                                      .copyWith(fontSize: 6.sp),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                      ),

                                      //  TABLE

                                      SizedBox(
                                        height: 155.sp,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
                            ),
                            child: Container(
                              color: Colors.white,
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.white),
                                gaps: [
                                  TableGap.weight(),
                                ],
                                children: [
                                  // ROW PERTAMA
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5.sp),
                                        color: Colors.white,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "PROGNOSA : \n\n${state.reportPengkajianAwalMedis.asesmenDokter.prognosis}",
                                            textAlign: TextAlign.left,
                                            style: blackTextStyle.copyWith(
                                                fontSize: 6.sp),
                                          ),
                                        ),
                                      ),

                                      //  TABLE

                                      SizedBox(
                                        height: 55.sp,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
                            ),
                            child: Container(
                              color: Colors.white,
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.white),
                                gaps: [
                                  TableGap.weight(),
                                ],
                                children: [
                                  // ROW PERTAMA
                                  Column(
                                    children: [
                                      //  TABLE
                                      Container(
                                        padding: EdgeInsets.all(5.sp),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Dokter yang memeriksa ",
                                              textAlign: TextAlign.left,
                                              style: blackTextStyle.copyWith(
                                                  fontSize: 6.sp),
                                            ),
                                            SizedBox(
                                              height: 5.sp,
                                            ),
                                            if (state.reportPengkajianAwalMedis
                                                    .asesmenDokter.namaDokter ==
                                                "") ...[
                                              SizedBox(
                                                height: 25.sp,
                                              )
                                            ],
                                            if (state.reportPengkajianAwalMedis
                                                    .asesmenDokter.namaDokter !=
                                                "") ...[
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: SizedBox(
                                                  height: 55.sp,
                                                  child: CustomQrWidget(
                                                    dimension: 30.sp,
                                                    dataBarcode: state
                                                        .reportPengkajianAwalMedis
                                                        .asesmenDokter
                                                        .namaDokter,
                                                  ),
                                                ),
                                              ),
                                            ],
                                            SizedBox(
                                              height: 5.sp,
                                            ),
                                            if (state.reportPengkajianAwalMedis
                                                    .asesmenDokter.namaDokter ==
                                                "") ...[
                                              Text(
                                                "( ................................. )",
                                                style: blackTextStyle,
                                              )
                                            ],
                                            if (state.reportPengkajianAwalMedis
                                                    .asesmenDokter.namaDokter !=
                                                "") ...[
                                              Text(
                                                "( ${state.reportPengkajianAwalMedis.asesmenDokter.namaDokter})",
                                                style: blackTextStyle,
                                              )
                                            ],
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25.sp,
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

  TableRow pemeriksaanFisikTableUGD(
      {required String judul1,
      required String value1,
      required String judul2,
      required String value2}) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          judul1,
          textAlign: TextAlign.left,
          style: blackTextStyle.copyWith(fontSize: 6.sp),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          ": $value1",
          textAlign: TextAlign.left,
          style: blackTextStyle.copyWith(fontSize: 6.sp),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          judul2,
          textAlign: TextAlign.left,
          style: blackTextStyle.copyWith(fontSize: 6.sp),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          ": $value2",
          textAlign: TextAlign.left,
          style: blackTextStyle.copyWith(fontSize: 6.sp),
        ),
      ),
    ]);
  }

  TableRow pemeriksaanFisikTableSatu(
      {required String judul1, required String judul2}) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          judul1,
          textAlign: TextAlign.left,
          style: blackTextStyle.copyWith(fontSize: 6.sp),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          ":     $judul2",
          textAlign: TextAlign.left,
          style: blackTextStyle.copyWith(fontSize: 5.sp),
        ),
      ),
    ]);
  }

  Container headerTitle({required String title}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.sp),
      decoration: const BoxDecoration(color: ThemeColor.darkGreyColor),
      child: Center(
        child: Text(
          title,
          style: blackTextStyle.copyWith(
              fontWeight: FontWeight.bold, fontSize: 6.sp),
        ),
      ),
    );
  }

  Container pemeriksaanFisik({
    required String title,
    required String value,
    required String title1,
    required String value1,
  }) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: TableDesk(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 1),
        ),
        child: TableDeskRow(
          border: const BorderSide(width: 1, color: Colors.white),
          gaps: [
            TableGap.width(200),
            TableGap.width(20),
            TableGap.weight(),
            TableGap.width(200),
            TableGap.width(20),
            TableGap.weight(),
          ],
          children: [
            Container(
              padding: EdgeInsets.all(2.sp),
              decoration: const BoxDecoration(color: Colors.white),
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: blackTextStyle.copyWith(fontSize: 5.sp),
              ),
            ),
            Container(
              padding: EdgeInsets.all(2.sp),
              color: Colors.white,
              child: Text(
                ":",
                style: blackTextStyle.copyWith(fontSize: 5.sp),
              ),
            ),
            Container(
              padding: EdgeInsets.all(2.sp),
              decoration: const BoxDecoration(color: Colors.white),
              child: Text(
                value,
                style: blackTextStyle.copyWith(fontSize: 5.sp),
              ),
            ),
            Container(
              padding: EdgeInsets.all(2.sp),
              decoration: const BoxDecoration(color: Colors.white),
              child: Text(
                title1,
                textAlign: TextAlign.left,
                style: blackTextStyle.copyWith(fontSize: 5.sp),
              ),
            ),
            Container(
              padding: EdgeInsets.all(2.sp),
              color: Colors.white,
              child: Text(
                ":",
                style: blackTextStyle.copyWith(fontSize: 5.sp),
              ),
            ),
            Container(
              padding: EdgeInsets.all(2.sp),
              decoration: const BoxDecoration(color: Colors.white),
              child: Text(
                value1,
                style: blackTextStyle.copyWith(fontSize: 5.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding textBox({required String title}) {
    return Padding(
      padding: EdgeInsets.all(2.sp),
      child: Text(
        title,
        style: blackTextStyle.copyWith(fontSize: 6.sp),
      ),
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
