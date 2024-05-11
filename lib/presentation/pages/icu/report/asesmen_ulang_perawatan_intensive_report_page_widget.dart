import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/icu/bloc/report_icu/report_icu_bloc.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class ReportAsesmenUlangPerawatIntensivePageWidget extends StatefulWidget {
  const ReportAsesmenUlangPerawatIntensivePageWidget({super.key});

  @override
  State<ReportAsesmenUlangPerawatIntensivePageWidget> createState() =>
      _ReportAsesmenUlangPerawatIntensivePageWidgetState();
}

class _ReportAsesmenUlangPerawatIntensivePageWidgetState
    extends State<ReportAsesmenUlangPerawatIntensivePageWidget> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocBuilder<ReportIcuBloc, ReportIcuState>(
      builder: (context, state) {
        if (state.status == ReportIcuStatus.loading) {
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
              controller: scrollController,
              trackVisibility: false,
              radius: Radius.circular(5.sp),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  margin: EdgeInsets.only(right: 7.sp),
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
                                  side:
                                      BorderSide(color: Colors.black, width: 1),
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
                                            "ASSESMEN ULANG\nPERAWATAN INTENSIVE",
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
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(2.sp)),
                              child: TableDesk(
                                shape: const RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: Colors.black, width: 1),
                                ),
                                child: Container(
                                  color: Colors.grey,
                                  child: TableDeskRow(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    gaps: [
                                      TableGap.weight(),
                                    ],
                                    children: [
                                      Container(
                                        color: Colors.grey,
                                        padding: EdgeInsets.all(2.sp),
                                        child: Center(
                                          child: Text(
                                            "RIWAYAT KEPERAWATAN",
                                            textAlign: TextAlign.center,
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8.sp),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // ISIAN RIWAYAT KEPERAWATAN
                            TitleWidget.pemeriksaanFisik(
                                title: "Assesmen", value: "Tanggal "),
                            TitleWidget.pemeriksaanFisik(
                                title: "Jenis Assesmen", value: " "),
                            TitleWidget.pemeriksaanFisik(
                                title: "Cara Masuk", value: " "),
                            TitleWidget.pemeriksaanFisik(
                                title: "Keluhan Utama", value: "\n\n"),
                            TitleWidget.pemeriksaanFisik(
                                title: "Riwayat Penyakit Sekarang",
                                value: "\n\n\n"),
                            TitleWidget.pemeriksaanFisik(
                                title: "Riwayat Penyakit Dahulu",
                                value: "\n\n\n"),
                            TitleWidget.pemeriksaanFisik(
                                title: "Riwayat Penyakit Keluarga",
                                value: "\n\n\n"),
                            TitleWidget.pemeriksaanFisik(
                                title: "Riwayat Pengobatan Dirumah",
                                value: "\n\n\n"),

                            Padding(
                              padding: EdgeInsets.all(2.sp),
                              child: Container(
                                width: Get.width,
                                decoration: const BoxDecoration(),
                                margin: EdgeInsets.only(right: 10.sp),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      child: Table(
                                        border: TableBorder.all(
                                            color: Colors.black),
                                        children: [
                                          TableRow(children: [
                                            TitleWidget.headerTitle(
                                                title: "Nama Obat"),
                                            TitleWidget.headerTitle(
                                                title: "Dosis"),
                                            TitleWidget.headerTitle(
                                                title: "Cara\nPemberian"),
                                            TitleWidget.headerTitle(
                                                title: "Frekuensi"),
                                            TitleWidget.headerTitle(
                                                title:
                                                    "Waktu Terakhir\nPemberian"),
                                          ]),
                                        ],
                                      ),
                                    ),
                                    // (state.perawat.riwayatPengobatan.isNotEmpty)
                                    //     ? SizedBox(
                                    //         child: Table(
                                    //           border: TableBorder.all(),
                                    //           children: state
                                    //               .perawat.riwayatPengobatan
                                    //               .map((e) {
                                    //             return TableRow(children: [
                                    //               textBox(
                                    //                   title: "${e.namaObat} "),
                                    //               textBox(title: e.dosis),
                                    //               textBox(
                                    //                   title: e.caraPemberian),
                                    //               textBox(title: e.frekuensi),
                                    //               textBox(
                                    //                   title: tglIndo(e.waktu
                                    //                       .toString()
                                    //                       .substring(0, 10))),
                                    //             ]);
                                    //           }).toList(),
                                    //         ),
                                    //       )
                                    //     : const SizedBox(),
                                  ],
                                ),
                              ),
                            ),
                            TitleWidget.pemeriksaanFisik(
                                title: "Riwayat Alergi", value: "\n\n\n"),
                            TitleWidget.pemeriksaanFisik(
                                title: "Reaksi yang muncul", value: "\n\n\n"),
                            TitleWidget.pemeriksaanFisik(
                                title: "Riwayat transfusi darah",
                                value: "\n\n\n"),
                            TitleWidget.pemeriksaanFisik(
                                title: "Riwayat Merokok", value: "\n\n\n"),
                            TitleWidget.pemeriksaanFisik(
                                title: "Riwayat minum-minuman keras",
                                value: "\n\n\n"),
                            TitleWidget.pemeriksaanFisik(
                                title:
                                    "Apakah alcohol/obat-obatan mempegaruhi hidup Anda?",
                                value: "\n\n\n"),

                            // Container(
                            //   decoration: BoxDecoration(
                            //       color: Colors.grey,
                            //       borderRadius: BorderRadius.circular(2.sp)),
                            //   child: TableDesk(
                            //     shape: const RoundedRectangleBorder(
                            //       side:
                            //           BorderSide(color: Colors.black, width: 1),
                            //     ),
                            //     child: Container(
                            //       color: Colors.grey,
                            //       child: TableDeskRow(
                            //         border: const BorderSide(
                            //             width: 1, color: Colors.black),
                            //         gaps: [
                            //           TableGap.weight(),
                            //         ],
                            //         children: [
                            //           Container(
                            //             color: Colors.grey,
                            //             padding: EdgeInsets.all(2.sp),
                            //             child: Center(
                            //               child: Text(
                            //                 "ASESMEN",
                            //                 textAlign: TextAlign.center,
                            //                 style: blackTextStyle.copyWith(
                            //                     fontWeight: FontWeight.bold,
                            //                     fontSize: 8.sp),
                            //               ),
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),

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
                                          TableGap.weight(),
                                          TableGap.width(100.sp),
                                        ],
                                        children: [
                                          Container(
                                              color: Colors.grey,
                                              padding: const EdgeInsets.all(8),
                                              child: Center(
                                                child: Text(
                                                  "ASSESMEN",
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 6.sp),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )),
                                          Container(
                                            color: Colors.grey,
                                            padding: const EdgeInsets.all(8),
                                            child: Center(
                                              child: Text(
                                                "RUMUSAN\nMASALAH",
                                                style: blackTextStyle.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 6.sp),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ]))),

// PEMEERIKSAAN FISIK
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
                                          TableGap.weight(),
                                          TableGap.width(100.sp),
                                        ],
                                        children: [
                                          Container(
                                            color: Colors.white,
                                            child: Padding(
                                              padding: EdgeInsets.all(2.sp),
                                              child: Container(
                                                width: Get.width,
                                                decoration:
                                                    const BoxDecoration(),
                                                margin: EdgeInsets.only(
                                                    right: 10.sp),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // == TAMPILKAN SISTEM PENGKAJIAN
                                                    Text("PEMERIKSAAN FISIK",
                                                        style: blackTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),

                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "TD",
                                                            value: "mmHG"),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Suhu",
                                                            value: "°C"),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Nadi",
                                                            value: "x/mnt"),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "RR",
                                                            value: "x/mnt"),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "GCS",
                                                        value:
                                                            "E..... M..... V....."),

                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Kesadaran",
                                                            value: ""),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Kepala",
                                                            value: ""),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Rambut",
                                                            value: ""),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Wajah",
                                                            value: ""),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Mata",
                                                            value: ""),

                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Telinga",
                                                            value: ""),

                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Hidung",
                                                            value: ""),

                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Mulut",
                                                            value: ""),

                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Gigi",
                                                            value: ""),

                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Lidah",
                                                            value: ""),

                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title:
                                                                "Tenggorokan",
                                                            value: ""),

                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Leher",
                                                            value: ""),

                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Dada",
                                                            value: ""),

                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Respirasi",
                                                            value: ""),

                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Jantung",
                                                            value: ""),

                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Integumen",
                                                            value: ""),

                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title:
                                                                "Ekstremitas",
                                                            value: ""),

                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Genetalia",
                                                            value: ""),

                                                    SizedBox(
                                                      height: 5.sp,
                                                    ),

                                                    Text(
                                                      "PENGKAJIAN PERSISTEM \nPengkajian Primer\n",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "A. AIRWAY",
                                                            value: ""),

                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title:
                                                                "B. BREATHING",
                                                            value: ""),

                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "C. CIRCULATION",
                                                        value: ""),

                                                    SizedBox(
                                                      height: 5.sp,
                                                    ),

                                                    Text(
                                                      "\nPengkajian Sekunder\n",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),

                                                    Text(
                                                      "1. NUTRISI & HIDRASI",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),

                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Makan",
                                                            value: ""),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Pada bayi",
                                                            value: ""),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Minum",
                                                            value: ""),

                                                    Text(
                                                      "2. ELIMINASI DAN PELEPASAN",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),

                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title:
                                                                "Eliminasi BAK",
                                                            value: ""),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title:
                                                                "Eliminasi BAB",
                                                            value: ""),

                                                    Text(
                                                      "3. AKTIVITAS / ISTIRAHAT",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Tidur/Istirahat",
                                                        value: ""),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title:
                                                                "Aktivitas :",
                                                            value: ""),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Berjalan :",
                                                            value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Penggunaan alat bantu :",
                                                        value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Kekuatan otot :",
                                                        value: ""),

                                                    Text(
                                                      "SKOR AKTIFITAS",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                    ),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Mandi :",
                                                            value: ""),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title:
                                                                "Berpakaian :",
                                                            value: ""),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title:
                                                                "Makan/minum :",
                                                            value: ""),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title:
                                                                "Eliminasi :",
                                                            value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Mobilisasi di TT :",
                                                        value: ""),

                                                    Text(
                                                      "4. PERFUSI SEREBRAL",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "",
                                                            value: ""),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Pupil",
                                                            value: ""),

                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Refleks cahaya",
                                                        value: ""),

                                                    Text(
                                                      "5. PERFUSI RENAL",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "",
                                                            value: ""),
                                                    Text(
                                                      "6. PERFUSI GASTROINTESTINAL",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "",
                                                            value: ""),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Abdomen",
                                                            value: ""),
                                                    Text(
                                                      "7. THERMOREGULASI",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "",
                                                            value: ""),
                                                    Text(
                                                      "8. KENYAMANAN",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),

                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Nyeri/Tidak nyaman",
                                                        value: ""),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Kualitas",
                                                            value: ""),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Pola",
                                                            value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Nyeri mempengaruhi",
                                                        value: ""),

                                                    Text(
                                                      "9. PROTEKSI",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title:
                                                                "Status mental",
                                                            value: ""),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Kejang",
                                                            value: ""),
                                                    Text(
                                                      "Pengkajian resiko jatuh pada dewasa:",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontSize: 5.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    Text(
                                                      "Keterangan:\n0-24     : Tidak bersiko/resiko rendah\n25-44   : Resiko sedang -> dipasang gelang kuning\n>=45     : Resiko Tinggi  -> dipasang gelang kuning",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontSize: 5.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Keamanan",
                                                            value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Pasang pengaman tempat tidur",
                                                        value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Bel mudah dijangkau",
                                                        value: ""),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title:
                                                                "Penglihatan",
                                                            value: ""),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title:
                                                                "Pendengaran",
                                                            value: ""),

                                                    Text(
                                                      "10. SEKSUAL & REPRODUKSI:",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontSize: 5.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Perempuan",
                                                            value: ""),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Hamil",
                                                            value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Pemeriksaan cervix terakhir",
                                                        value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Pemeriksaan payudara sendiri",
                                                        value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Mammografi terakhir tanggal",
                                                        value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Penggunaan alat kontrasepsi",
                                                        value: ""),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Laki-Laki",
                                                            value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Masalah prostat",
                                                        value: ""),
                                                    Text(
                                                      "11. KEBUTUHAN KOMUNIKASI/PENDIDIKAN DAN PENGAJARAN:",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontSize: 5.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Bicara",
                                                            value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Bahasa sehari-hari",
                                                        value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Perlu penerjemah",
                                                        value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Bahasa isyarat",
                                                        value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Hambatan belajar",
                                                        value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Cara belajar yang disukai",
                                                        value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Tingkat pendidikan",
                                                        value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Potensi kebutuhan pembelajaran",
                                                        value: ""),
                                                    Text(
                                                      "12. RESPON EMOSI :",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontSize: 5.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "",
                                                            value: ""),
                                                    Text(
                                                      "13. SISTEM SOSIAL :",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontSize: 5.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    TitleWidget
                                                        .pemeriksaanFisik(
                                                            title: "Pekerjaan",
                                                            value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Tinggal bersama",
                                                        value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Kondisi lingkungan dirumah (khusus geriatri, anak dan penyakit tertentu)",
                                                        value: ""),
                                                    Text(
                                                      "14. NILAI KEPERCAYAAN :",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontSize: 5.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Menjalankan ibadah",
                                                        value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Kunjungan pemimpin agama/bimbingan spriritual",
                                                        value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Nilai/aturan khusus dalam kepercayaan",
                                                        value: ""),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Container(
                                          //   color: Colors.white,
                                          //   child: Column(
                                          //     children: (state
                                          //             .perawat
                                          //             .asuhanKeperawatan
                                          //             .isNotEmpty)
                                          //         ? state
                                          //             .perawat.asuhanKeperawatan
                                          //             .map((asuhan) {
                                          //             return Padding(
                                          //               padding: EdgeInsets.all(
                                          //                   2.sp),
                                          //               child: Container(
                                          //                 width: Get.width,
                                          //                 decoration:
                                          //                     const BoxDecoration(),
                                          //                 margin:
                                          //                     EdgeInsets.only(
                                          //                         right: 0.sp),
                                          //                 child: Column(
                                          //                   mainAxisAlignment:
                                          //                       MainAxisAlignment
                                          //                           .start,
                                          //                   crossAxisAlignment:
                                          //                       CrossAxisAlignment
                                          //                           .start,
                                          //                   children: [
                                          //                     SizedBox(
                                          //                       child: Table(
                                          //                         border: TableBorder.all(
                                          //                             color: Colors
                                          //                                 .black),
                                          //                         children: [
                                          //                           // TableRow(
                                          //                           //     children: [
                                          //                           //       headerLeftTitle(
                                          //                           //           title: "${asuhan.diagnosa.judul}\nTanggal :${(asuhan.tanggal.length > 10) ? tglIndo(asuhan.tanggal.substring(0, 10)) : asuhan.tanggal}"),
                                          //                           //     ]),
                                          //                         ],
                                          //                       ),
                                          //                     ),
                                          //                     SizedBox(
                                          //                       child: Table(
                                          //                         border:
                                          //                             TableBorder
                                          //                                 .all(),
                                          //                         children: asuhan
                                          //                             .deskripsiSlki
                                          //                             .map((e) {
                                          //                           return TableRow(
                                          //                               children: [
                                          //                                 //  textBox(
                                          //                                 //     title: "${e.namaSllki} "),
                                          //                               ]);
                                          //                         }).toList(),
                                          //                       ),
                                          //                     ),
                                          //                   ],
                                          //                 ),
                                          //               ),
                                          //             );
                                          //           }).toList()
                                          //         : [],
                                          //   ),
                                          // ),
                                          Text("data"),
                                        ]))),

                            // ==== //
                            SizedBox(
                              height: 15.sp,
                            ),
                            SizedBox(
                              child: Table(
                                border: TableBorder.all(color: Colors.white),
                                children: [
                                  TableRow(children: [
                                    TitleWidget.centerTextBox(
                                        title:
                                            "KARU/KATIM\n\n\n\n\n\n\n\n( ........................... )"),
                                    Column(
                                      children: [
                                        TitleWidget.centerTextBox(
                                            title: "PERAWAT YANG BERTUGAS"),
                                        // if (state
                                        //         .perawat
                                        //         .asesmenPerawat
                                        //         .nama !=
                                        //     "") ...[
                                        //   CustomQrWidget(
                                        //     dimension:
                                        //         30.sp,
                                        //     dataBarcode: state
                                        //         .perawat
                                        //         .asesmenPerawat
                                        //         .nama,
                                        //   ),
                                        //   centerTextBox(
                                        //     title:
                                        //         "(  ${state.perawat.asesmenPerawat.nama}  )",
                                        //   ),
                                        // ],
                                        // if (state
                                        //         .perawat
                                        //         .asesmenPerawat
                                        //         .nama ==
                                        //     "")
                                        //   ...[],
                                        SizedBox(
                                          height: 35.sp,
                                        ),
                                        TitleWidget.centerTextBox(
                                          title:
                                              "( ................................. )",
                                        ),
                                      ],
                                    )
                                  ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
