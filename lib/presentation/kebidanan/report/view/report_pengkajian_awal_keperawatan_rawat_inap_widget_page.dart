import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/report/report_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/qr_code/custom_qr_widget.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class ReportPengkajianAwalKeperawatanRawatInapPage extends StatefulWidget {
  const ReportPengkajianAwalKeperawatanRawatInapPage({super.key});

  @override
  State<ReportPengkajianAwalKeperawatanRawatInapPage> createState() =>
      _ReportPengkajianAwalKeperawatanRawatInapPageState();
}

class _ReportPengkajianAwalKeperawatanRawatInapPageState
    extends State<ReportPengkajianAwalKeperawatanRawatInapPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    // AuthState authState = context.watch<AuthBloc>().state;

    return BlocBuilder<ReportBloc, ReportState>(
      builder: (context, state) {
        if (state.status ==
            ReportStatus.isLoadingReportPengkajianRawatInapPerawat) {
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
                        child: Text("RM.05 A REV 2023",
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
                                    decoration: const BoxDecoration(
                                        color: Colors.white),
                                    width: Get.width / 2.5,
                                    height: 40.sp,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                    decoration: const BoxDecoration(
                                        color: Colors.white),
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
                                        titleText(
                                            title: "Tanggal Lahir",
                                            subTitle: (singlePasien
                                                        .first.tglLahir.length >
                                                    6)
                                                ? tglIndo(singlePasien
                                                    .first.tglLahir
                                                    .substring(0, 10))
                                                : ""),
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
                              "II. PENGKAJIAN AWAL KEPERAWATAN (di isi oleh perawat)",
                              textAlign: TextAlign.left,
                              style: blackTextStyle.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 8.sp),
                            ),
                          ),

                          Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: TableDesk(
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.white, width: 1),
                                  ),
                                  child: TableDeskRow(
                                      border: const BorderSide(
                                          width: 1, color: Colors.white),
                                      gaps: [
                                        TableGap.weight(),
                                        TableGap.weight(),
                                        TableGap.weight(),
                                      ],
                                      children: [
                                        Container(
                                            color: Colors.white,
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              "Tanggal         :       ${(state.perawat.asesmenPerawat.tglMasuk.length > 10) ? tglIndo(state.perawat.asesmenPerawat.tglMasuk) : state.perawat.asesmenPerawat.tglMasuk}",
                                              style: blackTextStyle.copyWith(
                                                  fontSize: 6.sp),
                                              textAlign: TextAlign.left,
                                            )),
                                        Container(
                                          color: Colors.white,
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            "Jam                                :       ${(state.perawat.asesmenPerawat.insertDttm.length > 10) ? state.perawat.asesmenPerawat.insertDttm.substring(11, 19) : ""}"
                                            "",
                                            style: blackTextStyle.copyWith(
                                                fontSize: 6.sp),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Container(
                                          color: Colors.white,
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            "Jenis Pengkajian : \n${state.perawat.asesmenPerawat.jenpel} - ${state.perawat.asesmenPerawat.jenpelDetail}",
                                            style: blackTextStyle.copyWith(
                                                fontSize: 6.sp),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ]))),

                          SizedBox(
                            height: 5.sp,
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Keluhan Utama/Alasan Masuk RS : \n${state.perawat.asesmenPerawat.keluhan}",
                              style: blackTextStyle,
                            ),
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Riwayat Penyakit Sekarang : \n${state.perawat.asesmenPerawat.riwayatPenyakit}",
                              style: blackTextStyle,
                            ),
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Riwayat Penyakit Dahulu : ",
                              style: blackTextStyle,
                            ),
                          ),
                          (state.perawat.riwayatPenyakit.isNotEmpty)
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Wrap(
                                    children: state.perawat.riwayatPenyakit
                                        .map((e) => Text(
                                              "Tanggal:  ${tglIndo(e.tglMasuk.substring(0, 10))}  - ${e.keluhan},  ",
                                              style: blackTextStyle,
                                            ))
                                        .toList(),
                                  ),
                                )
                              : const SizedBox(),

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

                          (state.perawat.riwayatPenyakitKeluarga.isNotEmpty)
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Wrap(
                                    children:
                                        state.perawat.riwayatPenyakitKeluarga
                                            .map((e) => Text(
                                                  "Tanggal:  ${e.tanggal} - ${e.penyakit} ,",
                                                  style: blackTextStyle,
                                                ))
                                            .toList(),
                                  ),
                                )
                              : const SizedBox(),

                          SizedBox(
                            height: 5.sp,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Riwayat Pengobatan Dirumah : ${state.perawat.asesmenPerawat.riwayatPenyakitDahulu}",
                              style: blackTextStyle,
                            ),
                          ),

                          (state.perawat.riwayatPengobatan.isNotEmpty)
                              ? Padding(
                                  padding: EdgeInsets.all(2.sp),
                                  child: Container(
                                    width: Get.width,
                                    decoration: const BoxDecoration(),
                                    margin: EdgeInsets.only(right: 10.sp),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          child: Table(
                                            border: TableBorder.all(
                                                color: Colors.black),
                                            children: [
                                              TableRow(children: [
                                                headerTitle(title: "Nama Obat"),
                                                headerTitle(title: "Dosis"),
                                                headerTitle(
                                                    title: "Cara\nPemberian"),
                                                headerTitle(title: "Frekuensi"),
                                                headerTitle(
                                                    title:
                                                        "Waktu Terakhir\nPemberian"),
                                              ]),
                                            ],
                                          ),
                                        ),
                                        (state.perawat.riwayatPengobatan
                                                .isNotEmpty)
                                            ? SizedBox(
                                                child: Table(
                                                  border: TableBorder.all(),
                                                  children: state
                                                      .perawat.riwayatPengobatan
                                                      .map((e) {
                                                    return TableRow(children: [
                                                      textBox(
                                                          title:
                                                              "${e.namaObat} "),
                                                      textBox(title: e.dosis),
                                                      textBox(
                                                          title:
                                                              e.caraPemberian),
                                                      textBox(
                                                          title: e.frekuensi),
                                                      textBox(
                                                          title: tglIndo(e.waktu
                                                              .toString()
                                                              .substring(
                                                                  0, 10))),
                                                    ]);
                                                  }).toList(),
                                                ),
                                              )
                                            : const SizedBox(),
                                      ],
                                    ),
                                  ),
                                )
                              : const SizedBox(),

                          SizedBox(
                            height: 5.sp,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Riwayat Alergi : ",
                              style: blackTextStyle,
                            ),
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Reaksi yang timbul : \n${state.perawat.asesmenPerawat.reaksiAlergi}",
                              style: blackTextStyle,
                            ),
                          ),

                          SizedBox(
                            height: 5.sp,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Pengkajian Fisik : \n",
                              style: blackTextStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "TD : ${state.perawat.vital.td} mmHg.      RR : ${state.perawat.vital.pernafasan} x/menit.      Nadi : ${state.perawat.vital.nadi} x/menit      Temp : ${state.perawat.vital.suhu} °C\nBB : ${state.perawat.vital.beratBadan} kg.     TB : ${state.perawat.vital.tinggiBadan} cm.       Spo2 : ${state.perawat.vital.spo2} %    GCS: E :${state.perawat.fisik.gcsE}  V :${state.perawat.fisik.gcsV}  M :${state.perawat.fisik.gcsM}",
                              style: blackTextStyle.copyWith(fontSize: 6.sp),
                            ),
                          ),

                          SizedBox(
                            height: 5.sp,
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
                                        TableGap.weight(),
                                        TableGap.width(100.sp),
                                      ],
                                      children: [
                                        Container(
                                            color: Colors.white,
                                            padding: const EdgeInsets.all(8),
                                            child: Center(
                                              child: Text(
                                                "PENGKAJIAN",
                                                style: blackTextStyle.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 6.sp),
                                                textAlign: TextAlign.center,
                                              ),
                                            )),
                                        Container(
                                          color: Colors.white,
                                          padding: const EdgeInsets.all(8),
                                          child: Center(
                                            child: Text(
                                              "MASALAH \nKEPERAWATAN",
                                              style: blackTextStyle.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 6.sp),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ]))),
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
                                              decoration: const BoxDecoration(),
                                              margin:
                                                  EdgeInsets.only(right: 10.sp),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // == TAMPILKAN SISTEM PENGKAJIAN
                                                  Text(
                                                    "PEMERIKSAAN FISIK",
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),

                                                  pemeriksaanFisik(
                                                      title: "KEPALA",
                                                      value: state
                                                          .perawat.fisik.kepala
                                                          .toUpperCase()),

                                                  pemeriksaanFisik(
                                                      title: "MATA",
                                                      value: state
                                                          .perawat.fisik.mata
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "TELINGA",
                                                      value: state
                                                          .perawat.fisik.telinga
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "LEHER DAN BAHU",
                                                      value: state
                                                          .perawat.fisik.lehe
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "HIDUNG",
                                                      value: state
                                                          .perawat.fisik.hidung
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "GIGI",
                                                      value: state
                                                          .perawat.fisik.gigi
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "DADA",
                                                      value: state
                                                          .perawat.fisik.dada
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "ABDOMEN",
                                                      value: state
                                                          .perawat.fisik.abdomen
                                                          .toUpperCase()),

                                                  SizedBox(
                                                    height: 5.sp,
                                                  ),

                                                  Text(
                                                    "NUTRISI DAN HIDRASI",
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                  pemeriksaanFisik(
                                                      title: "NUTRISI",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .nutrisi
                                                          .toUpperCase()),

                                                  SizedBox(
                                                    height: 5.sp,
                                                  ),

                                                  Text(
                                                    "PENGKAJIAN NUTRISI\n(Pengkajian Berdasarkan Malnutrion Screaning Tall)",
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),

                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(2.sp),
                                                    child: Container(
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
                                                          SizedBox(
                                                            child: Table(
                                                              border: TableBorder.all(
                                                                  color: Colors
                                                                      .black),
                                                              children: [
                                                                TableRow(
                                                                    children: [
                                                                      headerLeftTitle(
                                                                          title:
                                                                              "PARAMETER"),
                                                                      headerLeftTitle(
                                                                          title:
                                                                              "NILAI"),
                                                                    ]),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            child: Table(
                                                              border:
                                                                  TableBorder
                                                                      .all(),
                                                              children: [
                                                                TableRow(
                                                                    children: [
                                                                      textBox(
                                                                          title:
                                                                              "Apakah pasien mengalami penurunan BB yang tidak diinginkan dalam 6 bulan terakhir ?"),
                                                                      centerTextBox(
                                                                          title: state
                                                                              .perawat
                                                                              .nutrisiResponse
                                                                              .n1),
                                                                    ]),
                                                                TableRow(
                                                                    children: [
                                                                      textBox(
                                                                          title:
                                                                              "Apakah asupan makan berkurang karena tidak nafsu makan?"),
                                                                      centerTextBox(
                                                                          title: state
                                                                              .perawat
                                                                              .nutrisiResponse
                                                                              .n2),
                                                                    ]),
                                                              ],
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
                                                                      headerLeftTitle(
                                                                          title:
                                                                              "TOTAL"),
                                                                      headerLeftTitle(
                                                                          title: state
                                                                              .perawat
                                                                              .nutrisiResponse
                                                                              .nilai
                                                                              .toString()),
                                                                    ]),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),

                                                  SizedBox(
                                                    height: 5.sp,
                                                  ),

                                                  Text(
                                                    "ELIMINASI DAN PELEPASAN",
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),

                                                  pemeriksaanFisik(
                                                      title: "ELIMINASI BAK",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .eliminasiBak
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "ELIMINASI BAB",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .eliminasiBab
                                                          .toUpperCase()),

                                                  SizedBox(
                                                    height: 5.sp,
                                                  ),

                                                  Text(
                                                    "AKTIVITAS / ISTIRAHAT",
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),

                                                  pemeriksaanFisik(
                                                      title: "TIDUR/ISTIRAHAT",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .istirahat
                                                          .toUpperCase()),

                                                  SizedBox(
                                                    height: 5.sp,
                                                  ),

                                                  Text(
                                                    "SKOR AKTIVITAS",
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),

                                                  pemeriksaanFisik(
                                                      title: "MANDI",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .sistemMandi
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "BERPAKAIAN",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .sistemBerpakaian
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "MAKAN/MANDI",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .sistemMakan
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "ELIMINASI",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .sistemEliminasi
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "MOBILISASI DI TT",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .sistemMobilisasi
                                                          .toUpperCase()),

                                                  SizedBox(
                                                    height: 5.sp,
                                                  ),

                                                  Text(
                                                    "SISTEM KARDIO-RESPIRATORI",
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),

                                                  pemeriksaanFisik(
                                                      title: "KARDIOVASKULER",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .sistemKardiovaskuler
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "AKRAL",
                                                      value: state.perawat
                                                          .asesmenPerawat.akral
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "RESPIRATORI",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .sistemRespiratori
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "BATUK",
                                                      value: state.perawat
                                                          .asesmenPerawat.batuk
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "SUARA NAPAS",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .suaraNapas
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "MEROKOK",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .merokok
                                                          .toUpperCase()),

                                                  SizedBox(
                                                    height: 5.sp,
                                                  ),

                                                  Text(
                                                    "SISTEM PERFUSI SECEBRAL",
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),

                                                  pemeriksaanFisik(
                                                      title: "SECEBRAL",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .sistemSecebral
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "SAKIT KEPALA",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .sakitKepala
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title:
                                                          "PERUBAHAN STATUS METAL",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .perubahanStatusMental
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title:
                                                          "LEMAH ANGGOTA GERAK",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .anggotaGerak
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "BICARA",
                                                      value: state.perawat
                                                          .asesmenPerawat.bicara
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title:
                                                          "RIWAYAT HIPERTENSI",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .riwayatHipertensi
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "PUPIL",
                                                      value: state
                                                          .perawat.fisik.pupil
                                                          .toUpperCase()),

                                                  SizedBox(
                                                    height: 5.sp,
                                                  ),

                                                  Text(
                                                    "THERMOREGULASI",
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),

                                                  pemeriksaanFisik(
                                                      title: "THERMOREGULASI",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .thermoregulasi
                                                          .toUpperCase()),

                                                  SizedBox(
                                                    height: 5.sp,
                                                  ),
                                                  Text(
                                                    "SISTEM PERFUSI PERIFER",
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),

                                                  pemeriksaanFisik(
                                                      title: "SECEBRAL",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .sistemSecebral
                                                          .toUpperCase()),

                                                  SizedBox(
                                                    height: 5.sp,
                                                  ),
                                                  Text(
                                                    "SISTEM PENCERNAAN",
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),

                                                  pemeriksaanFisik(
                                                      title: "Pencernaan",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .sistemPencernaan
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "Bising Usus",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .sistemUsus
                                                          .toUpperCase()),

                                                  SizedBox(
                                                    height: 5.sp,
                                                  ),
                                                  Text(
                                                    "INTEGUMEN",
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),

                                                  pemeriksaanFisik(
                                                      title: "Integumen",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .sistemIntegumen
                                                          .toUpperCase()),

                                                  SizedBox(
                                                    height: 5.sp,
                                                  ),
                                                  Text(
                                                    "PENGKAJIAN FUNGSIONAL",
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),

                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(2.sp),
                                                    child: Container(
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
                                                          SizedBox(
                                                            child: Table(
                                                              border: TableBorder.all(
                                                                  color: Colors
                                                                      .black),
                                                              children: [
                                                                TableRow(
                                                                    children: [
                                                                      headerLeftTitle(
                                                                          title:
                                                                              "KRITERIA BARTHERL INDEX"),
                                                                      headerLeftTitle(
                                                                          title:
                                                                              "HASIL"),
                                                                    ]),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            child: Table(
                                                              border:
                                                                  TableBorder
                                                                      .all(),
                                                              children: [
                                                                TableRow(
                                                                    children: [
                                                                      textBox(
                                                                          title:
                                                                              "Makan"),
                                                                      textBox(
                                                                          title: state
                                                                              .perawat
                                                                              .fungsional
                                                                              .f1),
                                                                    ]),
                                                                TableRow(
                                                                    children: [
                                                                      textBox(
                                                                          title:
                                                                              "Aktivitas di toilet"),
                                                                      textBox(
                                                                          title: state
                                                                              .perawat
                                                                              .fungsional
                                                                              .f2),
                                                                    ]),
                                                                TableRow(
                                                                    children: [
                                                                      textBox(
                                                                          title:
                                                                              "Berpindah dari kursi roda ke tempat tidur/sebaliknya, termasuk duduk ditempat ditidur"),
                                                                      textBox(
                                                                          title: state
                                                                              .perawat
                                                                              .fungsional
                                                                              .f3),
                                                                    ]),
                                                                TableRow(
                                                                    children: [
                                                                      textBox(
                                                                          title:
                                                                              "Kebersihan diri, mencuci muka, menyisir rambut, menggosok gigi"),
                                                                      textBox(
                                                                          title: state
                                                                              .perawat
                                                                              .fungsional
                                                                              .f4),
                                                                    ]),
                                                                TableRow(
                                                                    children: [
                                                                      textBox(
                                                                          title:
                                                                              "Mandi"),
                                                                      textBox(
                                                                          title: state
                                                                              .perawat
                                                                              .fungsional
                                                                              .f5),
                                                                    ]),
                                                                TableRow(
                                                                    children: [
                                                                      textBox(
                                                                          title:
                                                                              "Berjalan di permukaan datar"),
                                                                      textBox(
                                                                          title: state
                                                                              .perawat
                                                                              .fungsional
                                                                              .f6),
                                                                    ]),
                                                                TableRow(
                                                                    children: [
                                                                      textBox(
                                                                          title:
                                                                              "Naik turun tangga"),
                                                                      textBox(
                                                                          title: state
                                                                              .perawat
                                                                              .fungsional
                                                                              .f7),
                                                                    ]),
                                                                TableRow(
                                                                    children: [
                                                                      textBox(
                                                                          title:
                                                                              "Berpakaian"),
                                                                      textBox(
                                                                          title: state
                                                                              .perawat
                                                                              .fungsional
                                                                              .f8),
                                                                    ]),
                                                                TableRow(
                                                                    children: [
                                                                      textBox(
                                                                          title:
                                                                              "Mengontrol defekasi"),
                                                                      textBox(
                                                                          title: state
                                                                              .perawat
                                                                              .fungsional
                                                                              .f9),
                                                                    ]),
                                                                TableRow(
                                                                    children: [
                                                                      textBox(
                                                                          title:
                                                                              "Mengontrol berkemih"),
                                                                      textBox(
                                                                          title: state
                                                                              .perawat
                                                                              .fungsional
                                                                              .f10),
                                                                    ])
                                                              ],
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
                                                                      headerLeftTitle(
                                                                          title:
                                                                              "TOTAL"),
                                                                      headerLeftTitle(
                                                                          title: state
                                                                              .perawat
                                                                              .fungsional
                                                                              .nilai
                                                                              .toString()),
                                                                    ]),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),

                                                  SizedBox(
                                                    height: 5.sp,
                                                  ),

                                                  Text(
                                                    "KOMINIKASI/PENDIDIKAN/PENGAJARAN",
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                  pemeriksaanFisik(
                                                      title: "Hambatan Bahasa",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .hambatanBahasa
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title:
                                                          "Cara belajar yang disukai",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .caraBelajar
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title:
                                                          "Bahasa Sehari hari",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .bahasaSehari
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "Perlu penerjemah",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .perluPenerjemah
                                                          .toUpperCase()),

                                                  SizedBox(
                                                    height: 5.sp,
                                                  ),

                                                  Text(
                                                    "DATA SPIKOLOGIS, SOSIAL, EKONOMI DAN SPIRITUAL",
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                  pemeriksaanFisik(
                                                      title: "Spikologis",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .spikologis
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "Hambatan Sosial",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .hambatanSosial
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "Hambatan Ekonomi",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .hambatanEkonomi
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title:
                                                          "Hambatan Spiritual",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .hambatanSpiritual
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title: "Response Emosi",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .responseEmosi
                                                          .toUpperCase()),

                                                  SizedBox(
                                                    height: 5.sp,
                                                  ),
                                                  Text(
                                                    "NILAI KEPERCAYAAN",
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),

                                                  pemeriksaanFisik(
                                                      title:
                                                          "MENJALANKAN IBADAH",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .nilaiKepercayaan
                                                          .toUpperCase()),

                                                  pemeriksaanFisik(
                                                      title:
                                                          "PRESEPSI TERHADAP SAKIT",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .presepsiSakit
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title:
                                                          "KUNJUNGAN PEMIMPIN AGAMA/BIMBINGAN SPIRITUAL",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .hambatanSpiritual
                                                          .toUpperCase()),
                                                  pemeriksaanFisik(
                                                      title:
                                                          "NILAI/ATURAN KHUSUS DALAM KEPERCAYAAN",
                                                      value: state
                                                          .perawat
                                                          .asesmenPerawat
                                                          .khususKepercayaan
                                                          .toUpperCase()),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          color: Colors.white,
                                          child: Column(
                                            children: (state
                                                    .perawat
                                                    .asuhanKeperawatan
                                                    .isNotEmpty)
                                                ? state
                                                    .perawat.asuhanKeperawatan
                                                    .map((asuhan) {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsets.all(2.sp),
                                                      child: Container(
                                                        width: Get.width,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        margin: EdgeInsets.only(
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
                                                                        headerLeftTitle(
                                                                            title:
                                                                                "${asuhan.diagnosa.judul}\nTanggal :${(asuhan.tanggal.length > 10) ? tglIndo(asuhan.tanggal.substring(0, 10)) : asuhan.tanggal}"),
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
                                                                        textBox(
                                                                            title:
                                                                                "${e.namaSllki} "),
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
                                      ]))),

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
                                      border:
                                          TableBorder.all(color: Colors.white),
                                      children: [
                                        TableRow(children: [
                                          rightTextBox(
                                              title:
                                                  "Pematangsiantar, Tanggal : ${(state.perawat.asesmenPerawat.insertDttm.length > 10) ? tglIndo(state.perawat.asesmenPerawat.insertDttm.substring(0, 10)) : state.perawat.asesmenPerawat.insertDttm}"),
                                        ]),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Table(
                                      border:
                                          TableBorder.all(color: Colors.white),
                                      children: [
                                        TableRow(children: [
                                          centerTextBox(
                                              title:
                                                  "KARU/KATIM\n\n\n\n\n\n( ........................... )"),
                                          Column(
                                            children: [
                                              centerTextBox(
                                                  title:
                                                      "PERAWAT YANG BERTUGAS"),
                                              if (state.perawat.asesmenPerawat
                                                      .nama !=
                                                  "") ...[
                                                CustomQrWidget(
                                                  dimension: 30.sp,
                                                  dataBarcode: state.perawat
                                                      .asesmenPerawat.nama,
                                                ),
                                                centerTextBox(
                                                  title:
                                                      "(  ${state.perawat.asesmenPerawat.nama}  )",
                                                ),
                                              ],
                                              if (state.perawat.asesmenPerawat
                                                      .nama ==
                                                  "") ...[
                                                SizedBox(
                                                  height: 35.sp,
                                                ),
                                                centerTextBox(
                                                  title:
                                                      "( ................................. )",
                                                ),
                                              ],
                                            ],
                                          )
                                        ]),
                                      ],
                                    ),
                                  ),
                                ],
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
            ));
      },
    );
  }

  Padding textBox({required String title}) {
    return Padding(
      padding: EdgeInsets.all(2.sp),
      child: Text(
        title,
        style: blackTextStyle.copyWith(fontSize: 5.sp),
      ),
    );
  }

  Padding centerTextBox({required String title}) {
    return Padding(
      padding: EdgeInsets.all(2.sp),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: blackTextStyle.copyWith(fontSize: 5.sp),
      ),
    );
  }

  Padding rightTextBox({required String title}) {
    return Padding(
      padding: EdgeInsets.all(2.sp),
      child: Text(
        title,
        textAlign: TextAlign.right,
        style: blackTextStyle.copyWith(fontSize: 5.sp),
      ),
    );
  }

  Container pemeriksaanFisik({
    required String title,
    required String value,
  }) {
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
            TableGap.width(300),
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
                ": $value",
                style: blackTextStyle.copyWith(fontSize: 5.sp),
              ),
            ),
          ],
        ),
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

  Container headerTitle({required String title}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.sp),
      height: 20.sp,
      decoration: const BoxDecoration(color: ThemeColor.darkGreyColor),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: blackTextStyle.copyWith(
              fontWeight: FontWeight.bold, fontSize: 5.sp),
        ),
      ),
    );
  }

  Container headerLeftTitle({required String title}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.sp, horizontal: 2.sp),
      decoration: const BoxDecoration(color: ThemeColor.darkGreyColor),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: blackTextStyle.copyWith(
              fontWeight: FontWeight.bold, fontSize: 5.sp),
        ),
      ),
    );
  }
}
