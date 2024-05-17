import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/core/api/api_db.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/report/report_bloc.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/qr_code/custom_qr_widget.dart';
import 'package:hms_app/presentation/component/title/title_component.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class ReportPengkajianAwalAnakPageWidget extends StatefulWidget {
  const ReportPengkajianAwalAnakPageWidget({super.key});

  @override
  State<ReportPengkajianAwalAnakPageWidget> createState() =>
      _ReportPengkajianAwalAnakPageWidgetState();
}

class _ReportPengkajianAwalAnakPageWidgetState
    extends State<ReportPengkajianAwalAnakPageWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocBuilder<ReportBloc, ReportState>(
      builder: (context, state) {
        if (state.status == ReportStatus.isLoadingReportAnak) {
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
                      )),

                  // ==== PENGKAJIAN AWAL ANAK
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
                        Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: const HeaderAllWidget(),
                        ),
                        const Divider(),
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
                                        "PENGKAJIAN AWAL \n PASIEN ANAK RAWAT INAP",
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
                                      TitleWidget.titleText(
                                          title: "RM",
                                          subTitle: singlePasien.first.mrn),
                                      TitleWidget.titleText(
                                          title: "Nama",
                                          subTitle:
                                              singlePasien.first.namaPasien),
                                      TitleWidget.titleText(
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
                            "I. PENGKAJIAN AWAL MEDIS (diisi oleh dokter)",
                            textAlign: TextAlign.left,
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 6.sp),
                          ),
                        ),
                        Container(
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 5.sp),
                            child: TableDesk(
                                shape: const RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: Colors.white, width: 1),
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
                                    ]))),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "SUBJEKTIF",
                            textAlign: TextAlign.left,
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 6.sp),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Keluhan Utama :\n\n      .........................................................................................................................................................",
                            textAlign: TextAlign.left,
                            style: blackTextStyle.copyWith(fontSize: 6.sp),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Riwayat Penyakit Sekarang :\n\n      .................................................................................................................................",
                            textAlign: TextAlign.left,
                            style: blackTextStyle.copyWith(fontSize: 6.sp),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Riwayat Penyakit Keluarga :\n\n      .................................................................................................................................",
                            textAlign: TextAlign.left,
                            style: blackTextStyle.copyWith(fontSize: 6.sp),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "OBJEKTIF",
                            textAlign: TextAlign.left,
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 6.sp),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Tanda-Tanda Vital : \n",
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold))),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "TD : ${state.perawat.vital.td} mmHg.      RR : ${state.perawat.vital.pernafasan} x/menit.      Nadi : ${state.perawat.vital.nadi} x/menit      Temp : ${state.perawat.vital.suhu} °C\nBB : ${state.perawat.vital.beratBadan} kg.     TB : ${state.perawat.vital.tinggiBadan} cm.       Spo2 : ${state.perawat.vital.spo2} %    GCS: E :${state.perawat.fisik.gcsE}  V :${state.perawat.fisik.gcsV}  M :${state.perawat.fisik.gcsM}",
                              style: blackTextStyle.copyWith(fontSize: 6.sp),
                            )),

                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(2.sp),
                            child: Container(
                              width: Get.width,
                              decoration: const BoxDecoration(),
                              margin: EdgeInsets.only(right: 10.sp),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // == TAMPILKAN SISTEM PENGKAJIAN
                                  Text(
                                    "PEMERIKSAAN FISIK",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),

                                  pemeriksaanFisik(
                                      title: "KEPALA",
                                      title1: "LIMPA",
                                      value1: "",
                                      value: state.perawat.fisik.kepala
                                          .toUpperCase()),

                                  pemeriksaanFisik(
                                      title: "MATA",
                                      title1: "GINJAL",
                                      value1: "",
                                      value: state.perawat.fisik.mata
                                          .toUpperCase()),
                                  pemeriksaanFisik(
                                      title: "TELINGA",
                                      title1: "ALAT KELAMIN",
                                      value1: "",
                                      value: state.perawat.fisik.telinga
                                          .toUpperCase()),
                                  pemeriksaanFisik(
                                      title: "HIDUNG",
                                      title1: "REFLEKS",
                                      value1: "",
                                      value: state.perawat.fisik.hidung
                                          .toUpperCase()),
                                  pemeriksaanFisik(
                                      title: "LEHER DAN BAHU",
                                      title1: "Anggota Gerak",
                                      value1: "",
                                      value: state.perawat.fisik.lehe
                                          .toUpperCase()),

                                  pemeriksaanFisik(
                                      title1: "REFLEKS",
                                      value1: "",
                                      title: "DADA",
                                      value: state.perawat.fisik.gigi
                                          .toUpperCase()),
                                  pemeriksaanFisik(
                                      title1: "JANTUNG",
                                      value1: "",
                                      title: "KULIT",
                                      value: state.perawat.fisik.gigi
                                          .toUpperCase()),
                                  pemeriksaanFisik(
                                      title1: "PARU",
                                      value1: "",
                                      title: "KULIT",
                                      value: state.perawat.fisik.gigi
                                          .toUpperCase()),
                                  pemeriksaanFisik(
                                      title1: "KELENJAR GETAH BENING",
                                      value1: "",
                                      title: "PERUT",
                                      value: state.perawat.fisik.gigi
                                          .toUpperCase()),
                                  pemeriksaanFisik(
                                      title1: "HATI",
                                      value1: "",
                                      title: "RT/VT",
                                      value: state.perawat.fisik.gigi
                                          .toUpperCase()),
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
                                          children:
                                              state.reportPengkajianAwalMedis
                                                  .dPenLab
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
                                                                "Tanggal : ${tglIndo(e.tanggal)} Jam : ${e.tanggal.substring(11, 19)}",
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style:
                                                                    blackTextStyle,
                                                              ),
                                                            ),
                                                            Container(
                                                                width: Get
                                                                    .width,
                                                                decoration: const BoxDecoration(
                                                                    color: ThemeColor
                                                                        .darkGreyColor2),
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(2
                                                                            .sp),
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
                                                                            title:
                                                                                "Deskripsi"),
                                                                        TitleWidget.headerTitle(
                                                                            title:
                                                                                "Satuan"),
                                                                        TitleWidget.headerTitle(
                                                                            title:
                                                                                "Normal"),
                                                                        TitleWidget.headerTitle(
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
                                                                children: e
                                                                    .penlab
                                                                    .map((e) {
                                                                  return TableRow(
                                                                      children: [
                                                                        TitleWidget.textBox(
                                                                            title:
                                                                                "${e.pemeriksaanDeskripsi} ${e.hasil}"),
                                                                        TitleWidget.textBox(
                                                                            title:
                                                                                e.satuan),
                                                                        TitleWidget.textBox(
                                                                            title:
                                                                                e.normal),
                                                                        TitleWidget.textBox(
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
                                                                        TitleWidget.headerTitle(
                                                                            title:
                                                                                "Pemeriksaan : ")
                                                                      ]),
                                                                  ...e.radiologi
                                                                      .map((e) =>
                                                                          TableRow(children: [
                                                                            TitleWidget.textBox(title: e.pemeriksaanDeskripsi)
                                                                          ])),
                                                                  TableRow(
                                                                      children: [
                                                                        TitleWidget.headerTitle(
                                                                            title:
                                                                                "Uraian : ")
                                                                      ]),
                                                                  ...e.radiologi
                                                                      .map((e) =>
                                                                          TableRow(children: [
                                                                            TitleWidget.textBox(title: e.uraian)
                                                                          ])),
                                                                  TableRow(
                                                                      children: [
                                                                        TitleWidget.headerTitle(
                                                                            title:
                                                                                "Hasil : ")
                                                                      ]),
                                                                  ...e.radiologi
                                                                      .map((e) =>
                                                                          TableRow(
                                                                              children: [
                                                                                TitleWidget.textBox(title: e.hasil)
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
                        SizedBox(height: 25.sp),

                        // ==== //
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "II. PENGKAJIAN KEPERWATAN (diisi oleh perawat)",
                            textAlign: TextAlign.left,
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 6.sp),
                          ),
                        ),
                        Container(
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 5.sp),
                            child: TableDesk(
                                shape: const RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: Colors.white, width: 1),
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
                                    ]))),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Keluhan Utama :\n\n      .........................................................................................................................................................",
                            textAlign: TextAlign.left,
                            style: blackTextStyle.copyWith(fontSize: 6.sp),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Riwayat Penyakit Sekarang :\n\n      .................................................................................................................................",
                            textAlign: TextAlign.left,
                            style: blackTextStyle.copyWith(fontSize: 6.sp),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Riwayat Penyakit Dahulu :\n\n      .................................................................................................................................",
                            textAlign: TextAlign.left,
                            style: blackTextStyle.copyWith(fontSize: 6.sp),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Riwayat Penyakit Keluarga :\n\n      .................................................................................................................................",
                            textAlign: TextAlign.left,
                            style: blackTextStyle.copyWith(fontSize: 6.sp),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Riwayat Pengobatan di rumah :\n\n      .................................................................................................................................",
                            textAlign: TextAlign.left,
                            style: blackTextStyle.copyWith(fontSize: 6.sp),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Riwayat Alergi ...........................",
                            textAlign: TextAlign.left,
                            style: blackTextStyle.copyWith(fontSize: 6.sp),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Reaksi yang Timbul ............... ",
                            textAlign: TextAlign.left,
                            style: blackTextStyle.copyWith(fontSize: 6.sp),
                          ),
                        ),

                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Pengkajian Fisik : \n",
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold))),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "TD : ${state.perawat.vital.td} mmHg.      RR : ${state.perawat.vital.pernafasan} x/menit.      Nadi : ${state.perawat.vital.nadi} x/menit      Temp : ${state.perawat.vital.suhu} °C\nBB : ${state.perawat.vital.beratBadan} kg.     TB : ${state.perawat.vital.tinggiBadan} cm.       Spo2 : ${state.perawat.vital.spo2} %    GCS: E :${state.perawat.fisik.gcsE}  V :${state.perawat.fisik.gcsV}  M :${state.perawat.fisik.gcsM}",
                              style: blackTextStyle.copyWith(fontSize: 6.sp),
                            )),

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
                                  side:
                                      BorderSide(color: Colors.black, width: 1),
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
                                                              FontWeight.bold),
                                                ),

                                                TitleWidget.pemeriksaanFisik(
                                                    title: "KEPALA",
                                                    value: state
                                                        .perawat.fisik.kepala
                                                        .toUpperCase()),

                                                TitleWidget.pemeriksaanFisik(
                                                    title: "MATA",
                                                    value: state
                                                        .perawat.fisik.mata
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
                                                    title: "TELINGA",
                                                    value: state
                                                        .perawat.fisik.telinga
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
                                                    title: "LEHER DAN BAHU",
                                                    value: state
                                                        .perawat.fisik.lehe
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
                                                    title: "HIDUNG",
                                                    value: state
                                                        .perawat.fisik.hidung
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
                                                    title: "GIGI",
                                                    value: state
                                                        .perawat.fisik.gigi
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
                                                    title: "DADA",
                                                    value: state
                                                        .perawat.fisik.dada
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
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
                                                              FontWeight.bold),
                                                ),
                                                TitleWidget.pemeriksaanFisik(
                                                    title: "NUTRISI",
                                                    value: state.perawat
                                                        .asesmenPerawat.nutrisi
                                                        .toUpperCase()),

                                                SizedBox(
                                                  height: 5.sp,
                                                ),

                                                Text(
                                                  "PENGKAJIAN NUTRISI\n(Pengkajian Berdasarkan Malnutrion Screaning Tall)",
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),

                                                Padding(
                                                  padding: EdgeInsets.all(2.sp),
                                                  child: Container(
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
                                                        SizedBox(
                                                          child: Table(
                                                            border:
                                                                TableBorder.all(
                                                                    color: Colors
                                                                        .black),
                                                            children: [
                                                              TableRow(
                                                                  children: [
                                                                    TitleWidget
                                                                        .headerLeftTitle(
                                                                            title:
                                                                                "PARAMETER"),
                                                                    TitleWidget
                                                                        .headerLeftTitle(
                                                                            title:
                                                                                "NILAI"),
                                                                  ]),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          child: Table(
                                                            border: TableBorder
                                                                .all(),
                                                            children: [
                                                              TableRow(
                                                                  children: [
                                                                    TitleWidget
                                                                        .textBox(
                                                                            title:
                                                                                "Apakah pasien mengalami penurunan BB yang tidak diinginkan dalam 6 bulan terakhir ?"),
                                                                    TitleWidget.centerTextBox(
                                                                        title: state
                                                                            .perawat
                                                                            .nutrisiResponse
                                                                            .n1),
                                                                  ]),
                                                              TableRow(
                                                                  children: [
                                                                    TitleWidget
                                                                        .textBox(
                                                                            title:
                                                                                "Apakah asupan makan berkurang karena tidak nafsu makan?"),
                                                                    TitleWidget.centerTextBox(
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
                                                            border:
                                                                TableBorder.all(
                                                                    color: Colors
                                                                        .black),
                                                            children: [
                                                              TableRow(
                                                                  children: [
                                                                    TitleWidget
                                                                        .headerLeftTitle(
                                                                            title:
                                                                                "TOTAL"),
                                                                    TitleWidget.headerLeftTitle(
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
                                                              FontWeight.bold),
                                                ),

                                                TitleWidget.pemeriksaanFisik(
                                                    title: "ELIMINASI BAK",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .eliminasiBak
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
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
                                                              FontWeight.bold),
                                                ),

                                                TitleWidget.pemeriksaanFisik(
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
                                                              FontWeight.bold),
                                                ),

                                                TitleWidget.pemeriksaanFisik(
                                                    title: "MANDI",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .sistemMandi
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
                                                    title: "BERPAKAIAN",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .sistemBerpakaian
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
                                                    title: "MAKAN/MANDI",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .sistemMakan
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
                                                    title: "ELIMINASI",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .sistemEliminasi
                                                        .toUpperCase()),

                                                TitleWidget.pemeriksaanFisik(
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
                                                              FontWeight.bold),
                                                ),

                                                TitleWidget.pemeriksaanFisik(
                                                    title: "KARDIOVASKULER",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .sistemKardiovaskuler
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
                                                    title: "AKRAL",
                                                    value: state.perawat
                                                        .asesmenPerawat.akral
                                                        .toUpperCase()),

                                                TitleWidget.pemeriksaanFisik(
                                                    title: "RESPIRATORI",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .sistemRespiratori
                                                        .toUpperCase()),

                                                TitleWidget.pemeriksaanFisik(
                                                    title: "BATUK",
                                                    value: state.perawat
                                                        .asesmenPerawat.batuk
                                                        .toUpperCase()),

                                                TitleWidget.pemeriksaanFisik(
                                                    title: "SUARA NAPAS",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .suaraNapas
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
                                                    title: "MEROKOK",
                                                    value: state.perawat
                                                        .asesmenPerawat.merokok
                                                        .toUpperCase()),

                                                SizedBox(
                                                  height: 5.sp,
                                                ),

                                                Text(
                                                  "SISTEM PERFUSI SECEBRAL",
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),

                                                TitleWidget.pemeriksaanFisik(
                                                    title: "SECEBRAL",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .sistemSecebral
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
                                                    title: "SAKIT KEPALA",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .sakitKepala
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
                                                    title:
                                                        "PERUBAHAN STATUS METAL",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .perubahanStatusMental
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
                                                    title:
                                                        "LEMAH ANGGOTA GERAK",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .anggotaGerak
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
                                                    title: "BICARA",
                                                    value: state.perawat
                                                        .asesmenPerawat.bicara
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
                                                    title: "RIWAYAT HIPERTENSI",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .riwayatHipertensi
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
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
                                                              FontWeight.bold),
                                                ),

                                                TitleWidget.pemeriksaanFisik(
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
                                                              FontWeight.bold),
                                                ),

                                                TitleWidget.pemeriksaanFisik(
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
                                                              FontWeight.bold),
                                                ),

                                                TitleWidget.pemeriksaanFisik(
                                                    title: "Pencernaan",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .sistemPencernaan
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
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
                                                              FontWeight.bold),
                                                ),

                                                TitleWidget.pemeriksaanFisik(
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
                                                              FontWeight.bold),
                                                ),

                                                Padding(
                                                  padding: EdgeInsets.all(2.sp),
                                                  child: Container(
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
                                                        SizedBox(
                                                          child: Table(
                                                            border:
                                                                TableBorder.all(
                                                                    color: Colors
                                                                        .black),
                                                            children: [
                                                              TableRow(
                                                                  children: [
                                                                    TitleWidget
                                                                        .headerLeftTitle(
                                                                            title:
                                                                                "KRITERIA BARTHERL INDEX"),
                                                                    TitleWidget
                                                                        .headerLeftTitle(
                                                                            title:
                                                                                "HASIL"),
                                                                  ]),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          child: Table(
                                                            border: TableBorder
                                                                .all(),
                                                            children: [
                                                              TableRow(
                                                                  children: [
                                                                    TitleWidget
                                                                        .textBox(
                                                                            title:
                                                                                "Makan"),
                                                                    TitleWidget.textBox(
                                                                        title: state
                                                                            .perawat
                                                                            .fungsional
                                                                            .f1),
                                                                  ]),
                                                              TableRow(
                                                                  children: [
                                                                    TitleWidget
                                                                        .textBox(
                                                                            title:
                                                                                "Aktivitas di toilet"),
                                                                    TitleWidget.textBox(
                                                                        title: state
                                                                            .perawat
                                                                            .fungsional
                                                                            .f2),
                                                                  ]),
                                                              TableRow(
                                                                  children: [
                                                                    TitleWidget
                                                                        .textBox(
                                                                            title:
                                                                                "Berpindah dari kursi roda ke tempat tidur/sebaliknya, termasuk duduk ditempat ditidur"),
                                                                    TitleWidget.textBox(
                                                                        title: state
                                                                            .perawat
                                                                            .fungsional
                                                                            .f3),
                                                                  ]),
                                                              TableRow(
                                                                  children: [
                                                                    TitleWidget
                                                                        .textBox(
                                                                            title:
                                                                                "Kebersihan diri, mencuci muka, menyisir rambut, menggosok gigi"),
                                                                    TitleWidget.textBox(
                                                                        title: state
                                                                            .perawat
                                                                            .fungsional
                                                                            .f4),
                                                                  ]),
                                                              TableRow(
                                                                  children: [
                                                                    TitleWidget
                                                                        .textBox(
                                                                            title:
                                                                                "Mandi"),
                                                                    TitleWidget.textBox(
                                                                        title: state
                                                                            .perawat
                                                                            .fungsional
                                                                            .f5),
                                                                  ]),
                                                              TableRow(
                                                                  children: [
                                                                    TitleWidget
                                                                        .textBox(
                                                                            title:
                                                                                "Berjalan di permukaan datar"),
                                                                    TitleWidget.textBox(
                                                                        title: state
                                                                            .perawat
                                                                            .fungsional
                                                                            .f6),
                                                                  ]),
                                                              TableRow(
                                                                  children: [
                                                                    TitleWidget
                                                                        .textBox(
                                                                            title:
                                                                                "Naik turun tangga"),
                                                                    TitleWidget.textBox(
                                                                        title: state
                                                                            .perawat
                                                                            .fungsional
                                                                            .f7),
                                                                  ]),
                                                              TableRow(
                                                                  children: [
                                                                    TitleWidget
                                                                        .textBox(
                                                                            title:
                                                                                "Berpakaian"),
                                                                    TitleWidget.textBox(
                                                                        title: state
                                                                            .perawat
                                                                            .fungsional
                                                                            .f8),
                                                                  ]),
                                                              TableRow(
                                                                  children: [
                                                                    TitleWidget
                                                                        .textBox(
                                                                            title:
                                                                                "Mengontrol defekasi"),
                                                                    TitleWidget.textBox(
                                                                        title: state
                                                                            .perawat
                                                                            .fungsional
                                                                            .f9),
                                                                  ]),
                                                              TableRow(
                                                                  children: [
                                                                    TitleWidget
                                                                        .textBox(
                                                                            title:
                                                                                "Mengontrol berkemih"),
                                                                    TitleWidget.textBox(
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
                                                            border:
                                                                TableBorder.all(
                                                                    color: Colors
                                                                        .black),
                                                            children: [
                                                              TableRow(
                                                                  children: [
                                                                    TitleWidget
                                                                        .headerLeftTitle(
                                                                            title:
                                                                                "TOTAL"),
                                                                    TitleWidget.headerLeftTitle(
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
                                                              FontWeight.bold),
                                                ),
                                                TitleWidget.pemeriksaanFisik(
                                                    title: "Hambatan Bahasa",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .hambatanBahasa
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
                                                    title:
                                                        "Cara belajar yang disukai",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .caraBelajar
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
                                                    title: "Bahasa Sehari hari",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .bahasaSehari
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
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
                                                              FontWeight.bold),
                                                ),
                                                TitleWidget.pemeriksaanFisik(
                                                    title: "Spikologis",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .spikologis
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
                                                    title: "Hambatan Sosial",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .hambatanSosial
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
                                                    title: "Hambatan Ekonomi",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .hambatanEkonomi
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
                                                    title: "Hambatan Spiritual",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .hambatanSpiritual
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
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
                                                              FontWeight.bold),
                                                ),

                                                TitleWidget.pemeriksaanFisik(
                                                    title: "MENJALANKAN IBADAH",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .nilaiKepercayaan
                                                        .toUpperCase()),

                                                TitleWidget.pemeriksaanFisik(
                                                    title:
                                                        "PRESEPSI TERHADAP SAKIT",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .presepsiSakit
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
                                                    title:
                                                        "KUNJUNGAN PEMIMPIN AGAMA/BIMBINGAN SPIRITUAL",
                                                    value: state
                                                        .perawat
                                                        .asesmenPerawat
                                                        .hambatanSpiritual
                                                        .toUpperCase()),
                                                TitleWidget.pemeriksaanFisik(
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
                                          children: (state.perawat
                                                  .asuhanKeperawatan.isNotEmpty)
                                              ? state.perawat.asuhanKeperawatan
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
                                                                      TitleWidget.headerLeftTitle(
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
                                                                      TitleWidget.textBox(
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
                      ],
                    ),
                  ),

                  // === END
                ],
              ),
            ),
          ),
        );
      },
    );
  }
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
          TableGap.width(300),
          TableGap.weight(),
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
              ": $value1",
              style: blackTextStyle.copyWith(fontSize: 5.sp),
            ),
          ),
        ],
      ),
    ),
  );
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
