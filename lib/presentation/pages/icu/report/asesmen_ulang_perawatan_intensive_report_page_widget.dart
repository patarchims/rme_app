import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
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
        if (state.status == ReportIcuStatus.loading) {
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
                                                  ? singlePasien.first.tglLahir
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
                                side: BorderSide(color: Colors.black, width: 1),
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
                              title: "Assesmen", value: "Tanggal "),
                          TitleWidget.pemeriksaanFisik(
                              title: "Jenis Assesmen", value: " "),
                          TitleWidget.pemeriksaanFisik(
                              title: "Cara Masuk", value: " "),
                          TitleWidget.pemeriksaanFisik(
                              title: "Keluhan Utama", value: "\n\n"),
                          TitleWidget.pemeriksaanFisik(
                              title: "Riwayat Penyakit Sekarang",
                              value: "\n\n\n"),
                          TitleWidget.pemeriksaanFisik(
                              title: "Riwayat Penyakit Dahulu",
                              value: "\n\n\n"),
                          TitleWidget.pemeriksaanFisik(
                              title: "Riwayat Penyakit Keluarga",
                              value: "\n\n\n"),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(2.sp)),
                            child: TableDesk(
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 1),
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
                                      child: Center(
                                        child: Text(
                                          "ASESMEN",
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
                        ],
                      ),
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
}
