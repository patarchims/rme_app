import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/qr_code/custom_qr_widget.dart';
import 'package:hms_app/presentation/report/component/ceklist_widget.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class ReportFormulirSkriningPasienWidget extends StatefulWidget {
  const ReportFormulirSkriningPasienWidget({super.key});

  @override
  State<ReportFormulirSkriningPasienWidget> createState() =>
      _ReportFormulirSkriningPasienWidgetState();
}

class _ReportFormulirSkriningPasienWidgetState
    extends State<ReportFormulirSkriningPasienWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

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
          controller: _scrollController,
          trackVisibility: false,
          radius: Radius.circular(5.sp),
          child: ListView(
            controller: _scrollController,
            children: [
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: const HeaderAllWidget(),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      style: BorderStyle.solid,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TAMPILKAN DATA
                    SizedBox(
                      width: Get.width,
                      height: 50.sp,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: Get.width / 3,
                            height: 50.sp,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "FORMULIR SKRINING \nPASIEN",
                                  textAlign: TextAlign.center,
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp),
                                ),
                              ],
                            ),
                          ),
                          const VerticalDivider(),
                          Expanded(
                              child: SizedBox(
                            height: 50.sp,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleWidget.judul(
                                    title: "Nama Pasien",
                                    subTitle: singlePasien.first.namaPasien),
                                TitleWidget.judul(
                                    title: "Tanggal Lahir",
                                    subTitle: tglIndo(singlePasien
                                        .first.tglLahir
                                        .substring(0, 10))),
                                TitleWidget.judul(
                                    title: "Nomor Rekam Medis",
                                    subTitle: singlePasien.first.mrn),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),

                    Container(
                      height: 120.sp,
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
                            border:
                                const BorderSide(width: 1, color: Colors.black),
                            gaps: [
                              TableGap.width(300),
                              TableGap.weight(),
                            ],
                            children: [
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Text(
                                          "Cara datang :",
                                          style: blackTextStyle.copyWith(),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      const ChecklistWidget(
                                          isEnable: false, title: "Sendiri"),
                                      const ChecklistWidget(
                                          isEnable: false, title: "Keluarga"),
                                      const ChecklistWidget(
                                          isEnable: false, title: "Ambulance"),
                                      const ChecklistWidget(
                                          isEnable: false, title: "Polisi"),
                                      const ChecklistWidget(
                                          isEnable: true, title: "Penolong"),
                                    ],
                                  ),
                                ),
                              ),
                              TableDeskColumn(
                                border: const BorderSide(
                                    width: 1, color: Colors.black),
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: TableDeskColumn(
                                      border: const BorderSide(
                                          width: 1, color: Colors.black),
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          child: TableDeskRow(
                                            border: const BorderSide(
                                                width: 1, color: Colors.black),
                                            gaps: [
                                              TableGap.width(500),
                                              TableGap.weight(),
                                            ],
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Asal Rujukan",
                                                  style:
                                                      blackTextStyle.copyWith(),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Text(
                                                  "Hari/Tanggal",
                                                  textAlign: TextAlign.left,
                                                  style: blackTextStyle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TableDeskColumn(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: TableDeskRow(
                                          border: const BorderSide(
                                              width: 1, color: Colors.black),
                                          gaps: [
                                            TableGap.width(500),
                                            TableGap.weight(),
                                            TableGap.weight(),
                                          ],
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Surat Pengantar",
                                                style:
                                                    blackTextStyle.copyWith(),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                "Jam datang :",
                                                textAlign: TextAlign.left,
                                                style: blackTextStyle,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                "Jam registrasi :",
                                                textAlign: TextAlign.left,
                                                style: blackTextStyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  TableDeskColumn(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.sp, vertical: 5.sp),
                                        color: Colors.white,
                                        child: TableDeskRow(
                                          border: const BorderSide(
                                              width: 1, color: Colors.black),
                                          gaps: [
                                            TableGap.weight(),
                                          ],
                                          children: [
                                            Text(
                                              "Keluhan Utama : \n...................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................",
                                              style: blackTextStyle.copyWith(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Container(
                      height: 170.sp,
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
                            border:
                                const BorderSide(width: 1, color: Colors.black),
                            gaps: [
                              TableGap.width(300),
                              TableGap.weight(),
                            ],
                            children: [
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "Nama pengantar : \n.........................................",
                                    style: blackTextStyle.copyWith(),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              TableDeskColumn(
                                border: const BorderSide(
                                    width: 1, color: Colors.white),
                                children: [
                                  TableDeskColumn(
                                    border: const BorderSide(
                                        width: 1, color: Colors.white),
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.sp, vertical: 5.sp),
                                        color: Colors.white,
                                        child: TableDeskRow(
                                          border: const BorderSide(
                                              width: 1, color: Colors.white),
                                          gaps: [
                                            TableGap.weight(),
                                          ],
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Wrap(
                                                children: pilihan
                                                    .asMap()
                                                    .entries
                                                    .map((e) => SizedBox(
                                                          width: 100.sp,
                                                          child:
                                                              ChecklistWidget(
                                                                  isEnable:
                                                                      false,
                                                                  title:
                                                                      e.value),
                                                        ))
                                                    .toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Rekomendasi",
                                          style: blackTextStyle,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 5.sp,
                                        ),
                                        color: Colors.white,
                                        child: TableDeskRow(
                                          border: const BorderSide(
                                              width: 1, color: Colors.white),
                                          gaps: [
                                            TableGap.weight(),
                                          ],
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Wrap(
                                                children: rekomendasi
                                                    .asMap()
                                                    .entries
                                                    .map((e) => SizedBox(
                                                          width: 100.sp,
                                                          child:
                                                              ChecklistWidget(
                                                                  isEnable:
                                                                      false,
                                                                  title:
                                                                      e.value),
                                                        ))
                                                    .toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Container(
                      height: 120.sp,
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
                            border:
                                const BorderSide(width: 1, color: Colors.black),
                            gaps: [
                              TableGap.width(300),
                              TableGap.weight(),
                            ],
                            children: [
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Tujuan Awal Pasien : ",
                                        style: blackTextStyle.copyWith(),
                                        textAlign: TextAlign.left,
                                      ),
                                      const ChecklistWidget(
                                          isEnable: false,
                                          title: "Periksa (kasus baru)"),
                                      const ChecklistWidget(
                                          isEnable: false, title: "Kontrol"),
                                      const ChecklistWidget(
                                          isEnable: false,
                                          title: "Check Laboratorium"),
                                      const ChecklistWidget(
                                          isEnable: false, title: "Rawat Inap"),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Petugas Skrining",
                                    style: blackTextStyle,
                                  ),
                                  CustomQrWidget(
                                    dimension: 30.sp,
                                    dataBarcode: "barcode",
                                  ),
                                  Text(
                                    "( ................................................. )",
                                    style: blackTextStyle,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.sp)
            ],
          ),
        ),
      ),
    );
  }

  TableDeskColumn resikoTable(
      {required String title, required String total, required String value}) {
    return TableDeskColumn(
      border: const BorderSide(width: 1, color: Colors.black),
      children: [
        Container(
          color: Colors.white,
          child: TableDeskRow(
            border: const BorderSide(width: 1, color: Colors.black),
            gaps: [
              TableGap.width(330),
              TableGap.width(205),
              TableGap.weight(),
            ],
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: blackTextStyle.copyWith(),
                  )),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  total,
                  textAlign: TextAlign.left,
                  style: blackTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  value,
                  textAlign: TextAlign.left,
                  style: blackTextStyle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

List<String> pilihan = [
  "Trauma",
  "Non Trauma",
  "Obstetri",
  "Nyeri dada",
  "Luka Terbuka",
  "Kesakitan/Kejang",
  "Sesak Nafas"
];
List<String> rekomendasi = [
  "IGD",
  "PONEK",
  "Poliklinik",
  "HD",
  "DLL .............."
];
