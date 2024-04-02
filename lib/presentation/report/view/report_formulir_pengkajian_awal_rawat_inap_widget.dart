import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/report/component/ceklist_widget.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class ReportFormulirPengkajianAwalRawatInap extends StatelessWidget {
  const ReportFormulirPengkajianAwalRawatInap({super.key});

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: EdgeInsets.all(8.sp),
              child: const HeaderAllWidget(),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    // color: Colors.black,
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
                                "CATATAN TRANSFER \nPASIEN ANTAR RUANGAN",
                                textAlign: TextAlign.center,
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp),
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
                                  title: "Nama Pasien", subTitle: ""),
                              TitleWidget.judul(
                                  title: "Tanggal Lahir", subTitle: ""),
                              TitleWidget.judul(
                                  title: "Nomor Rekam Medis", subTitle: ""),
                              TitleWidget.judul(
                                  title: "Nama Petugas Pemberi Informasi",
                                  subTitle: ""),
                              TitleWidget.judul(
                                  title: "Perawatan Penerima Informasi",
                                  subTitle: ""),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Petunjuk : \nBerikan tanda (✓) pada kolom yang sesuai dengan kondisi pasien",
                      style:
                          blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Penyebab Cedera",
                      style:
                          blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),

                  Container(
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
                              const BorderSide(width: 1, color: Colors.white),
                          gaps: [
                            TableGap.width(300),
                            TableGap.weight(),
                          ],
                          children: [
                            Container(
                              color: Colors.white,
                              child: const Padding(
                                padding: EdgeInsets.all(8),
                                child: ChecklistWidget(
                                  isBool: true,
                                  isEnable: false,
                                  title: "Kecelakaan Lalu Lintas",
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
                                              width: 1, color: Colors.white),
                                          gaps: [
                                            TableGap.width(50),
                                            TableGap.weight(),
                                          ],
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                ":",
                                                style:
                                                    blackTextStyle.copyWith(),
                                              ),
                                            ),
                                            Wrap(
                                              children: List.generate(
                                                  350,
                                                  (index) => Text(
                                                        ".",
                                                        style: blackTextStyle,
                                                      )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
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
                              const BorderSide(width: 1, color: Colors.white),
                          gaps: [
                            TableGap.width(300),
                            TableGap.weight(),
                          ],
                          children: [
                            Container(
                              color: Colors.white,
                              child: const Padding(
                                padding: EdgeInsets.all(8),
                                child: ChecklistWidget(
                                  isEnable: false,
                                  title: "Trauma",
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
                                              width: 1, color: Colors.white),
                                          gaps: [
                                            TableGap.width(50),
                                            TableGap.weight(),
                                          ],
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                ":",
                                                style:
                                                    blackTextStyle.copyWith(),
                                              ),
                                            ),
                                            Wrap(
                                              children: List.generate(
                                                  350,
                                                  (index) => Text(
                                                        ".",
                                                        style: blackTextStyle,
                                                      )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
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
                              const BorderSide(width: 1, color: Colors.white),
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
                                  "Keluhan Utama",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
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
                                              width: 1, color: Colors.white),
                                          gaps: [
                                            TableGap.width(50),
                                            TableGap.weight(),
                                          ],
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                ":",
                                                style:
                                                    blackTextStyle.copyWith(),
                                              ),
                                            ),
                                            Wrap(
                                              children: List.generate(
                                                  350,
                                                  (index) => Text(
                                                        ".",
                                                        style: blackTextStyle,
                                                      )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
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
                              const BorderSide(width: 1, color: Colors.white),
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
                                  "Tanda - Tanda Vital",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
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
                                              width: 1, color: Colors.white),
                                          gaps: [
                                            TableGap.width(50),
                                            TableGap.weight(),
                                          ],
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                ":",
                                                style:
                                                    blackTextStyle.copyWith(),
                                              ),
                                            ),
                                            Wrap(
                                              children: List.generate(
                                                  350,
                                                  (index) => Text(
                                                        ".",
                                                        style: blackTextStyle,
                                                      )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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

List<String> alasanDatang = ["Penyakit", "Ruda Paksa", "Cedera"];
