import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/report/report_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/report/component/header_with_nomor_rm_widget.dart';
import 'package:sizer/sizer.dart';

class RingkasanPulangContentWidget extends StatefulWidget {
  const RingkasanPulangContentWidget({super.key});

  @override
  State<RingkasanPulangContentWidget> createState() =>
      _RingkasanPulangContentWidgetState();
}

class _RingkasanPulangContentWidgetState
    extends State<RingkasanPulangContentWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportBloc, ReportState>(
      builder: (context, state) {
        if (state.status == ReportStatus.loadingReportRingkasanPulang) {
          return Scaffold(
            backgroundColor: ThemeColor.transparentColor,
            body: Loading.expandedLoading(),
          );
        }

        if (state.status == ReportStatus.loadedRingkasanPulang &&
            state.reportRingkasanPulang != null) {
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
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 5.sp),
                          child: Text("RM.RI O5",
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
                            const HeaderWithNomorRMWidget(),

                            const Divider(),

                            Center(
                              child: Text(
                                "RINGKASAN PULANG",
                                textAlign: TextAlign.center,
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: (state.reportRingkasanPulang!
                                          .ringkasanPulang.tglMasuk.length >
                                      1)
                                  ? Text(
                                      "Tanggal Masuk :      ${state.reportRingkasanPulang!.ringkasanPulang.tglMasuk.substring(0, 10)}",
                                      style: blackTextStyle,
                                    )
                                  : Text(
                                      "Tanggal Masuk :      ",
                                      style: blackTextStyle,
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Ruang rawat terakhir :   ${state.reportRingkasanPulang!.ringkasanPulang.bagian}",
                                style: blackTextStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Dokter penangung jawab (DPJP) : ${state.reportRingkasanPulang!.ringkasanPulang.namaDokter}",
                                style: blackTextStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Rawat Tim dokter :",
                                style: blackTextStyle,
                              ),
                            ),

                            const Divider(),

                            SizedBox(
                              width: Get.width,
                              height: 50.sp,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: Get.width / 4,
                                    height: 50.sp,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4.sp),
                                      child: Text(
                                        "Alasan Dirawat (sesuai Clinical Pathway) Keluhan utama/Riwayatpenyakit ",
                                        style: blackTextStyle,
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(),
                                  Expanded(
                                      child: Container(
                                    height: 50.sp,
                                    color: Colors.white,
                                    child: Text(state.reportRingkasanPulang!
                                        .ringkasanPulang.anamnesa),
                                  ))
                                ],
                              ),
                            ),

                            const Divider(),

                            SizedBox(
                              width: Get.width,
                              height: 50.sp,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: Get.width / 4,
                                    height: 50.sp,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4.sp),
                                      child: Text(
                                        "Diagnosis Masuk ",
                                        style: blackTextStyle,
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(),
                                  Expanded(
                                      child: Container(
                                    height: 50.sp,
                                    color: Colors.white,
                                  ))
                                ],
                              ),
                            ),

                            const Divider(),

                            SizedBox(
                              width: Get.width,
                              height: 50.sp,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: Get.width / 4,
                                    height: 50.sp,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4.sp),
                                      child: Text(
                                        "Pemeriksaan fisik yang penting ",
                                        style: blackTextStyle,
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(),
                                  Expanded(
                                      child: Container(
                                    height: 50.sp,
                                    color: Colors.white,
                                  ))
                                ],
                              ),
                            ),
                            const Divider(),
                            SizedBox(
                              width: Get.width,
                              height: 50.sp,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: Get.width / 4,
                                    height: 50.sp,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4.sp),
                                      child: Text(
                                        "Pemeriksaan fisik yang penting ",
                                        style: blackTextStyle,
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(),
                                  Expanded(
                                      child: Container(
                                    height: 50.sp,
                                    color: Colors.white,
                                  ))
                                ],
                              ),
                            ),
                            const Divider(),
                            SizedBox(
                              width: Get.width,
                              height: 50.sp,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: Get.width / 4,
                                    height: 50.sp,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4.sp),
                                      child: Text(
                                        "Laboratorium yang penting",
                                        style: blackTextStyle,
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(),
                                  Expanded(
                                      child: Container(
                                    height: 50.sp,
                                    color: Colors.white,
                                  ))
                                ],
                              ),
                            ),
                            const Divider(),
                            SizedBox(
                              width: Get.width,
                              height: 50.sp,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: Get.width / 4,
                                    height: 50.sp,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4.sp),
                                      child: Text(
                                        "Penunjang Lain",
                                        style: blackTextStyle,
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(),
                                  Expanded(
                                      child: Container(
                                    height: 50.sp,
                                    color: Colors.white,
                                  ))
                                ],
                              ),
                            ),
                            const Divider(),
                            SizedBox(
                              width: Get.width,
                              height: 50.sp,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: Get.width / 4,
                                    height: 50.sp,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4.sp),
                                      child: Text(
                                        "Diagnosa keluar\n(Diagnosa Utama)",
                                        style: blackTextStyle,
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(),
                                  Expanded(
                                      child: Container(
                                    height: 50.sp,
                                    color: Colors.white,
                                    child: Text(
                                      "${state.reportRingkasanPulang!.ringkasanPulang.primer}-${state.reportRingkasanPulang!.ringkasanPulang.primerDesc}",
                                      style: blackTextStyle,
                                    ),
                                  ))
                                ],
                              ),
                            ),
                            const Divider(),
                            SizedBox(
                              width: Get.width,
                              height: 50.sp,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: Get.width / 4,
                                    height: 50.sp,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4.sp),
                                      child: Text(
                                        "Diagnosa Sekunder",
                                        style: blackTextStyle,
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(),
                                  Expanded(
                                      child: Container(
                                    height: 50.sp,
                                    color: Colors.white,
                                    child: Text(
                                      "${state.reportRingkasanPulang!.ringkasanPulang.secundary1}-${state.reportRingkasanPulang!.ringkasanPulang.secundary1}",
                                      style: blackTextStyle,
                                    ),
                                  ))
                                ],
                              ),
                            ),
                            const Divider(),
                            SizedBox(
                              width: Get.width,
                              height: 20.sp,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: Get.width / 4,
                                    height: 50.sp,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4.sp),
                                      child: Text(
                                        "Tindakan / Operasi",
                                        style: blackTextStyle,
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(),
                                  Expanded(
                                      child: Container(
                                    height: 50.sp,
                                    color: Colors.white,
                                  ))
                                ],
                              ),
                            ),
                            const Divider(),
                            SizedBox(
                              width: Get.width,
                              height: 20.sp,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: Get.width / 4,
                                    height: 50.sp,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4.sp),
                                      child: Text(
                                        "Cara Pulang",
                                        style: blackTextStyle,
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(),
                                  Expanded(
                                      child: Container(
                                    height: 50.sp,
                                    color: Colors.white,
                                  ))
                                ],
                              ),
                            ),
                            const Divider(),
                            SizedBox(
                              width: Get.width,
                              height: 20.sp,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: Get.width / 4,
                                    height: 50.sp,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4.sp),
                                      child: Text(
                                        "Kondisi Pulang",
                                        style: blackTextStyle,
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(),
                                  Expanded(
                                      child: Container(
                                    height: 50.sp,
                                    color: Colors.white,
                                  ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.sp,
                      )
                    ],
                  ),
                ),
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
            child: RawScrollbar(
              thumbColor: ThemeColor.darkColor,
              thumbVisibility: true,
              interactive: true,
              thickness: 5.sp,
              controller: _scrollController,
              trackVisibility: false,
              radius: Radius.circular(5.sp),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 5.sp),
                        child: Text("RM.RI O5",
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
                          const HeaderWithNomorRMWidget(),

                          const Divider(),

                          Center(
                            child: Text(
                              "RINGKASAN PULANG",
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Tanggal Masuk :      ",
                              style: blackTextStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Ruang rawat terakhir :  ",
                              style: blackTextStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Dokter penangung jawab (DPJP) : ",
                              style: blackTextStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Rawat Tim dokter :",
                              style: blackTextStyle,
                            ),
                          ),

                          const Divider(),

                          SizedBox(
                            width: Get.width,
                            height: 50.sp,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width / 4,
                                  height: 50.sp,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.sp),
                                    child: Text(
                                      "Alasan Dirawat (sesuai Clinical Pathway) Keluhan utama/Riwayatpenyakit ",
                                      style: blackTextStyle,
                                    ),
                                  ),
                                ),
                                const VerticalDivider(),
                                Expanded(
                                    child: Container(
                                  height: 50.sp,
                                  color: Colors.white,
                                  child: const Text(""),
                                ))
                              ],
                            ),
                          ),

                          const Divider(),

                          SizedBox(
                            width: Get.width,
                            height: 50.sp,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width / 4,
                                  height: 50.sp,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.sp),
                                    child: Text(
                                      "Diagnosis Masuk ",
                                      style: blackTextStyle,
                                    ),
                                  ),
                                ),
                                const VerticalDivider(),
                                Expanded(
                                    child: Container(
                                  height: 50.sp,
                                  color: Colors.white,
                                ))
                              ],
                            ),
                          ),

                          const Divider(),

                          SizedBox(
                            width: Get.width,
                            height: 50.sp,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width / 4,
                                  height: 50.sp,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.sp),
                                    child: Text(
                                      "Pemeriksaan fisik yang penting ",
                                      style: blackTextStyle,
                                    ),
                                  ),
                                ),
                                const VerticalDivider(),
                                Expanded(
                                    child: Container(
                                  height: 50.sp,
                                  color: Colors.white,
                                ))
                              ],
                            ),
                          ),
                          const Divider(),
                          SizedBox(
                            width: Get.width,
                            height: 50.sp,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width / 4,
                                  height: 50.sp,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.sp),
                                    child: Text(
                                      "Pemeriksaan fisik yang penting ",
                                      style: blackTextStyle,
                                    ),
                                  ),
                                ),
                                const VerticalDivider(),
                                Expanded(
                                    child: Container(
                                  height: 50.sp,
                                  color: Colors.white,
                                ))
                              ],
                            ),
                          ),
                          const Divider(),
                          SizedBox(
                            width: Get.width,
                            height: 50.sp,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width / 4,
                                  height: 50.sp,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.sp),
                                    child: Text(
                                      "Laboratorium yang penting",
                                      style: blackTextStyle,
                                    ),
                                  ),
                                ),
                                const VerticalDivider(),
                                Expanded(
                                    child: Container(
                                  height: 50.sp,
                                  color: Colors.white,
                                ))
                              ],
                            ),
                          ),
                          const Divider(),
                          SizedBox(
                            width: Get.width,
                            height: 50.sp,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width / 4,
                                  height: 50.sp,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.sp),
                                    child: Text(
                                      "Penunjang Lain",
                                      style: blackTextStyle,
                                    ),
                                  ),
                                ),
                                const VerticalDivider(),
                                Expanded(
                                    child: Container(
                                  height: 50.sp,
                                  color: Colors.white,
                                ))
                              ],
                            ),
                          ),
                          const Divider(),
                          SizedBox(
                            width: Get.width,
                            height: 50.sp,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width / 4,
                                  height: 50.sp,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.sp),
                                    child: Text(
                                      "Diagnosa keluar\n(Diagnosa Utama)",
                                      style: blackTextStyle,
                                    ),
                                  ),
                                ),
                                const VerticalDivider(),
                                Expanded(
                                    child: Container(
                                  height: 50.sp,
                                  color: Colors.white,
                                  child: Text(
                                    "",
                                    style: blackTextStyle,
                                  ),
                                ))
                              ],
                            ),
                          ),
                          const Divider(),
                          SizedBox(
                            width: Get.width,
                            height: 50.sp,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width / 4,
                                  height: 50.sp,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.sp),
                                    child: Text(
                                      "Diagnosa Sekunder",
                                      style: blackTextStyle,
                                    ),
                                  ),
                                ),
                                const VerticalDivider(),
                                Expanded(
                                    child: Container(
                                  height: 50.sp,
                                  color: Colors.white,
                                  child: Text(
                                    "",
                                    style: blackTextStyle,
                                  ),
                                ))
                              ],
                            ),
                          ),
                          const Divider(),
                          SizedBox(
                            width: Get.width,
                            height: 20.sp,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width / 4,
                                  height: 50.sp,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.sp),
                                    child: Text(
                                      "Tindakan / Operasi",
                                      style: blackTextStyle,
                                    ),
                                  ),
                                ),
                                const VerticalDivider(),
                                Expanded(
                                    child: Container(
                                  height: 50.sp,
                                  color: Colors.white,
                                ))
                              ],
                            ),
                          ),
                          const Divider(),
                          SizedBox(
                            width: Get.width,
                            height: 20.sp,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width / 4,
                                  height: 50.sp,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.sp),
                                    child: Text(
                                      "Cara Pulang",
                                      style: blackTextStyle,
                                    ),
                                  ),
                                ),
                                const VerticalDivider(),
                                Expanded(
                                    child: Container(
                                  height: 50.sp,
                                  color: Colors.white,
                                ))
                              ],
                            ),
                          ),
                          const Divider(),
                          SizedBox(
                            width: Get.width,
                            height: 20.sp,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width / 4,
                                  height: 50.sp,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.sp),
                                    child: Text(
                                      "Kondisi Pulang",
                                      style: blackTextStyle,
                                    ),
                                  ),
                                ),
                                const VerticalDivider(),
                                Expanded(
                                    child: Container(
                                  height: 50.sp,
                                  color: Colors.white,
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Row judul({required String title}) {
    return Row(
      children: [
        SizedBox(
          width: 50.sp,
          child: Text(
            title,
            style: blackTextStyle,
          ),
        ),
        SizedBox(
          child: Text(
            ":",
            style: blackTextStyle,
          ),
        )
      ],
    );
  }
}
