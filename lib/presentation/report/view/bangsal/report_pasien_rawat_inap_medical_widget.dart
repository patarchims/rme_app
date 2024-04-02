import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/report/component/header_with_nomor_rm_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../../domain/bloc/report/report_bloc.dart';

class ReportRawatInapMedicalWidget extends StatelessWidget {
  const ReportRawatInapMedicalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportBloc, ReportState>(
      builder: (context, state) {
        if (state.status == ReportStatus.loadingReportRawatInapAnak) {
          return Loading.expandedLoading();
        }
        if (state.status == ReportStatus.loadedReportRawwtInapAnak &&
            state.reportRawatInapResponse != null) {
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
                      child: Text("RM.RI O3 A",
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
                        Center(
                          child: Column(
                            children: [
                              Text(
                                "PENGKAJIAN AWAL PASIEN RAWAT INAP MEDICAL",
                                textAlign: TextAlign.center,
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "( Asessmen ini harus sudah selesai sebelum 24 jam pasien masuk ke ruangan rawat inap )",
                                textAlign: TextAlign.center,
                                style: blackTextStyle.copyWith(fontSize: 6.sp),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 10.sp),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Diisi oleh Perawat IGD/Ruangan",
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 25.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 8,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Tgl Masuk ",
                                    style: blackTextStyle.copyWith(),
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              SizedBox(
                                width: Get.width / 4,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    " ",
                                    style: blackTextStyle.copyWith(),
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              SizedBox(
                                width: Get.width / 8,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Masuk Pukul ",
                                    style: blackTextStyle.copyWith(),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                height: 25.sp,
                                color: Colors.white,
                              ))
                            ],
                          ),
                        ),
                        const Divider(),

                        SizedBox(
                          height: 15.sp,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Diisi oleh Dokter Medical",
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 25.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Keluhan Utama ",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                  child: Container(
                                height: 25.sp,
                                color: Colors.white,
                              ))
                            ],
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 25.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Telaah ",
                                    style: blackTextStyle.copyWith(),
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                  child: Container(
                                height: 25.sp,
                                color: Colors.white,
                              ))
                            ],
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 25.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "RPT dll",
                                    style: blackTextStyle.copyWith(),
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                  child: Container(
                                height: 25.sp,
                                color: Colors.white,
                              ))
                            ],
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 25.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Riwayat Penyakit Keluarga ",
                                    style: blackTextStyle.copyWith(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 25.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Riwayat Alergi  :",
                                    style: blackTextStyle.copyWith(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),

                        SizedBox(
                          height: 15.sp,
                        ),
                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 15.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 3,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Gangguan Perilaku ",
                                    style: blackTextStyle.copyWith(),
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                  child: Container(
                                height: 25.sp,
                                color: Colors.white,
                              ))
                            ],
                          ),
                        ),

                        const Divider(),

                        SizedBox(
                          height: 25.sp,
                        )
                      ],
                    ),
                  ),

                  // =================================== NEW PAGE ============================ //
                  SizedBox(height: 15.sp),

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
                        // TAMPILKAN DAT
                        Text(
                          "  Diisi oleh Perawat IGD/Ruangan",
                          style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        ),

                        SizedBox(
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            children: [
                              TableRow(children: [
                                TitleWidget.headerTitleLeft(
                                    title: "Keadaan \nUmum",
                                    blackTextStyle: blackTextStyle,
                                    color: Colors.white),
                                TitleWidget.headerTitleLeft(
                                    title: "",
                                    blackTextStyle: blackTextStyle,
                                    color: Colors.white),
                              ]),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            children: [
                              TableRow(children: [
                                TitleWidget.headerTitleLeft(
                                    title: "Kesadaran",
                                    blackTextStyle: blackTextStyle,
                                    color: Colors.white),
                                TitleWidget.headerTitleLeft(
                                    title: "",
                                    blackTextStyle: blackTextStyle,
                                    color: Colors.white),
                              ]),
                            ],
                          ),
                        ),

                        SizedBox(
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            children: [
                              TableRow(children: [
                                TitleWidget.headerTitleLeft(
                                    title: "Vital Sign",
                                    blackTextStyle: blackTextStyle,
                                    color: Colors.white),
                                TitleWidget.headerTitleLeft(
                                    title: "",
                                    blackTextStyle: blackTextStyle,
                                    color: Colors.white),
                              ]),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.sp),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: Text(
                            "Pemeriksaan Fisik",
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 45.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Kepala & Leher ",
                                    style: blackTextStyle.copyWith(),
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                  child: Container(
                                height: 25.sp,
                                color: Colors.white,
                              )),
                            ],
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 45.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Dada ",
                                    style: blackTextStyle,
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                  child: Container(
                                height: 25.sp,
                                color: Colors.white,
                              )),
                            ],
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 45.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Alasan Opname ",
                                    style: blackTextStyle,
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                  child: Container(
                                height: 25.sp,
                                color: Colors.white,
                              )),
                            ],
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 45.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Abdomen ",
                                    style: blackTextStyle,
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                  child: Container(
                                height: 25.sp,
                                color: Colors.white,
                              )),
                            ],
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 45.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Konsul Ke ",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                  child: Container(
                                height: 25.sp,
                                color: Colors.white,
                              )),
                            ],
                          ),
                        ),
                        const Divider(),
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
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 5.sp),
                    child: Text("RM.RI O3 C",
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
                      Center(
                        child: Column(
                          children: [
                            Text(
                              "PENGKAJIAN AWAL PASIEN RAWAT INAP ANAK",
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "(Pengisian harus selesai setelah pasien selesai diperiksa )",
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(fontSize: 6.sp),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Pentunjuk beri tanda (✓) pada kolom yang anda anggap sesuai dengan kondisi pasien",
                          style: blackTextStyle,
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        width: Get.width,
                        height: 25.sp,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width / 4,
                              height: 25.sp,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: Text(
                                  "Keluhan Utama ",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            Expanded(
                                child: Container(
                              height: 25.sp,
                              color: Colors.white,
                            ))
                          ],
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        width: Get.width,
                        height: 25.sp,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width / 4,
                              height: 25.sp,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: Text(
                                  "Tanda-tanda Vital ",
                                  style: blackTextStyle.copyWith(),
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            Expanded(
                                child: Container(
                              height: 25.sp,
                              color: Colors.white,
                            ))
                          ],
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        width: Get.width,
                        height: 25.sp,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width / 4,
                              height: 25.sp,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: Text(
                                  "Status Alergi ",
                                  style: blackTextStyle.copyWith(),
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            Expanded(
                                child: Container(
                              height: 25.sp,
                              color: Colors.white,
                            ))
                          ],
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        width: Get.width,
                        height: 15.sp,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width / 3,
                              height: 25.sp,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: Text(
                                  "Gangguan Perilaku ",
                                  style: blackTextStyle.copyWith(),
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            Expanded(
                                child: Container(
                              height: 25.sp,
                              color: Colors.white,
                            ))
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              TitleWidget.headerTitleLeft(
                                  title: "Bersuara", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "Bersuara Normal,Tenang",
                                  color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title:
                                      "Tenang bila dipeluk,digendong atu diajak bicara",
                                  color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "Sulit menenangkan",
                                  color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "0", color: Colors.white),
                            ]),
                          ],
                        ),
                      ),

                      const Divider(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              TitleWidget.headerTitleLeft(
                                  title: "", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "SKALA TRIASE", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "RESPONSE TIME", color: Colors.white),
                            ]),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              TitleWidget.headerTitleLeft(
                                  title: "", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "SKALA 1", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "Segara", color: Colors.white),
                            ]),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              TitleWidget.headerTitleLeft(
                                  title: "", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "SKALA 2", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "10 Menit", color: Colors.white),
                            ]),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              TitleWidget.headerTitleLeft(
                                  title: "", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "SKALA 3", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "30 Menit", color: Colors.white),
                            ]),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              TitleWidget.headerTitleLeft(
                                  title: "", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "SKALA 4", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "60 Menit", color: Colors.white),
                            ]),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              TitleWidget.headerTitleLeft(
                                  title: "", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "SKALA 5", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "120 Menit", color: Colors.white),
                            ]),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 25.sp,
                      )
                    ],
                  ),
                ),

                // =================================== NEW PAGE ============================ //
                SizedBox(
                  height: 15.sp,
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

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        width: Get.width,
                        child: Text(" Riwayat Penyakit Keluarga",
                            style: blackTextStyle.copyWith()),
                      ),
                      const Divider(),

                      SizedBox(
                        height: 15.sp,
                      ),
                      Text(
                        "  Pemeriksaan Fisik",
                        style: blackTextStyle.copyWith(
                            fontWeight: FontWeight.bold),
                      ),

                      SizedBox(height: 15.sp),

                      Padding(
                        padding: EdgeInsets.all(5.sp),
                        child: Text(
                          "Kode Gambar",
                          style: blackTextStyle,
                        ),
                      ),

                      const Divider(),
                      SizedBox(
                        width: Get.width,
                        height: 45.sp,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width / 4,
                              height: 25.sp,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: Text(
                                  "Rencana Penunjang ",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            SizedBox(
                              width: 150.sp,
                            ),
                            const VerticalDivider(),
                            Expanded(
                                child: Container(
                              height: 25.sp,
                              color: Colors.white,
                            )),
                          ],
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        width: Get.width,
                        height: 45.sp,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width / 4,
                              height: 25.sp,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: Text(
                                  "Diagnosis ",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            Expanded(
                                child: Container(
                              height: 25.sp,
                              color: Colors.white,
                            )),
                          ],
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        width: Get.width,
                        height: 45.sp,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width / 4,
                              height: 25.sp,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: Text(
                                  "Alasan Opname ",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            Expanded(
                                child: Container(
                              height: 25.sp,
                              color: Colors.white,
                            )),
                          ],
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        width: Get.width,
                        height: 45.sp,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width / 4,
                              height: 25.sp,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: Text(
                                  "Rencana Asuhan / Terapi ",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            SizedBox(
                              width: 150.sp,
                            ),
                            const VerticalDivider(),
                            Expanded(
                                child: Container(
                              height: 25.sp,
                              color: Colors.white,
                            )),
                          ],
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        width: Get.width,
                        height: 45.sp,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width / 4,
                              height: 25.sp,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: Text(
                                  "Konsul Ke ",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            Expanded(
                                child: Container(
                              height: 25.sp,
                              color: Colors.white,
                            )),
                          ],
                        ),
                      ),
                      const Divider(),
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
}
