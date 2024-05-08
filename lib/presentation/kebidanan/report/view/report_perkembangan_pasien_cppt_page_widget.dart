import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/report/report_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/qr_code/custom_qr_widget.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class ReportPerkembanganPasienCPTTPageWidget extends StatefulWidget {
  const ReportPerkembanganPasienCPTTPageWidget({super.key});

  @override
  State<ReportPerkembanganPasienCPTTPageWidget> createState() =>
      _ReportPerkembanganPasienCPTTPageWidgetState();
}

class _ReportPerkembanganPasienCPTTPageWidgetState
    extends State<ReportPerkembanganPasienCPTTPageWidget> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    AuthState authState = context.watch<AuthBloc>().state;

    return BlocBuilder<ReportBloc, ReportState>(
      builder: (context, state) {
        if (state.status == ReportStatus.loadingReportCPPTPasien) {
          return Scaffold(
            backgroundColor: ThemeColor.transparentColor,
            body: Loading.expandedLoading(),
          );
        }

        if (state.status == ReportStatus.loadedReportCPPTPasien) {
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
                          child: Text("RM. 07",
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
                            Padding(
                              padding: EdgeInsets.all(4.sp),
                              child: Center(
                                child: Text(
                                  "CATATAN PERKEMBANGAN PASIEN TERINTEGRASI (CPPT)",
                                  textAlign: TextAlign.center,
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 9.sp),
                                ),
                              ),
                            ),

                            if (authState is Authenticated) ...[
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
                                      TableGap.weight(),
                                    ],
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(8),
                                        child: (singlePasien
                                                    .first.tglLahir.length >
                                                10)
                                            ? Text(
                                                "Nama Pasien         :      ${singlePasien.first.namaPasien}  \nTanggal Lahir        :       ${tglIndo(singlePasien.first.tglLahir.substring(0, 10))}",
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 6.sp),
                                                textAlign: TextAlign.left,
                                              )
                                            : Text(
                                                "Nama Pasien         :      ${singlePasien.first.namaPasien}   \nTanggal Lahir        :      ${singlePasien.first.tglLahir} ",
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 6.sp),
                                                textAlign: TextAlign.left,
                                              ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          "Nomor Rekam Medis           :     ${singlePasien.first.mrn}   \nRuangan                                :      ${authState.user.bagian}",
                                          style: blackTextStyle.copyWith(
                                              fontSize: 6.sp),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],

                            SizedBox(
                              height: 5.sp,
                            ),

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
                                    TableGap.width(120),
                                    TableGap.width(150),
                                    TableGap.weight(),
                                    TableGap.width(180),
                                    TableGap.width(200),
                                  ],
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Center(
                                          child: Text(
                                            "Tgl/Jam",
                                            style: blackTextStyle.copyWith(
                                                fontSize: 5.sp,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Center(
                                          child: Text(
                                            "Profesional Pemberi Asuhan",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 5.sp),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Center(
                                          child: Text(
                                            "Hasil Asesmen - IAR Penatalaksaan Pasien ( Tulis dengan format SOAP / ADIME, diserta Sasaran. Tulis nama, beri paraf pada akhir catatan )",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 5.sp),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Center(
                                          child: Text(
                                            "Instruksi PPA Termasuk Pasca Bedah ( Intruksi ditulis dengan cinrin dan jelas)",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 5.sp),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Center(
                                          child: Text(
                                            "Verifikasi DPJP ( Tulis Nama, Beri Paraf, Tgl, Jam) (DPJP harus membaca/mereview seluruh rencana asuhan)",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 5.sp),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            if (state.cpptPasien.isNotEmpty) ...[
                              ...state.cpptPasien.asMap().entries.map(
                                    (e) => Container(
                                      color: Colors.white,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.sp),
                                      child: TableDesk(
                                        shape: const RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Colors.black, width: 1),
                                        ),
                                        child: TableDeskRow(
                                          border: const BorderSide(
                                              width: 1, color: Colors.black),
                                          gaps: [
                                            TableGap.width(120),
                                            TableGap.width(150),
                                            TableGap.weight(),
                                            TableGap.width(180),
                                            TableGap.width(200),
                                          ],
                                          children: [
                                            //=====//
                                            Container(
                                                color: Colors.white,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Center(
                                                    child: Text(
                                                      "${tglIndo(e.value.tanggal.substring(0, 10))} /${e.value.insertDttm.substring(11, 19)} ",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontSize: 5.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                )),

                                            //=====//
                                            Container(
                                                color: Colors.white,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Center(
                                                    child: Text(
                                                      e.value.kelompok,
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 5.sp),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                )),

                                            if (e.value.background == "") ...[
                                              Container(
                                                color: Colors.white,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Text(
                                                    "Subjektif : ${e.value.subjektif} \nObjektif : ${e.value.objektif} \nAsesmen ${e.value.asesmen} \nPlan : ${e.value.plan} ",
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize: 5.sp),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                              ),
                                            ],

                                            if (e.value.background != "") ...[
                                              Container(
                                                color: Colors.white,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Text(
                                                    "Situation : ${e.value.situation} \nBackground : ${e.value.background} \nAsesmen ${e.value.asesmen} \nRecommendation : ${e.value.recomendation} ",
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize: 5.sp),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                              ),
                                            ],

                                            Container(
                                                color: Colors.white,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Center(
                                                    child: Text(
                                                      "${e.value.instruksiPpa}  ",
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontSize: 5.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                )),

                                            if (e.value.kelompok ==
                                                "Perawat") ...[
                                              Container(
                                                color: Colors.white,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Center(
                                                    child: Column(
                                                      children: [
                                                        CustomQrWidget(
                                                            dimension: 30.sp,
                                                            dataBarcode: state
                                                                .perawat
                                                                .asesmenPerawat
                                                                .nama),
                                                        Text(
                                                          e.value.namaPerawat,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: blackTextStyle
                                                              .copyWith(
                                                                  fontSize:
                                                                      6.sp),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],

                                            if (e.value.kelompok ==
                                                "Dokter") ...[
                                              Container(
                                                color: Colors.white,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Center(
                                                    child: Column(
                                                      children: [
                                                        CustomQrWidget(
                                                          dimension: 30.sp,
                                                          dataBarcode: e
                                                              .value.namaDokter,
                                                        ),
                                                        Text(
                                                          e.value.namaDokter,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: blackTextStyle
                                                              .copyWith(
                                                                  fontSize:
                                                                      6.sp),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                            ],

                            SizedBox(height: 25.sp),
                          ],
                        ),
                      ),
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
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 5.sp),
                    child: Text("RM. 07",
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
                      const HeaderReportHarapanWidget(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "PELAKSANAAN KEPERAWATAN\n DAN PERKEMBANGAN PASIEN",
                            textAlign: TextAlign.center,
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 10.sp),
                          ),
                        ),
                      ),

                      if (authState is Authenticated) ...[
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
                              ],
                              children: [
                                Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "Nama Pasien         :      ${singlePasien.first.namaPasien}  \nTanggal Lahir        :       ${tglIndo(singlePasien.first.tglLahir.substring(0, 10))}",
                                    style:
                                        blackTextStyle.copyWith(fontSize: 6.sp),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "Nomor Rekam Medis           :     ${singlePasien.first.mrn}   \nRuangan                                :      ${authState.user.bagian}",
                                    style:
                                        blackTextStyle.copyWith(fontSize: 6.sp),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],

                      SizedBox(
                        height: 5.sp,
                      ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: TableDesk(
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 1),
                          ),
                          child: TableDeskRow(
                            border:
                                const BorderSide(width: 1, color: Colors.black),
                            gaps: [
                              TableGap.width(100),
                              TableGap.width(150),
                              TableGap.weight(),
                              TableGap.width(280),
                              TableGap.width(250),
                            ],
                            children: [
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Center(
                                    child: Text(
                                      "Tgl/Jam",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 5.sp,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Center(
                                    child: Text(
                                      "Profesional Pemberi Asuhan",
                                      style: blackTextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 5.sp),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Center(
                                    child: Text(
                                      "Hasil Asesmen - IAR Penatalaksaan Pasien ( Tulis dengan format SOAP / ADIME, diserta Sasaran. Tulis nama, beri paraf pada akhir catatan )",
                                      style: blackTextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 5.sp),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Center(
                                    child: Text(
                                      "Instruksi PPA Termasuk Pasca Bedah ( Intruksi ditulis dengan cinrin dan jelas)",
                                      style: blackTextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 5.sp),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Center(
                                    child: Text(
                                      "Verifikasi DPJP ( Tulis Nama, Beri Paraf, Tgl, Jam) (DPJP harus membaca/mereview seluruh rencana asuhan)",
                                      style: blackTextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 5.sp),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 25.sp),
                    ],
                  ),
                ),

                // =================================== NEW PAGE ============================ //
              ],
            ),
          ),
        );
      },
    );
  }
}
