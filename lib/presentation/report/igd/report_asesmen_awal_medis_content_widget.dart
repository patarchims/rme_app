import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/core/api/api_db.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/qr_code/custom_qr_widget.dart';
import 'package:hms_app/presentation/component/resources/app_config.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/report/bloc/asesmen_medis_igd_dokter/asesmen_medis_igd_dokter_bloc.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class ReportAsesmenAwalMedisContentWidget extends StatelessWidget {
  const ReportAsesmenAwalMedisContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocBuilder<ReportAsesmenMedisIgdDokterBloc,
        AsesmenMedisIgdDokterState>(
      builder: (context, state) {
        if (state.status == AsesmenMedisStatus.loading) {
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
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: const HeaderAllWidget(),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 5.sp, vertical: 5.sp),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                            style: BorderStyle.solid,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // TAMPILKAN DATA
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(2.sp)),
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
                                    TableGap.weight(),
                                  ],
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: Center(
                                        child: Text(
                                          "III. ASESMEN AWAL MEDIS",
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
                                          boxTitle(
                                              judul1: "Nama Pasien",
                                              judul2: singlePasien
                                                  .first.namaPasien),
                                          boxTitle(
                                              judul1: "Tanggal Lahir",
                                              judul2: (singlePasien.first
                                                          .tglLahir.length >
                                                      10)
                                                  ? singlePasien.first.tglLahir
                                                      .substring(0, 10)
                                                  : singlePasien
                                                      .first.tglLahir),
                                          boxTitle(
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
                                    TableGap.weight(),
                                  ],
                                  children: [
                                    // === //
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          (state.reportIGD.asesmen.tglMasuk
                                                      .length >
                                                  10)
                                              ? "Tanggal :   ${state.reportIGD.asesmen.tglMasuk.substring(0, 10)} "
                                              : "Tanggal ",
                                          style: blackTextStyle.copyWith(
                                              fontWeight: FontWeight.normal),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),

                                    // === //
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "Jam : ${state.reportIGD.asesmen.jamMasuk} WIB",
                                          style: blackTextStyle.copyWith(
                                              fontWeight: FontWeight.normal),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
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
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "Keluhan Utama    : \n\n${state.reportIGD.asesmen.keluhUtama}",
                                          style: blackTextStyle.copyWith(
                                              fontWeight: FontWeight.normal),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
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
                                    // === //
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "Riwayat Penyakit Sekarang    : \n\n${state.reportIGD.asesmen.rwtSekarang}\n\n\n",
                                          style: blackTextStyle.copyWith(
                                              fontWeight: FontWeight.normal),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
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
                                    // === //
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Riwayat Penyakit Dahulu    :\n",
                                              style: blackTextStyle.copyWith(
                                                  fontWeight:
                                                      FontWeight.normal),
                                              textAlign: TextAlign.left,
                                            ),
                                            Container(
                                              color: Colors.white,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: state
                                                      .reportIGD.riwayat
                                                      .map((e) {
                                                    return Text(
                                                      "${e.tglMasuk.substring(0, 10)}-${e.riwayatSekarang.toString()} , ",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                      textAlign: TextAlign.left,
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
                                    // === //
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Riwayat Penyakit Keluarga    : ",
                                              style: blackTextStyle.copyWith(
                                                  fontWeight:
                                                      FontWeight.normal),
                                              textAlign: TextAlign.left,
                                            ),
                                            Container(
                                              color: Colors.white,
                                              width: Get.width,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: state
                                                      .reportIGD.alergi
                                                      .map((e) {
                                                    return Text(
                                                      "${e.alergi}, ",
                                                      style: blackTextStyle,
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Container(
                            decoration:
                                const BoxDecoration(color: Colors.white),
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
                                              "OBJEKTIF \nTanda-Tanda Vital",
                                              textAlign: TextAlign.left,
                                              style: blackTextStyle.copyWith(
                                                  fontSize: 6.sp),
                                            ),
                                          ),
                                        ),

                                        //  TABLE
                                        Container(
                                          padding: EdgeInsets.all(5.sp),
                                          width: Get.width,
                                          child: Table(
                                            border: TableBorder.all(
                                                color: ThemeColor.whiteColor),
                                            columnWidths: const {
                                              0: FlexColumnWidth(0.2),
                                              1: FlexColumnWidth(0.6),
                                              2: FlexColumnWidth(0.2),
                                              3: FlexColumnWidth(0.6),
                                            },
                                            children: [
                                              pemeriksaanFisikTableUGD(
                                                  judul1: "GCS",
                                                  value1:
                                                      "E : ${state.reportIGD.fisik.gcsE} M : ${state.reportIGD.fisik.gcsM} M : ${state.reportIGD.fisik.gcsM}",
                                                  judul2: "Kesadaran",
                                                  value2: state.reportIGD.fisik
                                                      .kesadaran),
                                              pemeriksaanFisikTableUGD(
                                                  judul1: "TD",
                                                  value1: state
                                                      .reportIGD.vitalSIgn.td,
                                                  value2: state.reportIGD
                                                      .vitalSIgn.pernafasan,
                                                  judul2: "Pernafasan"),
                                              pemeriksaanFisikTableUGD(
                                                  judul1: "Nadi",
                                                  value1: state
                                                      .reportIGD.vitalSIgn.nadi,
                                                  value2: state
                                                      .reportIGD.vitalSIgn.spo2,
                                                  judul2: "SPO2"),
                                              pemeriksaanFisikTableUGD3(
                                                judul1: "Suhu",
                                                judul2: state
                                                    .reportIGD.vitalSIgn.suhu,
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
                          ),

                          // if(AppConstant.appSetup)
                          if (AppConstant.appSetup == AppSetup.methodist) ...[
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: TableDesk(
                                shape: const RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: Colors.black, width: 1),
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
                                                "PEMERIKSAAN FISIK",
                                                textAlign: TextAlign.left,
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 6.sp),
                                              ),
                                            ),
                                          ),

                                          //  TABLE
                                          Container(
                                            padding: EdgeInsets.all(5.sp),
                                            width: Get.width,
                                            child: Table(
                                              border: TableBorder.all(
                                                  color: ThemeColor.whiteColor),
                                              columnWidths: const {
                                                0: FlexColumnWidth(0.2),
                                                1: FlexColumnWidth(0.6),
                                                2: FlexColumnWidth(0.3),
                                                3: FlexColumnWidth(0.6),
                                              },
                                              children: [
                                                pemeriksaanFisikTableUGD(
                                                    judul1: "Kepala",
                                                    value1: state
                                                        .reportIGD.fisik.kepala,
                                                    value2: state
                                                        .reportIGD.fisik.paru,
                                                    judul2: "Paru"),
                                                pemeriksaanFisikTableUGD(
                                                    value1: state
                                                        .reportIGD.fisik.mata,
                                                    value2: state
                                                        .reportIGD.fisik.perut,
                                                    judul1: "Mata",
                                                    judul2: "Perut"),
                                                pemeriksaanFisikTableUGD(
                                                    judul1: "THT",
                                                    value1: state
                                                        .reportIGD.fisik.tht,
                                                    value2: state
                                                        .reportIGD.fisik.hati,
                                                    judul2: "Hati"),
                                                pemeriksaanFisikTableUGD(
                                                    value1: state
                                                        .reportIGD.fisik.mulut,
                                                    value2: state
                                                        .reportIGD.fisik.limpa,
                                                    judul1: "Mulut",
                                                    judul2: "Limpa"),
                                                pemeriksaanFisikTableUGD(
                                                    judul1: "Gigi",
                                                    value1: state
                                                        .reportIGD.fisik.gigi,
                                                    judul2: "Usus",
                                                    value2: state
                                                        .reportIGD.fisik.usus),
                                                pemeriksaanFisikTableUGD(
                                                    judul1: "Leher",
                                                    value1: state
                                                        .reportIGD.fisik.leher,
                                                    value2: state.reportIGD
                                                        .fisik.abdomenLainnya,
                                                    judul2: "Lain-lain"),
                                                pemeriksaanFisikTableUGD(
                                                    judul1:
                                                        "Kelenjar Getah Bening",
                                                    value1: state.reportIGD
                                                        .fisik.getahBening,
                                                    value2: state
                                                        .reportIGD.fisik.ginjal,
                                                    judul2: "Ginjal"),
                                                pemeriksaanFisikTableUGD(
                                                    judul1: "Dada",
                                                    value1: state
                                                        .reportIGD.fisik.dada,
                                                    value2: state.reportIGD
                                                        .fisik.alatKelamin,
                                                    judul2: "Alat Kelamin"),
                                                pemeriksaanFisikTableUGD(
                                                    judul1: "Jantung",
                                                    value1: state.reportIGD
                                                        .fisik.jantung,
                                                    value2: state
                                                        .reportIGD.fisik.anus,
                                                    judul2: "Anus"),
                                                pemeriksaanFisikTableUGD(
                                                    judul1:
                                                        "Ekstremitas Superior",
                                                    value1: state.reportIGD
                                                        .fisik.superior,
                                                    value2: state.reportIGD
                                                        .fisik.inferior,
                                                    judul2:
                                                        "Ekstremitas Inferior"),
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
                          ],
                          if (AppConstant.appSetup != AppSetup.methodist) ...[
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: TableDesk(
                                shape: const RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: Colors.black, width: 1),
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
                                                "PEMERIKSAAN FISIK",
                                                textAlign: TextAlign.left,
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 6.sp),
                                              ),
                                            ),
                                          ),

                                          //  TABLE
                                          Container(
                                            padding: EdgeInsets.all(5.sp),
                                            width: Get.width,
                                            child: Table(
                                              border: TableBorder.all(
                                                  color: ThemeColor.whiteColor),
                                              columnWidths: const {
                                                0: FlexColumnWidth(0.2),
                                                1: FlexColumnWidth(0.6),
                                                2: FlexColumnWidth(0.3),
                                                3: FlexColumnWidth(0.6),
                                              },
                                              children: [
                                                pemeriksaanFisikTableUGD(
                                                    judul1: "Kepala",
                                                    value1: state
                                                        .reportIGD.fisik.kepala,
                                                    value2: state
                                                        .reportIGD.fisik.limpa,
                                                    judul2: "Limpa"),
                                                pemeriksaanFisikTableUGD(
                                                    value1: state
                                                        .reportIGD.fisik.mata,
                                                    value2: state
                                                        .reportIGD.fisik.ginjal,
                                                    judul1: "Mata",
                                                    judul2: "Ginjal"),
                                                pemeriksaanFisikTableUGD(
                                                    judul1: "THT",
                                                    value1: state
                                                        .reportIGD.fisik.tht,
                                                    value2: state.reportIGD
                                                        .fisik.alatKelamin,
                                                    judul2: "Alat Kelamin"),
                                                pemeriksaanFisikTableUGD(
                                                    value1: state
                                                        .reportIGD.fisik.mulut,
                                                    value2: state.reportIGD
                                                        .fisik.anggotaGerak,
                                                    judul1: "Mulut",
                                                    judul2: "Anggota Gerak"),
                                                pemeriksaanFisikTableUGD(
                                                    judul1: "Leher",
                                                    value1: state
                                                        .reportIGD.fisik.leher,
                                                    judul2: "Refleks",
                                                    value2: state.reportIGD
                                                        .fisik.refleks),
                                                pemeriksaanFisikTableUGD(
                                                    judul1: "Dada",
                                                    value1: state
                                                        .reportIGD.fisik.dada,
                                                    value2: state.reportIGD
                                                        .fisik.kekuatanOtot,
                                                    judul2: "Kekuatan Otot"),
                                                pemeriksaanFisikTableUGD(
                                                    judul1: "Jantung",
                                                    value1: state.reportIGD
                                                        .fisik.jantung,
                                                    value2: state
                                                        .reportIGD.fisik.kulit,
                                                    judul2: "Kulit"),
                                                pemeriksaanFisikTableUGD(
                                                    judul1: "Paru",
                                                    value1: state
                                                        .reportIGD.fisik.paru,
                                                    value2: state
                                                        .reportIGD.fisik.anus,
                                                    judul2:
                                                        "Kelenjar Getah Bening"),
                                                pemeriksaanFisikTableUGD(
                                                    value1: state
                                                        .reportIGD.fisik.perut,
                                                    judul1: "Perut",
                                                    value2: state
                                                        .reportIGD.fisik.rtvt,
                                                    judul2: "RT/VT"),
                                                pemeriksaanFisikTableUGD2(
                                                    judul1: "Hati",
                                                    judul2: state
                                                        .reportIGD.fisik.hati),
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
                          ],

                          Container(
                            decoration:
                                const BoxDecoration(color: Colors.white),
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
                                    TableGap.width(450),
                                  ],
                                  children: [
                                    // === //
                                    (state.reportIGD.asesmen.imageLokalis == "")
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
                                                    "${ApiDb.baseUrl}images/lokalis/${state.reportIGD.asesmen.imageLokalis}",
                                                  ),
                                                )),
                                          ),
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
                                                  width: 1,
                                                  color: Colors.white),
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
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          "KODE GAMBAR",
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: blackTextStyle
                                                              .copyWith(
                                                                  fontSize:
                                                                      6.sp),
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
                                                          0: FlexColumnWidth(
                                                              0.1),
                                                          1: FlexColumnWidth(
                                                              0.6),
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
                                                              judul2:
                                                                  "Hematoma"),
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

                          Container(
                            decoration:
                                const BoxDecoration(color: Colors.white),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                                  fontWeight: FontWeight.bold,
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
                                            children: state.reportIGD.dPenLab
                                                .map((e) => Container(
                                                      width: Get.width,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      margin: EdgeInsets.only(
                                                          right: 10.sp),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
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
                                                              "Tanggal : ${(e.tanggal.length > 10) ? tglIndo(e.tanggal) : e.tanggal} Jam : ${(e.tanggal.length > 10) ? e.tanggal.substring(11, 19) : e.tanggal}",
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
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
                                                                  EdgeInsets
                                                                      .all(
                                                                          2.sp),
                                                              child: Text(
                                                                e.namaKelompok,
                                                                style: blackTextStyle.copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )),
                                                          SizedBox(
                                                            child: Table(
                                                              border: TableBorder.all(
                                                                  color: Colors
                                                                      .black),
                                                              children: [
                                                                TableRow(
                                                                    children: [
                                                                      TitleWidget.headerTitle(
                                                                          color: ThemeColor
                                                                              .greyColor,
                                                                          title:
                                                                              "Deskripsi"),
                                                                      TitleWidget.headerTitle(
                                                                          color: ThemeColor
                                                                              .greyColor,
                                                                          title:
                                                                              "Satuan"),
                                                                      TitleWidget.headerTitle(
                                                                          color: ThemeColor
                                                                              .greyColor,
                                                                          title:
                                                                              "Normal"),
                                                                      TitleWidget.headerTitle(
                                                                          color: ThemeColor
                                                                              .greyColor,
                                                                          title:
                                                                              "Hasil"),
                                                                    ]),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            child: Table(
                                                              border:
                                                                  TableBorder
                                                                      .all(),
                                                              children: e.penlab
                                                                  .map((e) {
                                                                return TableRow(
                                                                    children: [
                                                                      textBox(
                                                                          title:
                                                                              "${e.pemeriksaanDeskripsi} ${e.hasil}"),
                                                                      textBox(
                                                                          title:
                                                                              e.satuan),
                                                                      textBox(
                                                                          title:
                                                                              e.normal),
                                                                      textBox(
                                                                          title:
                                                                              e.hasil),
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
                                            children: state.reportIGD.radiologi
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
                                                                      TitleWidget.headerTitle(
                                                                          color: ThemeColor
                                                                              .greyColor,
                                                                          title:
                                                                              "Pemeriksaan : ")
                                                                    ]),
                                                                ...e.radiologi
                                                                    .map((e) =>
                                                                        TableRow(
                                                                            children: [
                                                                              textBox(title: e.pemeriksaanDeskripsi)
                                                                            ])),
                                                                TableRow(
                                                                    children: [
                                                                      TitleWidget.headerTitle(
                                                                          color: ThemeColor
                                                                              .greyColor,
                                                                          title:
                                                                              "Uraian : ")
                                                                    ]),
                                                                ...e.radiologi
                                                                    .map((e) =>
                                                                        TableRow(
                                                                            children: [
                                                                              textBox(title: e.uraian)
                                                                            ])),
                                                                TableRow(
                                                                    children: [
                                                                      TitleWidget.headerTitle(
                                                                          color: ThemeColor
                                                                              .greyColor,
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
                            decoration:
                                const BoxDecoration(color: Colors.white),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                              children: state.reportIGD.diagnosa
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
                                                "DIAGNOSA BANDING \n${state.reportIGD.asesmen.diagnosaBanding}",
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
                            decoration:
                                const BoxDecoration(color: Colors.white),
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
                                              "PLANNING : (Penatalaksanaan/Pengobatan/Rencana Tindakan / Konsultasi) \n\n${state.reportIGD.asesmen.terapi} \nKonsul Ke${state.reportIGD.asesmen.konsulke}",
                                              textAlign: TextAlign.left,
                                              style: blackTextStyle.copyWith(
                                                  fontSize: 6.sp),
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
                            decoration:
                                const BoxDecoration(color: Colors.white),
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
                                              "PROGNOSA : \n\n${state.reportIGD.asesmen.prognosis}",
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
                                              if (state.reportIGD.asesmen
                                                      .namaDokter !=
                                                  "") ...[
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: SizedBox(
                                                    height: 55.sp,
                                                    child: CustomQrWidget(
                                                        dimension: 30.sp,
                                                        dataBarcode: state
                                                            .reportIGD
                                                            .asesmen
                                                            .namaDokter),
                                                  ),
                                                ),
                                              ],
                                              if (state.reportIGD.asesmen
                                                      .namaDokter ==
                                                  "") ...[
                                                SizedBox(
                                                  height: 30.sp,
                                                ),
                                              ],
                                              if (state.reportIGD.asesmen
                                                      .namaDokter !=
                                                  "") ...[
                                                Text(
                                                  "( ${state.reportIGD.asesmen.namaDokter})",
                                                  style: blackTextStyle,
                                                )
                                              ],
                                              if (state.reportIGD.asesmen
                                                      .namaDokter ==
                                                  "") ...[
                                                Text(
                                                  "( ....................................... )",
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
                        ],
                      ),
                    ),
                    SizedBox(height: 15.sp),
                  ],
                ),
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

  TableRow pemeriksaanFisikTableUGD3(
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
          ": $judul2",
          textAlign: TextAlign.left,
          style: blackTextStyle.copyWith(fontSize: 6.sp),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "",
          textAlign: TextAlign.left,
          style: blackTextStyle.copyWith(fontSize: 6.sp),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "",
          textAlign: TextAlign.left,
          style: blackTextStyle.copyWith(fontSize: 6.sp),
        ),
      ),
    ]);
  }

  TableRow pemeriksaanFisikTableUGDDua(
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
          ":",
          textAlign: TextAlign.left,
          style: blackTextStyle.copyWith(fontSize: 6.sp),
        ),
      ),
    ]);
  }

  TableRow boxTitle({
    required String judul1,
    required String judul2,
  }) {
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
          ": $judul2",
          textAlign: TextAlign.left,
          style: blackTextStyle.copyWith(fontSize: 6.sp),
        ),
      ),
    ]);
  }

  TableRow boxPemeriksaanLain(
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
          ":",
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
          )),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          ":",
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

  TableRow pemeriksaanFisikTableUGD2(
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
          ": $judul2",
          textAlign: TextAlign.left,
          style: blackTextStyle.copyWith(fontSize: 6.sp),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "",
          textAlign: TextAlign.left,
          style: blackTextStyle.copyWith(fontSize: 6.sp),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "",
          textAlign: TextAlign.left,
          style: blackTextStyle.copyWith(fontSize: 6.sp),
        ),
      ),
    ]);
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
