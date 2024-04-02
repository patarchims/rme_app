import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/perina/bloc/report_asesmen_bayi/report_asesmen_bayi_bloc.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:sizer/sizer.dart';

class ResumePerinatologiPageWidget extends StatefulWidget {
  const ResumePerinatologiPageWidget({super.key});

  @override
  State<ResumePerinatologiPageWidget> createState() =>
      _ResumePerinatologiPageWidgetState();
}

class _ResumePerinatologiPageWidgetState
    extends State<ResumePerinatologiPageWidget> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportAsesmenBayiBloc, ReportAsesmenBayiState>(
      builder: (context, state) {
        if (state.status == ReportAsesmenBayiStatus.isLoadingGet) {
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
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 5.sp),
                        child: Text("RM. 18 B",
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
                          Padding(
                            padding: EdgeInsets.all(8.sp),
                            child: const HeaderAllWidget(),
                          ),
                          Container(
                            margin: EdgeInsets.all(2.sp),
                            child: Center(
                              child: Text(
                                "RESUME MEDIS PERINATOLOGI",
                                textAlign: TextAlign.center,
                                style: blackTextStyle.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const Divider(),
                          Container(
                            padding: EdgeInsets.only(right: 5.sp, left: 5.sp),
                            child: FB5Row(
                              classNames: 'px-xs-0 px-lg-0 gx-0',
                              children: [
                                FB5Col(
                                    classNames: 'col-5',
                                    child: Column(
                                      children: [
                                        TitleWidget
                                            .boxPemeriksaanFisikSugestion(
                                          padding: 0.0,
                                          width: 55.sp,
                                          widget: Text(
                                            ": ${state.responseResumeMedisPerinatologi.identitasBayiResponse.namaBayi}",
                                            style: blackTextStyle,
                                          ),
                                          title: "Nama Bayi",
                                        ),
                                        TitleWidget
                                            .boxPemeriksaanFisikSugestion(
                                          padding: 0.0,
                                          width: 55.sp,
                                          widget: Text(
                                            ": ${state.responseResumeMedisPerinatologi.identitasBayiResponse.tglLahir}",
                                            style: blackTextStyle,
                                          ),
                                          title: "Tanggal Lahir",
                                        ),
                                        TitleWidget
                                            .boxPemeriksaanFisikSugestion(
                                          padding: 0.0,
                                          width: 55.sp,
                                          widget: Text(
                                            ": ${state.responseResumeMedisPerinatologi.identitasBayiResponse.noRm}",
                                            style: blackTextStyle,
                                          ),
                                          title: "Nomor RM",
                                        ),
                                        TitleWidget
                                            .boxPemeriksaanFisikSugestion(
                                          padding: 0.0,
                                          width: 55.sp,
                                          widget: Text(
                                            ": ${state.responseResumeMedisPerinatologi.identitasBayiResponse.noReg}",
                                            style: blackTextStyle,
                                          ),
                                          title: "Nomor Register",
                                        ),
                                        TitleWidget
                                            .boxPemeriksaanFisikSugestion(
                                          padding: 0.0,
                                          width: 55.sp,
                                          widget: Text(
                                            ": ${state.responseResumeMedisPerinatologi.identitasBayiResponse.umur}",
                                            style: blackTextStyle,
                                          ),
                                          title: "Umur",
                                        ),
                                        TitleWidget
                                            .boxPemeriksaanFisikSugestion(
                                          padding: 0.0,
                                          width: 55.sp,
                                          widget: Text(
                                            ": ${state.responseResumeMedisPerinatologi.identitasBayiResponse.jk}",
                                            style: blackTextStyle,
                                          ),
                                          title: "Jenis Kelamin",
                                        ),
                                        TitleWidget
                                            .boxPemeriksaanFisikSugestion(
                                          padding: 0.0,
                                          width: 55.sp,
                                          widget: Text(
                                            ": ${state.responseResumeMedisPerinatologi.identitasBayiResponse.tglMasuk}",
                                            style: blackTextStyle,
                                          ),
                                          title: "Tanggal Masuk",
                                        ),
                                        TitleWidget
                                            .boxPemeriksaanFisikSugestion(
                                          padding: 0.0,
                                          width: 55.sp,
                                          widget: Text(
                                            ": ${state.responseResumeMedisPerinatologi.identitasBayiResponse.tglKeluar}",
                                            style: blackTextStyle,
                                          ),
                                          title: "Tanggal Keluar",
                                        ),
                                        TitleWidget
                                            .boxPemeriksaanFisikSugestion(
                                          padding: 0.0,
                                          width: 55.sp,
                                          widget: Text(
                                            ": ${state.responseResumeMedisPerinatologi.identitasBayiResponse.dokterAnak}",
                                            style: blackTextStyle,
                                          ),
                                          title: "Dokter",
                                        ),
                                      ],
                                    )),
                                FB5Col(
                                    classNames: 'col-2',
                                    child: SizedBox(
                                      height: 70.sp,
                                      child: const VerticalDivider(
                                        thickness: 2,
                                        color: ThemeColor.blackColor,
                                      ),
                                    )),
                                FB5Col(
                                    classNames: 'col-5',
                                    child: Column(
                                      children: [
                                        TitleWidget
                                            .boxPemeriksaanFisikSugestion(
                                          padding: 0.0,
                                          width: 55.sp,
                                          widget: Text(
                                            ": ${state.responseResumeMedisPerinatologi.identitasBayiResponse.namaIbu}",
                                            style: blackTextStyle,
                                          ),
                                          title: "Nama Ibu",
                                        ),
                                        TitleWidget
                                            .boxPemeriksaanFisikSugestion(
                                          padding: 0.0,
                                          width: 55.sp,
                                          widget: Text(
                                            ": ${state.responseResumeMedisPerinatologi.identitasBayiResponse.ruang}",
                                            style: blackTextStyle,
                                          ),
                                          title: "Ruang/Kelas",
                                        ),
                                        TitleWidget
                                            .boxPemeriksaanFisikSugestion(
                                          padding: 0.0,
                                          width: 55.sp,
                                          widget: Text(
                                            ": ${state.responseResumeMedisPerinatologi.identitasBayiResponse.agama}",
                                            style: blackTextStyle,
                                          ),
                                          title: "Agama",
                                        ),
                                        TitleWidget
                                            .boxPemeriksaanFisikSugestion(
                                          padding: 0.0,
                                          width: 55.sp,
                                          widget: Text(
                                            ": ${state.responseResumeMedisPerinatologi.identitasBayiResponse.alamat}",
                                            style: blackTextStyle,
                                          ),
                                          title: "Alamat",
                                        ),
                                        TitleWidget
                                            .boxPemeriksaanFisikSugestion(
                                          padding: 0.0,
                                          width: 55.sp,
                                          widget: Text(
                                            ": ${state.responseResumeMedisPerinatologi.identitasBayiResponse.dokterAnak}",
                                            style: blackTextStyle,
                                          ),
                                          title: "Dokter",
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          const Divider(),
                          FB5Col(
                              classNames: 'px-xs-3 px-lg-3 gx-3 col-12',
                              child: Column(
                                children: [
                                  TitleWidget.boxPemeriksaanFisikSugestion(
                                    padding: 0.0,
                                    width: 55.sp,
                                    widget: const Text(
                                      ": ",
                                    ),
                                    title: "DIAGNOSA",
                                  ),
                                  SizedBox(
                                    height: 75.sp,
                                  )
                                ],
                              )),
                          const Divider(),
                          FB5Col(
                              classNames: 'px-xs-3 px-lg-3 gx-3 col-12',
                              child: Column(
                                children: [
                                  TitleWidget.boxPemeriksaanFisikSugestion(
                                    padding: 0.0,
                                    width: 75.sp,
                                    widget: const Text(
                                      ": ",
                                    ),
                                    title: "TINDAKAN OPERASI",
                                  ),
                                  SizedBox(
                                    height: 55.sp,
                                  )
                                ],
                              )),
                          const Divider(),
                          FB5Col(
                              classNames: 'px-xs-3 px-lg-3 gx-3 col-12',
                              child: Column(
                                children: [
                                  TitleWidget.boxPemeriksaanFisikSugestion(
                                    padding: 0.0,
                                    width: 75.sp,
                                    widget: const Text(
                                      ": ",
                                    ),
                                    title: "RIWAYAT KEHAMILAN",
                                  ),
                                  SizedBox(
                                    height: 55.sp,
                                  ),
                                  TitleWidget.boxPemeriksaanFisikSugestion(
                                    padding: 0.0,
                                    width: 75.sp,
                                    widget: const Text(
                                      ": ",
                                    ),
                                    title: "PEMERIKSAAN FISIK",
                                  ),
                                  FB5Col(
                                      classNames: 'col-6',
                                      child: Column(
                                        children: [
                                          TitleWidget
                                              .boxPemeriksaanFisikSugestion(
                                            padding: 0.0,
                                            width: 88.sp,
                                            widget: Text(
                                              ": ",
                                              style: blackTextStyle,
                                            ),
                                            title: "Berat Lahir",
                                          ),
                                          TitleWidget
                                              .boxPemeriksaanFisikSugestion(
                                            padding: 0.0,
                                            width: 88.sp,
                                            widget: Text(
                                              ": ",
                                              style: blackTextStyle,
                                            ),
                                            title: "Panjang Lahir",
                                          ),
                                          TitleWidget
                                              .boxPemeriksaanFisikSugestion(
                                            padding: 0.0,
                                            width: 88.sp,
                                            widget: Text(
                                              ": ",
                                              style: blackTextStyle,
                                            ),
                                            title: "Lingkar Kepala",
                                          ),
                                          TitleWidget
                                              .boxPemeriksaanFisikSugestion(
                                            padding: 0.0,
                                            width: 88.sp,
                                            widget: Text(
                                              ": ",
                                              style: blackTextStyle,
                                            ),
                                            title: "Kelainan yang ditemukan",
                                          ),
                                        ],
                                      )),
                                ],
                              )),
                          FB5Col(
                              classNames: 'px-xs-3 px-lg-3 gx-3 col-12',
                              child: Column(
                                children: [
                                  TitleWidget.boxPemeriksaanFisikSugestion(
                                    padding: 0.0,
                                    width: 75.sp,
                                    widget: const Text(
                                      ": ",
                                    ),
                                    title: "TINDAK LANJUT",
                                  ),
                                  SizedBox(
                                    height: 55.sp,
                                  )
                                ],
                              )),
                          FB5Col(
                              classNames: 'px-xs-3 px-lg-3 gx-3 col-12',
                              child: Column(
                                children: [
                                  TitleWidget.boxPemeriksaanFisikSugestion(
                                    padding: 0.0,
                                    width: 75.sp,
                                    widget: const Text(
                                      ": ",
                                    ),
                                    title: "KONTROL ULANG TANGGAL",
                                  ),
                                  SizedBox(
                                    height: 55.sp,
                                  )
                                ],
                              )),
                          Container(
                            padding: EdgeInsets.only(right: 5.sp, left: 5.sp),
                            child: FB5Row(
                              classNames: 'px-xs-0 px-lg-0 gx-0',
                              children: [
                                FB5Col(
                                  classNames: 'col-6',
                                  child: Column(
                                    children: [
                                      Text(
                                        "Keluarga",
                                        style: blackTextStyle,
                                      ),
                                      SizedBox(
                                        height: 55.sp,
                                      ),
                                      Text(
                                        "(        .............................        )",
                                        style: blackTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                FB5Col(
                                  classNames: 'col-6',
                                  child: Column(
                                    children: [
                                      Text(
                                        "Dokter Penanggung Jawab",
                                        style: blackTextStyle,
                                      ),
                                      SizedBox(
                                        height: 55.sp,
                                      ),
                                      Text(
                                        "(        .............................        )",
                                        style: blackTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 35.sp,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
