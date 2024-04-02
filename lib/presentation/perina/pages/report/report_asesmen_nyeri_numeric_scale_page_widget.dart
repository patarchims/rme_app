import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/qr_code/qr_code_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/asesmen_nyeri/asesmen_nyeri_bloc.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class ReportAsesmenNyeriNumbericScalePage extends StatefulWidget {
  const ReportAsesmenNyeriNumbericScalePage({super.key});

  @override
  State<ReportAsesmenNyeriNumbericScalePage> createState() =>
      _ReportAsesmenNyeriNumbericScalePageState();
}

class _ReportAsesmenNyeriNumbericScalePageState
    extends State<ReportAsesmenNyeriNumbericScalePage> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;

    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocBuilder<AsesmenNyeriBloc, AsesmenNyeriState>(
      builder: (context, state) {
        if (state.status == AsesmenNyeriStatus.isLoadingGet) {
          return Scaffold(
            backgroundColor: ThemeColor.transparentColor,
            body: Loading.circleLoading(),
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
                      child: Text("RM. 06 I.2",
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
                                        "Asesmen Awal Nyeri\n NUMERIC SCALE",
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
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(),
                        Container(
                          padding: EdgeInsets.all(5.sp),
                          child: Center(
                            child: Text(
                              "Assesmen Nyeri Dewasa & Anak berusia >3 tahun yang tidak dapat\nmenggambarkan Intensitas Nyerinya dengan Angka",
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(
                                  fontSize: 9.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
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
                                TableGap.width(880),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Text(
                                        "KATEGORI",
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
                                        "SKOR",
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
                        asesmenNyeri(
                            title: "Tidak Nyeri",
                            subTitle: "0",
                            color:
                                (state.reportSkalaNyeri.skalaNyeri.skalaNyeri ==
                                        0)
                                    ? ThemeColor.greenColor
                                    : Colors.white),
                        asesmenNyeri(
                            title: "Nyeri Ringan",
                            subTitle: "1-2",
                            color:
                                (state.reportSkalaNyeri.skalaNyeri.skalaNyeri >=
                                            1 &&
                                        state.reportSkalaNyeri.skalaNyeri
                                                .skalaNyeri <=
                                            2)
                                    ? ThemeColor.greenColor
                                    : Colors.white),
                        asesmenNyeri(
                            title: "Nyeri Sedang",
                            subTitle: "4-6",
                            color:
                                (state.reportSkalaNyeri.skalaNyeri.skalaNyeri >=
                                            4 &&
                                        state.reportSkalaNyeri.skalaNyeri
                                                .skalaNyeri <=
                                            6)
                                    ? ThemeColor.greenColor
                                    : Colors.white),
                        asesmenNyeri(
                            title: "Nyeri Berat",
                            subTitle: "7-10",
                            color:
                                (state.reportSkalaNyeri.skalaNyeri.skalaNyeri >=
                                        7)
                                    ? ThemeColor.greenColor
                                    : Colors.white),
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
                                TableGap.width(880),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Text(
                                        "NAMA & PARAF",
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
                                        child: Column(
                                      children: [
                                        BarcodeGreenWidget(
                                          height: 35.sp,
                                          dataBarcode: state
                                              .reportSkalaNyeri.karyawan.nama,
                                        ),
                                        Text(
                                          state.reportSkalaNyeri.karyawan.nama,
                                          style: blackTextStyle.copyWith(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.sp,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Container asesmenNyeri(
      {required String title, required String subTitle, Color? color}) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: TableDesk(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 1),
        ),
        child: TableDeskRow(
          border: const BorderSide(width: 1, color: Colors.black),
          gaps: [
            TableGap.width(880),
            TableGap.weight(),
          ],
          children: [
            Container(
              color: color ?? Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    title,
                    style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Container(
              color: color ?? Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    subTitle,
                    style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
