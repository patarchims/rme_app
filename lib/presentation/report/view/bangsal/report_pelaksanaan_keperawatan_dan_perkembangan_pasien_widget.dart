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

class ReportPelaksanaanKeperawatanDanPerkembanganPasienWidgetPage
    extends StatefulWidget {
  const ReportPelaksanaanKeperawatanDanPerkembanganPasienWidgetPage(
      {super.key});

  @override
  State<ReportPelaksanaanKeperawatanDanPerkembanganPasienWidgetPage>
      createState() =>
          _ReportPelaksanaanKeperawatanDanPerkembanganPasienWidgetPageState();
}

class _ReportPelaksanaanKeperawatanDanPerkembanganPasienWidgetPageState
    extends State<ReportPelaksanaanKeperawatanDanPerkembanganPasienWidgetPage> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    AuthState authState = context.watch<AuthBloc>().state;

    return BlocBuilder<ReportBloc, ReportState>(
      builder: (context, state) {
        if (state.status == ReportStatus.loadingPerkembanganPasien) {
          return Scaffold(
            backgroundColor: ThemeColor.transparentColor,
            body: Loading.expandedLoading(),
          );
        }

        if (state.status == ReportStatus.loadedPerkembanganPasien) {
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
                          child: Text("RM. 14",
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.sp),
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
                                        child: Text(
                                          "Nama Pasien         :      ${singlePasien.first.namaPasien}  \nTanggal Lahir        :       ${(singlePasien.first.tglLahir.length > 10) ? tglIndo(singlePasien.first.tglLahir.substring(0, 10)) : singlePasien.first.tglLahir}",
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
                                    TableGap.width(150),
                                    TableGap.weight(),
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
                                            "Berikan catatan perawat :\nTerapi Keperawatan, Observasi, Keperawatan, Penyuluhan Kesehatan, \nKolaborasi",
                                            style: blackTextStyle.copyWith(
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
                                            "Nama Perawat",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            if (state.intervensiResponse.isNotEmpty) ...[
                              ...state.intervensiResponse.map((e) {
                                return Container(
                                  color: Colors.white,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.sp),
                                  child: TableDesk(
                                    shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.black, width: 1),
                                    ),
                                    child: TableDeskRow(
                                      border: const BorderSide(
                                          width: 1, color: Colors.black),
                                      gaps: [
                                        TableGap.width(150),
                                        TableGap.weight(),
                                        TableGap.width(200),
                                      ],
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Center(
                                              child: Text(
                                                "${(e.insertDttm.length > 10) ? tglIndo(e.insertDttm.substring(0, 10)) : e.insertDttm.toString()} / ${(e.insertDttm.length > 10) ? e.insertDttm.substring(11, 19) : e.insertDttm}",
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 6.sp),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          color: Colors.white,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: e.siki
                                                      .map((siki) => Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(2),
                                                            child: Text(
                                                              "⚫ ${siki.kategori} : ${siki.namaSiki}",
                                                              style: blackTextStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          6.sp),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                            ),
                                                          ))
                                                      .toList(),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: e.tindakan
                                                      .map((siki) => Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(2),
                                                            child: Text(
                                                              "Tindakan :  \n${siki.insertDttm.substring(0, 10)}-${siki.insertDttm.substring(11, 19)} ${siki.deskripsi} :",
                                                              style: blackTextStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          6.sp),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                            ),
                                                          ))
                                                      .toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.white,
                                          padding: EdgeInsets.all(5.sp),
                                          child: Column(
                                            children: [
                                              CustomQrWidget(
                                                dimension: 30.sp,
                                                dataBarcode: e.namaPerawat,
                                              ),
                                              Text(
                                                e.namaPerawat,
                                                textAlign: TextAlign.center,
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 6.sp),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })
                            ],

                            SizedBox(height: 25.sp),
                          ],
                        ),
                      ),

                      // =================================== NEW PAGE ============================ //
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
                    child: Text("RM. 14",
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
                                    "Nama Pasien         :      ${singlePasien.first.namaPasien}  \nTanggal Lahir        :    ${singlePasien.first.tglLahir} - ${(singlePasien.first.tglLahir.length > 10) ? tglIndo(singlePasien.first.tglLahir.substring(0, 10)) : singlePasien.first.tglLahir}",
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
                              TableGap.width(150),
                              TableGap.weight(),
                              TableGap.width(150),
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
                                      "Berikan catatan perawat :\nTerapi Keperawatan, Observasi, Keperawatan, Penyuluhan Kesehatan, \nKolaborasi",
                                      style: blackTextStyle.copyWith(
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
                                      "Nama Perawat",
                                      style: blackTextStyle.copyWith(
                                          fontWeight: FontWeight.bold),
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
