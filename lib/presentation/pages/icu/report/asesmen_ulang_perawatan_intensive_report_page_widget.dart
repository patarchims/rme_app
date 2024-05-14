import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/qr_code/custom_qr_widget.dart';
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
        if (state.status == ReportIcuStatus.isLoadingGet) {
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
                                title: "Assesmen",
                                value:
                                    "${state.reportIntensiveIcuModel.asesmen.asesmen} Tanggal :${state.reportIntensiveIcuModel.asesmen.asalMasuk} "),
                            TitleWidget.pemeriksaanFisik(
                                title: "Jenis Assesmen",
                                value: state
                                    .reportIntensiveIcuModel.asesmen.asesmen),
                            TitleWidget.pemeriksaanFisik(
                                title: "Cara Masuk",
                                value: state
                                    .reportIntensiveIcuModel.asesmen.caraMasuk),
                            TitleWidget.pemeriksaanFisik(
                                title: "Keluhan Utama",
                                value:
                                    "${state.reportIntensiveIcuModel.asesmen.keluhan}\n"),
                            TitleWidget.pemeriksaanFisik(
                                title: "Riwayat Penyakit Sekarang",
                                value:
                                    "${state.reportIntensiveIcuModel.asesmen.riwayatPenyakit}\n\n"),
                            TitleWidget.pemeriksaanFisik(
                                title: "Riwayat Penyakit Dahulu",
                                value:
                                    "${state.reportIntensiveIcuModel.asesmen.riwayatPenyakit}\n\n"),
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
                                    (state.reportIntensiveIcuModel
                                            .pengobatanDirumah.isNotEmpty)
                                        ? SizedBox(
                                            child: Table(
                                              border: TableBorder.all(),
                                              children: state
                                                  .reportIntensiveIcuModel
                                                  .pengobatanDirumah
                                                  .map((e) {
                                                return TableRow(children: [
                                                  TitleWidget.textBox(
                                                      title: "${e.namaObat} "),
                                                  TitleWidget.textBox(
                                                      title: e.dosis),
                                                  TitleWidget.textBox(
                                                      title: e.caraPemberian),
                                                  TitleWidget.textBox(
                                                      title: e.frekuensi),
                                                  TitleWidget.textBox(
                                                      title: tglIndo(e.waktu
                                                          .toString()
                                                          .substring(0, 10))),
                                                ]);
                                              }).toList(),
                                            ),
                                          )
                                        : const SizedBox(),
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
                                                            value: " mmHG"),
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

                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Kesadaran",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pemeriksaanFisik
                                                            .kesadaran),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Kepala",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pemeriksaanFisik
                                                            .kepala),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Rambut",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pemeriksaanFisik
                                                            .rambut),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Wajah",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pemeriksaanFisik
                                                            .wajah),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Mata",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pemeriksaanFisik
                                                            .mata),

                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Telinga",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pemeriksaanFisik
                                                            .telinga),

                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Hidung",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pemeriksaanFisik
                                                            .hidung),

                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Mulut",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pemeriksaanFisik
                                                            .mulut),

                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Gigi",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pemeriksaanFisik
                                                            .gigi),

                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Lidah",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pemeriksaanFisik
                                                            .lidah),

                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Tenggorokan",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pemeriksaanFisik
                                                            .tenggorokan),

                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Leher",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pemeriksaanFisik
                                                            .leher),

                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Dada",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pemeriksaanFisik
                                                            .dada),

                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Respirasi",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pemeriksaanFisik
                                                            .respirasi),

                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Jantung",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pemeriksaanFisik
                                                            .jantung),

                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Integumen",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pemeriksaanFisik
                                                            .integumen),

                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Ekstremitas",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pemeriksaanFisik
                                                            .ekstremitas),

                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Genetalia",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pemeriksaanFisik
                                                            .genetalia),

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
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "A. AIRWAY",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .airway),

                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "B. BREATHING",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .breathing),

                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "C. CIRCULATION",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .circulation),

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

                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Makan",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .makan),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Pada bayi",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .padaBayi),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Minum",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .minum),

                                                    Text(
                                                      "2. ELIMINASI DAN PELEPASAN",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),

                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Eliminasi BAK",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .eliminasiBak),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Eliminasi BAB",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .eliminasiBab),

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
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .aktivitasIstirahat),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Aktivitas :",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .aktivitas),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Berjalan :",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .berjalan),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Penggunaan alat bantu :",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .penggunaanAlatBantu),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Kekuatan otot :",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .kenyamanan),

                                                    Text(
                                                      "SKOR AKTIFITAS",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                    ),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Mandi :",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .mandi),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Berpakaian :",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .berpakaian),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Makan/minum :",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .minum),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Eliminasi :",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .sistemEliminasi),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Mobilisasi di TT :",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .sistemMobilisasi),

                                                    Text(
                                                      "4. PERFUSI SEREBRAL",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .perfusiSerebral,
                                                        value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Pupil",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .pupil),

                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Refleks cahaya",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .refleksCahaya),

                                                    Text(
                                                      "5. PERFUSI RENAL",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .perfusiRenal,
                                                        value: ""),
                                                    Text(
                                                      "6. PERFUSI GASTROINTESTINAL",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .pefusiGastroinestinal,
                                                        value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Abdomen",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .abdomen),
                                                    Text(
                                                      "7. THERMOREGULASI",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .thermoregulasi,
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
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .nyeriMempengaruhi),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Kualitas",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .kualitas),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Pola",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .pola),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Nyeri mempengaruhi",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .nyeriMempengaruhi),

                                                    Text(
                                                      "9. PROTEKSI",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Status mental",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .statusMental),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Kejang",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .kejang),
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
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Keamanan",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .kenyamanan),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Pasang pengaman tempat tidur",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .pasangPengamanTempatTidur),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Bel mudah dijangkau",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .belMudaDijangkau),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Penglihatan",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .penglihatan),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Pendengaran",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .pendengaran),

                                                    Text(
                                                      "10. SEKSUAL & REPRODUKSI:",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontSize: 5.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    // TitleWidget
                                                    //     .pemeriksaanFisik(
                                                    //         title: "Perempuan",
                                                    //         value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Hamil",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .hamil),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Pemeriksaan cervix terakhir",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .pemeriksaanCervixTerakhir),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Pemeriksaan payudara sendiri",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .pemeriksaanPayudaraSendiri),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Mammografi terakhir tanggal",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .mamografiTerakhirTanggal),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Penggunaan alat kontrasepsi",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .penggunaanAlatKontrasepsi),
                                                    // TitleWidget
                                                    //     .pemeriksaanFisik(
                                                    //         title: "Laki-Laki",
                                                    //         value: ""),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Masalah prostat",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .penggunaanAlatKontrasepsi),
                                                    Text(
                                                      "11. KEBUTUHAN KOMUNIKASI/PENDIDIKAN DAN PENGAJARAN:",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontSize: 5.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Bicara",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .bicara),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Bahasa sehari-hari",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .bahasaSehariHari),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Perlu penerjemah",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .perluPenerjemah),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Bahasa isyarat",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .bahasaSehariHari),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Hambatan belajar",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .hambatanBelajar),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Cara belajar yang disukai",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .caraBelajarDisukai),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Tingkat pendidikan",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .tingkatPendidikan),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Potensi kebutuhan pembelajaran",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .potensialKebutuhanPembelajaran),
                                                    Text(
                                                      "12. RESPON EMOSI :",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontSize: 5.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .responseEmosi),
                                                    Text(
                                                      "13. SISTEM SOSIAL :",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontSize: 5.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title: "Pekerjaan",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .potensialKebutuhanPembelajaran),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Tinggal bersama",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .tingkatBersama),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Kondisi lingkungan dirumah (khusus geriatri, anak dan penyakit tertentu)",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .kondisiLingkunganDirumah),
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
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .menjalankanIbadah),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Kunjungan pemimpin agama/bimbingan spriritual",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .kunjunganPemimpin),
                                                    TitleWidget.pemeriksaanFisik(
                                                        title:
                                                            "Nilai/aturan khusus dalam kepercayaan",
                                                        value: state
                                                            .reportIntensiveIcuModel
                                                            .pengkajianPersistem
                                                            .nilaiAturanKhusus),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            color: Colors.white,
                                            child: Column(
                                              children: (state
                                                      .reportIntensiveIcuModel
                                                      .asuhanKeperawatan
                                                      .isNotEmpty)
                                                  ? state
                                                      .reportIntensiveIcuModel
                                                      .asuhanKeperawatan
                                                      .map((asuhan) {
                                                      return Padding(
                                                        padding: EdgeInsets.all(
                                                            2.sp),
                                                        child: Container(
                                                          width: Get.width,
                                                          decoration:
                                                              const BoxDecoration(),
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 0.sp),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                child: Table(
                                                                  border: TableBorder.all(
                                                                      color: Colors
                                                                          .black),
                                                                  children: [
                                                                    TableRow(
                                                                        children: [
                                                                          TitleWidget.headerLeftTitle(
                                                                              title: "${asuhan.diagnosa.judul}\nTanggal :${(asuhan.tanggal.length > 10) ? tglIndo(asuhan.tanggal.substring(0, 10)) : asuhan.tanggal}"),
                                                                        ]),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                child: Table(
                                                                  border:
                                                                      TableBorder
                                                                          .all(),
                                                                  children: asuhan
                                                                      .deskripsiSlki
                                                                      .map((e) {
                                                                    return TableRow(
                                                                        children: [
                                                                          TitleWidget.textBox(
                                                                              title: "${e.namaSllki} "),
                                                                        ]);
                                                                  }).toList(),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }).toList()
                                                  : [],
                                            ),
                                          ),
                                          // Text("data"),
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
                                        if (state.reportIntensiveIcuModel
                                                .asesmen.nama !=
                                            "") ...[
                                          CustomQrWidget(
                                            dimension: 30.sp,
                                            dataBarcode: state
                                                .reportIntensiveIcuModel
                                                .asesmen
                                                .nama,
                                          ),
                                          TitleWidget.centerTextBox(
                                            title:
                                                "(  ${state.reportIntensiveIcuModel.asesmen.nama}  )",
                                          ),
                                        ],
                                        if (state.reportIntensiveIcuModel
                                                .asesmen.nama ==
                                            "")
                                          ...[],
                                        SizedBox(
                                          height: 35.sp,
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
