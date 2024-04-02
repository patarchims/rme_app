import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/report/report_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/qr_code/custom_qr_widget.dart';
import 'package:hms_app/presentation/report/component/header_with_nomor_rm_widget.dart';
import 'package:sizer/sizer.dart';

class ViewAsesmenKeperawatanBidanIGDWidget extends StatelessWidget {
  const ViewAsesmenKeperawatanBidanIGDWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportBloc, ReportState>(builder: (context, state) {
      if (state.status == ReportStatus.loadingReportTriase) {
        return Scaffold(
          backgroundColor: ThemeColor.transparentColor,
          body: Loading.expandedLoading(),
        );
      }

      if (state.status == ReportStatus.loadedReportTriase &&
          state.reportTriase != null) {
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
                    child: Text("RM.IGD O1",
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
                      SizedBox(
                          width: Get.width,
                          height: 15.sp,
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.sp),
                              child: Text("ASESMEN KEPERAWATAN / BIDAN IGD ",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold)))),
                      const Divider(),
                      boxDuaWidget(
                          title: "Informasi didapat dari ",
                          subTitle: state.reportTriase!.soapPerawat.info),
                      const Divider(),
                      boxDuaWidget(
                          title: "Cara Masuk ",
                          subTitle: state.reportTriase!.soapPerawat.caraMasuk),
                      const Divider(),
                      boxDuaWidget(
                          title: "Asal Masuk ",
                          subTitle: state.reportTriase!.soapPerawat.asalMasuk),
                      const Divider(),
                      boxDuaWidget(
                          title: "Riwayat Penyakit Sekarang ",
                          subTitle:
                              state.reportTriase!.soapPerawat.rwtPenyakit),
                      const Divider(),
                      boxDuaWidget(
                          title: "Riwayat Penyakit Dahulu ",
                          subTitle:
                              state.reportTriase!.soapPerawat.rwtPenyakit),
                      const Divider(),
                      boxDuaWidget(
                          title: "Riwayat Penyakit Sebelumnya ",
                          subTitle:
                              state.reportTriase!.soapPerawat.rwtPenyakit),
                      const Divider(),

                      // =================================== NEW PAGE ============================ //
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.sp),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Skrining Nyeri",
                              style: blackTextStyle,
                            ),
                            Text(
                              "1. Skala Nyeri               : ${state.reportTriase!.soapPerawat.nyeri}",
                              style: blackTextStyle,
                            ),
                            Text(
                              "2. Frekuensi nyeri           :  ${state.reportTriase!.soapPerawat.frekuensiNyeri}",
                              style: blackTextStyle,
                            ),
                            Text(
                              "3. Lama nyeri                : ${state.reportTriase!.soapPerawat.lamaNyeri}",
                              style: blackTextStyle,
                            ),
                            Text(
                              "4. Menjalar                   : ${state.reportTriase!.soapPerawat.menjalar}",
                              style: blackTextStyle,
                            ),
                            Text(
                              "5. Kualitas nyeri              : ${state.reportTriase!.soapPerawat.kualitasNyeri}",
                              style: blackTextStyle,
                            ),
                            Text(
                              "6. Faktor-faktor pemicu/yang memberatkan               : ${state.reportTriase!.soapPerawat.pemicu}",
                              style: blackTextStyle,
                            ),
                            Text(
                              "7. Faktor-faktor yang mengurangi/menghilangkan nyeri :              ${state.reportTriase!.soapPerawat.pengurang}",
                              style: blackTextStyle,
                            ),
                            const Divider(),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.sp),
                                child: Text(
                                  "Skrining fungsi : Aktifitas sehari-hari",
                                  style: blackTextStyle,
                                )),
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "SKRINING RESIKO JATUH",
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "GET UP AND GO TEST",
                                style: blackTextStyle,
                              ),
                            ),
                            SizedBox(
                              height: 10.sp,
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "Pengkajian ( Beri tanda ✓ Centang)",
                                    style: blackTextStyle)),
                            // TABEL PENILAIAN
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: Table(
                                border: TableBorder.all(color: Colors.black),
                                columnWidths: const {
                                  0: FlexColumnWidth(0.2),
                                  1: FlexColumnWidth(2),
                                },
                                children: [
                                  TableRow(children: [
                                    TitleWidget.headerTitle(
                                        title: "No.", color: Colors.white),
                                    TitleWidget.headerTitle(
                                        title: "Penilaian / Pengkajian",
                                        color: Colors.white),
                                    TitleWidget.headerTitle(
                                        title: "Ya", color: Colors.white),
                                    TitleWidget.headerTitle(
                                        title: "Tidak", color: Colors.white),
                                  ]),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: Table(
                                border: TableBorder.all(color: Colors.black),
                                columnWidths: const {
                                  0: FlexColumnWidth(0.2),
                                  1: FlexColumnWidth(2),
                                },
                                children: [
                                  TableRow(children: [
                                    TitleWidget.headerTitleLeft(
                                        title: "1",
                                        color: Colors.white,
                                        blackTextStyle: blackTextStyle),
                                    TitleWidget.headerTitleLeft(
                                        title:
                                            "Cara berjalan pasien (salah satu atu lebih ) \n        1.    Tidak seimbang / sempoyongan / limbung \n        2.    Jalan dengan menggunakan alat bantu (tongkat, tripot, kursi roda, orang lain.)",
                                        color: Colors.white,
                                        blackTextStyle: blackTextStyle),
                                    TitleWidget.headerTitleLeft(
                                        title: (state.reportTriase!.soapPerawat
                                                    .rj1 ==
                                                "Ya")
                                            ? "                 ✓"
                                            : "",
                                        color: Colors.white,
                                        blackTextStyle: blackTextStyle),
                                    TitleWidget.headerTitleLeft(
                                        title: (state.reportTriase!.soapPerawat
                                                    .rj1 ==
                                                "Tidak")
                                            ? "                 ✓"
                                            : "",
                                        color: Colors.white,
                                        blackTextStyle: blackTextStyle),
                                  ]),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: Table(
                                border: TableBorder.all(color: Colors.black),
                                columnWidths: const {
                                  0: FlexColumnWidth(0.2),
                                  1: FlexColumnWidth(2),
                                },
                                children: [
                                  TableRow(children: [
                                    TitleWidget.headerTitleLeft(
                                        title: "2",
                                        color: Colors.white,
                                        blackTextStyle: blackTextStyle),
                                    TitleWidget.headerTitleLeft(
                                        title:
                                            "Menopang saat akan duduk : tampak memegang pinggiran Kursi atau meja / benda lain sebagai penopang saat akan duduk",
                                        color: Colors.white,
                                        blackTextStyle: blackTextStyle),
                                    TitleWidget.headerTitleLeft(
                                        title: (state.reportTriase!.soapPerawat
                                                    .rj2 ==
                                                "Ya")
                                            ? "                 ✓"
                                            : "",
                                        color: Colors.white,
                                        blackTextStyle: blackTextStyle),
                                    TitleWidget.headerTitleLeft(
                                      color: Colors.white,
                                      title: (state.reportTriase!.soapPerawat
                                                  .rj2 ==
                                              "Tidak")
                                          ? "                 ✓"
                                          : "",
                                    ),
                                  ]),
                                ],
                              ),
                            ),

                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Hasil ( Beri tanda ✓ Centang)",
                                    style: blackTextStyle)),

                            // TABEL PENILAIAN
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: Table(
                                border: TableBorder.all(color: Colors.black),
                                columnWidths: const {
                                  0: FlexColumnWidth(0.2),
                                  1: FlexColumnWidth(1.5),
                                },
                                children: [
                                  TableRow(children: [
                                    TitleWidget.headerTitle(
                                        title: "No.", color: Colors.white),
                                    TitleWidget.headerTitle(
                                        title: "Hasil", color: Colors.white),
                                    TitleWidget.headerTitle(
                                        title: "Penilaian / Pengkajian",
                                        color: Colors.white),
                                    TitleWidget.headerTitle(
                                        title: "Keterangan",
                                        color: Colors.white),
                                  ]),
                                ],
                              ),
                            ),
                            descTableHasil(
                                nomor: "1",
                                hasil: "Tidak berisiko",
                                penilaian: "Tidak ditemukan a dan b"),
                            descTableHasil(
                                nomor: "2",
                                hasil: "Resiko Rendah",
                                penilaian: "Ditemukan salah satu a dan b"),
                            descTableHasil(
                                nomor: "3",
                                hasil: "Resiko Tinggi",
                                penilaian: "Ditemukan a dan b"),

                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Tindakan ( Beri tanda ✓ Centang)",
                                    style: blackTextStyle)),

                            // TABEL PENILAIAN
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: Table(
                                border: TableBorder.all(color: Colors.black),
                                columnWidths: const {
                                  0: FlexColumnWidth(0.2),
                                  1: FlexColumnWidth(1.5),
                                },
                                children: [
                                  TableRow(children: [
                                    TitleWidget.headerTitle(
                                        title: "No.", color: Colors.white),
                                    TitleWidget.headerTitle(
                                        title: "Hasil Kajian",
                                        color: Colors.white),
                                    TitleWidget.headerTitle(
                                        title: "Tindakan", color: Colors.white),
                                    TitleWidget.headerTitle(
                                        title: "Ya", color: Colors.white),
                                    TitleWidget.headerTitle(
                                        title: "Tidak", color: Colors.white),
                                    TitleWidget.headerTitle(
                                        title: "TTD & Nama Petugas",
                                        color: Colors.white),
                                    TitleWidget.headerTitle(
                                        title: "TTD & Nama Pasien / Keluarga",
                                        color: Colors.white),
                                  ]),
                                ],
                              ),
                            ),
                            descTable(
                                nomor: "1",
                                hasil: "Tidak bersiko",
                                penilaian: "Tidak ditemukan a dan b"),
                            descTable(
                                nomor: "2",
                                hasil: "Resiko Rendah",
                                penilaian: "Ditemukan salah satu a dan b"),
                            descTable(
                                nomor: "3",
                                hasil: "Resiko Tinggi",
                                penilaian: "Ditemukan a dan b"),

                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Skrining Resiko Dekubitus",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: Table(
                                border: TableBorder.all(color: Colors.black),
                                columnWidths: const {
                                  0: FlexColumnWidth(0.2),
                                  1: FlexColumnWidth(1.5),
                                  2: FlexColumnWidth(0.3),
                                  3: FlexColumnWidth(0.3),
                                },
                                children: [
                                  TableRow(children: [
                                    TitleWidget.headerTitleNoPadding(
                                        title: "*", color: Colors.white),
                                    TitleWidget.headerTitleLeft(
                                        title:
                                            "Apakah pasien menggunakan kursi roda atau membutuhkan bantuan ?",
                                        blackTextStyle: blackTextStyle,
                                        color: Colors.white),
                                    TitleWidget.headerTitleNoPadding(
                                        title: "Ya", color: Colors.white),
                                    TitleWidget.headerTitleNoPadding(
                                        title: "Tidak", color: Colors.white),
                                  ]),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: Table(
                                border: TableBorder.all(color: Colors.black),
                                columnWidths: const {
                                  0: FlexColumnWidth(0.2),
                                  1: FlexColumnWidth(1.5),
                                  2: FlexColumnWidth(0.3),
                                  3: FlexColumnWidth(0.3),
                                },
                                children: [
                                  TableRow(children: [
                                    TitleWidget.headerTitleNoPadding(
                                        title: "*", color: Colors.white),
                                    TitleWidget.headerTitleLeft(
                                        title:
                                            "Apakah ada inkontinensia uri atau alvi ?",
                                        color: Colors.white,
                                        blackTextStyle: blackTextStyle),
                                    TitleWidget.headerTitleNoPadding(
                                        title: "", color: Colors.white),
                                    TitleWidget.headerTitleNoPadding(
                                        title: "", color: Colors.white),
                                  ]),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: Table(
                                border: TableBorder.all(color: Colors.black),
                                columnWidths: const {
                                  0: FlexColumnWidth(0.2),
                                  1: FlexColumnWidth(1.5),
                                  2: FlexColumnWidth(0.3),
                                  3: FlexColumnWidth(0.3),
                                },
                                children: [
                                  TableRow(children: [
                                    TitleWidget.headerTitleNoPadding(
                                      title: "*",
                                      color: Colors.white,
                                    ),
                                    TitleWidget.headerTitleLeft(
                                        title:
                                            "Apakah ada riwayat dekubitus atau luka dekubitus ?",
                                        blackTextStyle: blackTextStyle,
                                        color: Colors.white),
                                    TitleWidget.headerTitleNoPadding(
                                        title: "", color: Colors.white),
                                    TitleWidget.headerTitleNoPadding(
                                        title: "", color: Colors.white),
                                  ]),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: Table(
                                border: TableBorder.all(color: Colors.black),
                                columnWidths: const {
                                  0: FlexColumnWidth(0.2),
                                  1: FlexColumnWidth(1.5),
                                  2: FlexColumnWidth(0.3),
                                  3: FlexColumnWidth(0.3),
                                },
                                children: [
                                  TableRow(children: [
                                    TitleWidget.headerTitleNoPadding(
                                        title: "*", color: Colors.white),
                                    TitleWidget.headerTitleLeft(
                                        title:
                                            "Apakah pasien diatas 65 tahun ?",
                                        blackTextStyle: blackTextStyle,
                                        color: Colors.white),
                                    TitleWidget.headerTitleNoPadding(
                                        title: "", color: Colors.white),
                                    TitleWidget.headerTitleNoPadding(
                                        title: "", color: Colors.white),
                                  ]),
                                ],
                              ),
                            ),

                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Khusus Anak",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: Table(
                                border: TableBorder.all(color: Colors.black),
                                columnWidths: const {
                                  0: FlexColumnWidth(0.2),
                                  1: FlexColumnWidth(1.5),
                                  2: FlexColumnWidth(0.3),
                                  3: FlexColumnWidth(0.3),
                                },
                                children: [
                                  TableRow(children: [
                                    TitleWidget.headerTitleNoPadding(
                                        title: "*", color: Colors.white),
                                    TitleWidget.headerTitleLeft(
                                        title:
                                            "Apakah extremitas dan badan tidak sesuai dengan usia perkembangan  ?",
                                        blackTextStyle: blackTextStyle,
                                        color: Colors.white),
                                    TitleWidget.headerTitleNoPadding(
                                        title: "Ya", color: Colors.white),
                                    TitleWidget.headerTitleNoPadding(
                                        title: "Tidak", color: Colors.white),
                                  ]),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: Table(
                                border: TableBorder.all(color: Colors.black),
                                columnWidths: const {
                                  0: FlexColumnWidth(0.2),
                                  1: FlexColumnWidth(1.5),
                                  2: FlexColumnWidth(0.3),
                                  3: FlexColumnWidth(0.3),
                                },
                                children: [
                                  TableRow(children: [
                                    TitleWidget.headerTitleNoPadding(
                                        title: "*", color: Colors.white),
                                    TitleWidget.headerTitleLeft(
                                        title:
                                            "Apakah ada inkontinensia uri atau alvi ?",
                                        color: Colors.white,
                                        blackTextStyle: blackTextStyle),
                                    TitleWidget.headerTitleNoPadding(
                                        title: "", color: Colors.white),
                                    TitleWidget.headerTitleNoPadding(
                                        title: "", color: Colors.white),
                                  ]),
                                ],
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Riwayat Kehamilan",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: Table(
                                border: TableBorder.all(color: Colors.black),
                                columnWidths: const {
                                  0: FlexColumnWidth(0.2),
                                  1: FlexColumnWidth(1.5),
                                },
                                children: [
                                  TableRow(children: [
                                    TitleWidget.headerTitleNoPadding(
                                        title: "✓", color: Colors.white),
                                    TitleWidget.headerTitleLeft(
                                        title: "Hamil, Gravida : ......",
                                        blackTextStyle: blackTextStyle,
                                        color: Colors.white),
                                    TitleWidget.headerTitleLeft(
                                        title: "Para : .......",
                                        blackTextStyle: blackTextStyle,
                                        color: Colors.white),
                                    TitleWidget.headerTitleLeft(
                                        title: "Abortus : ......",
                                        blackTextStyle: blackTextStyle,
                                        color: Colors.white),
                                    TitleWidget.headerTitleLeft(
                                        title: "HPHT : ......",
                                        blackTextStyle: blackTextStyle,
                                        color: Colors.white),
                                    TitleWidget.headerTitleLeft(
                                        title: "TTP : ......",
                                        blackTextStyle: blackTextStyle,
                                        color: Colors.white),
                                  ]),
                                ],
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Pemeriksaan Kebidanan",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Leopoid I :",
                                    style: blackTextStyle.copyWith())),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Leopoid II :",
                                    style: blackTextStyle.copyWith())),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Leopoid III :",
                                    style: blackTextStyle.copyWith())),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Leopoid IV :",
                                    style: blackTextStyle.copyWith())),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Djj :",
                                    style: blackTextStyle.copyWith())),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("VT :",
                                    style: blackTextStyle.copyWith())),

                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Masalah Keperawtan dan Kebidanan",
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 15.sp,
                            ),
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Intervensi Keperawtan / Kebidanan",
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.all(5.sp),
                              child: Text(
                                "Pemberian Obat / Infus",
                                style: blackTextStyle,
                              ),
                            ),
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Edukasi",
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Lain-lain",
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Kondisi Pasien Satt Pindah / Pulang dari IGD :",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                )),
                            const Divider(),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Transportasi Pulang :",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                )),
                            const Divider(),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "Pendidikan kesehatan pasien pulang :",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold))),

                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Pukul :",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                )),

                            Center(
                              child: Text(
                                "Perawat",
                                style: blackTextStyle,
                              ),
                            ),

                            CustomQrWidget(
                              dimension: 30.sp,
                              dataBarcode: state.perawat.asesmenPerawat.nama,
                            ),

                            Center(
                              child: Text(
                                " ( ....................................... ) ",
                                style: blackTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.sp),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }

      return Container();
    });
  }

  Container descTable({
    required String nomor,
    required String hasil,
    required String penilaian,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: Table(
        border: TableBorder.all(color: Colors.black),
        columnWidths: const {
          0: FlexColumnWidth(0.2),
          1: FlexColumnWidth(1.5),
        },
        children: [
          TableRow(children: [
            TitleWidget.headerTitleLeft(
                title: nomor,
                color: Colors.white,
                blackTextStyle: blackTextStyle),
            TitleWidget.headerTitleLeft(
                title: hasil,
                color: Colors.white,
                blackTextStyle: blackTextStyle),
            TitleWidget.headerTitleLeft(
                title: penilaian,
                color: Colors.white,
                blackTextStyle: blackTextStyle),
            TitleWidget.headerTitleLeft(
                title: " ",
                color: Colors.white,
                blackTextStyle: blackTextStyle),
            TitleWidget.headerTitleLeft(
                title: " ",
                color: Colors.white,
                blackTextStyle: blackTextStyle),
            TitleWidget.headerTitleLeft(
                title: " ",
                color: Colors.white,
                blackTextStyle: blackTextStyle),
            TitleWidget.headerTitleLeft(
                title: " ",
                color: Colors.white,
                blackTextStyle: blackTextStyle),
          ]),
        ],
      ),
    );
  }

  Container descTableHasil({
    required String nomor,
    required String hasil,
    required String penilaian,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: Table(
        border: TableBorder.all(color: Colors.black),
        columnWidths: const {
          0: FlexColumnWidth(0.2),
          1: FlexColumnWidth(1.5),
        },
        children: [
          TableRow(children: [
            TitleWidget.headerTitleLeft(
                title: nomor,
                color: Colors.white,
                blackTextStyle: blackTextStyle),
            TitleWidget.headerTitleLeft(
                title: hasil,
                color: Colors.white,
                blackTextStyle: blackTextStyle),
            TitleWidget.headerTitleLeft(
                title: penilaian,
                color: Colors.white,
                blackTextStyle: blackTextStyle),
            TitleWidget.headerTitleLeft(
                title: " ",
                color: Colors.white,
                blackTextStyle: blackTextStyle),
          ]),
        ],
      ),
    );
  }

  SizedBox boxDuaWidget({required String title, required String subTitle}) {
    return SizedBox(
      width: Get.width,
      height: 15.sp,
      child: Row(
        children: [
          SizedBox(
            width: Get.width / 4,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.sp),
              child: Text(
                title,
                style: blackTextStyle,
              ),
            ),
          ),
          const VerticalDivider(),
          Expanded(
              child: Container(
            height: 15.sp,
            color: Colors.white,
            child: Text(
              subTitle,
              style: blackTextStyle,
            ),
          )),
        ],
      ),
    );
  }
}
