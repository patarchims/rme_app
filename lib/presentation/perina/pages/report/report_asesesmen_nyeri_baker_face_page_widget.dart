import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/qr_code/qr_code_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/asesmen_nyeri/asesmen_nyeri_bloc.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class AsesmenAwalNyeriWongBakerFaceScalePage extends StatefulWidget {
  const AsesmenAwalNyeriWongBakerFaceScalePage({super.key});

  @override
  State<AsesmenAwalNyeriWongBakerFaceScalePage> createState() =>
      _AsesmenAwalNyeriWongBakerFaceScalePageState();
}

class _AsesmenAwalNyeriWongBakerFaceScalePageState
    extends State<AsesmenAwalNyeriWongBakerFaceScalePage> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocBuilder<AsesmenNyeriBloc, AsesmenNyeriState>(
      builder: (context, state) {
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
                                        "Asesmen Awal Nyeri\n WONG BAKER FACE SCALE",
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
                                TableGap.width(150),
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
                                        "No.",
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
                        skalaBox(
                            number: "1.",
                            colors: (state.skalaNyeri.skalaNyeri == 0 ||
                                    state.skalaNyeri.skalaNyeri == 1)
                                ? ThemeColor.greenColor
                                : Colors.white,
                            title: "Tidak Nyeri",
                            nyeri: 0,
                            skor: "0-1"),
                        skalaBox(
                            number: "2.",
                            title: "Nyeri Ringan",
                            colors: (state.skalaNyeri.skalaNyeri == 2 ||
                                    state.skalaNyeri.skalaNyeri == 3)
                                ? ThemeColor.greenColor
                                : Colors.white,
                            nyeri: 2,
                            skor: "2-3"),
                        skalaBox(
                            number: "3.",
                            title: "Nyeri yang mengganggu",
                            colors: (state.skalaNyeri.skalaNyeri == 4 ||
                                    state.skalaNyeri.skalaNyeri == 5)
                                ? ThemeColor.greenColor
                                : Colors.white,
                            nyeri: 4,
                            skor: "4-5"),
                        skalaBox(
                            number: "4.",
                            colors: (state.skalaNyeri.skalaNyeri == 6 ||
                                    state.skalaNyeri.skalaNyeri == 7)
                                ? ThemeColor.greenColor
                                : Colors.white,
                            title: "Nyeri yang menyusahkan",
                            skor: "6-7",
                            nyeri: 6),
                        skalaBox(
                            number: "5",
                            title: "Nyeri Hebat",
                            colors: (state.skalaNyeri.skalaNyeri == 8 ||
                                    state.skalaNyeri.skalaNyeri == 9)
                                ? ThemeColor.greenColor
                                : Colors.white,
                            nyeri: 8,
                            skor: "8-9"),
                        skalaBox(
                            number: "6",
                            title: "Nyeri Sangat Hebat",
                            colors: (state.skalaNyeri.skalaNyeri == 10)
                                ? ThemeColor.greenColor
                                : Colors.white,
                            nyeri: 10,
                            skor: "10"),
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
                                TableGap.width(1030),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Text(
                                        "TOTAL SCORE",
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
                                        state.skalaNyeri.skalaNyeri.toString(),
                                        style: blackTextStyle.copyWith(
                                            fontSize: 11.sp,
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
                                TableGap.width(1030),
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
                                            state
                                                .reportSkalaNyeri.karyawan.nama,
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
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

  Container skalaBox(
      {required String number,
      required String title,
      required int nyeri,
      Color? colors,
      required String skor}) {
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
            TableGap.width(150),
            TableGap.width(880),
            TableGap.weight(),
          ],
          children: [
            Container(
              color: colors ?? Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    number,
                    style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Container(
              color: colors ?? Colors.white,
              child: TableDesk(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                ),
                child: TableDeskRow(
                  border: const BorderSide(width: 1, color: Colors.black),
                  gaps: [
                    TableGap.width(580),
                    TableGap.weight(),
                  ],
                  children: [
                    Container(
                      color: colors ?? Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            title,
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 25.sp,
                      color: colors ?? Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                            child:
                                Image.asset(toNyeri(nyeri: nyeri.toDouble()))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: colors ?? Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    skor,
                    style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String toNyeri({required double nyeri}) {
    switch (nyeri) {
      case 1:
        return "assets/images/nyeri/1.png";
      case 2:
        return "assets/images/nyeri/2.png";
      case 3:
        return "assets/images/nyeri/2.png";
      case 4:
        return "assets/images/nyeri/3.png";
      case 5:
        return "assets/images/nyeri/3.png";
      case 6:
        return "assets/images/nyeri/4.png";
      case 7:
        return "assets/images/nyeri/5.png";
      case 8:
        return "assets/images/nyeri/5.png";
      case 9:
        return "assets/images/nyeri/6.png";
      case 10:
        return "assets/images/nyeri/6.png";
      default:
        return "assets/images/nyeri/1.png";
    }
  }
}
