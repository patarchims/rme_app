import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/qr_code/custom_qr_widget.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class ReportFormulirPencatatanBHPDializerPage extends StatelessWidget {
  const ReportFormulirPencatatanBHPDializerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.transparentColor,
      body: Container(
        width: Get.width,
        padding: EdgeInsets.all(8.sp),
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
            const HeaderReportHarapanWidget(),
            SizedBox(height: 15.sp),
            Center(
              child: Text(
                "PENCATATAN BHP ( RE-USE ) DIALIZER RS HARAPAN",
                textAlign: TextAlign.center,
                style: blackTextStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 8.sp),
              ),
            ),
            SizedBox(
              height: 15.sp,
            ),
            titleBox(title: "Nama"),
            titleBox(title: "Tanggal Lahir"),
            titleBox(title: "No. rekam Medik"),

            SizedBox(
              height: 15.sp,
            ),
            //==================== HEADER =================== //
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 5.sp),
              child: TableDesk(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                ),
                child: TableDeskRow(
                  border: const BorderSide(width: 1, color: Colors.black),
                  gaps: [
                    TableGap.width(80),
                    TableGap.width(480),
                    TableGap.width(450),
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
                            "Keterangan",
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
                            "Item",
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
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Tgl",
                          style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
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
                  border: const BorderSide(width: 1, color: Colors.black),
                  gaps: [
                    TableGap.width(80),
                    TableGap.width(480),
                    TableGap.weight(),
                  ],
                  children: [
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Text(
                            "1.",
                            style: blackTextStyle.copyWith(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Alat single use yang akan digunakan kembali harus dinilai oleh user (operator) apakah memenuhi syarat :",
                            style: blackTextStyle.copyWith(),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: TableDeskColumn(
                        border: const BorderSide(width: 1, color: Colors.black),
                        children: [
                          boxItem(
                              title: "a. Tidak berubah bentuk",
                              total: "",
                              value: ""),
                          boxItem(
                              title: "b. Tidak berubah bentuk",
                              total: "",
                              value: ""),
                          boxItem(
                              title: "c. Tidak berubah bentuk",
                              total: "",
                              value: ""),
                        ],
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
                  border: const BorderSide(width: 1, color: Colors.black),
                  gaps: [
                    TableGap.width(80),
                    TableGap.width(480),
                    TableGap.weight(),
                  ],
                  children: [
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Text(
                            "2.",
                            style: blackTextStyle.copyWith(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Melakukan uji test Formance Dializer :",
                            style: blackTextStyle.copyWith(),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: TableDeskColumn(
                        border: const BorderSide(width: 1, color: Colors.black),
                        children: [
                          boxItem(
                              title:
                                  "a. > 80 - 100 ml volume cairan (layak pakai)",
                              total: "",
                              value: ""),
                          boxItem(
                              title:
                                  "b. < 80 ml volume cairan (tidak layak pakai)",
                              total: "",
                              value: ""),
                        ],
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
                  border: const BorderSide(width: 1, color: Colors.black),
                  gaps: [
                    TableGap.width(80),
                    TableGap.width(930),
                    TableGap.weight(),
                  ],
                  children: [
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Text(
                            "3.",
                            style: blackTextStyle.copyWith(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Proses dekontaminasi, pembersihan, pengemasan, pelebelan, sesuai SPO :",
                            style: blackTextStyle.copyWith(),
                            textAlign: TextAlign.left,
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
                            "",
                            style: blackTextStyle.copyWith(),
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
                  border: const BorderSide(width: 1, color: Colors.black),
                  gaps: [
                    TableGap.width(80),
                    TableGap.width(930),
                    TableGap.weight(),
                  ],
                  children: [
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Text(
                            "4.",
                            style: blackTextStyle.copyWith(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Dalam kemasan harus dicantumkan catatan penggunaan alat yang bersisi : Nama pasien, Kode Re use I, II, III dst, tanggal dilakukan dekontaminasi, nama petugas melakukan dekontaminasi :",
                            style: blackTextStyle.copyWith(),
                            textAlign: TextAlign.left,
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
                            "",
                            style: blackTextStyle.copyWith(),
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
                  border: const BorderSide(width: 1, color: Colors.black),
                  gaps: [
                    TableGap.width(80),
                    TableGap.width(930),
                    TableGap.weight(),
                  ],
                  children: [
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Text(
                            "5.",
                            style: blackTextStyle.copyWith(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Alat single use-re use harus disimpan didalam lemari dyalizer :",
                            style: blackTextStyle.copyWith(),
                            textAlign: TextAlign.left,
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
                            "",
                            style: blackTextStyle.copyWith(),
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
                  border: const BorderSide(width: 1, color: Colors.black),
                  gaps: [
                    TableGap.width(80),
                    TableGap.width(930),
                    TableGap.weight(),
                  ],
                  children: [
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Text(
                            "6.",
                            style: blackTextStyle.copyWith(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Dilakukan pencatatan untuk evaluasi :",
                            style: blackTextStyle.copyWith(),
                            textAlign: TextAlign.left,
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
                            "",
                            style: blackTextStyle.copyWith(),
                            textAlign: TextAlign.center,
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
            Container(
              color: Colors.white,
              child: TableDeskColumn(
                border: const BorderSide(width: 0, color: Colors.white),
                children: [
                  Container(
                    color: Colors.white,
                    child: TableDeskRow(
                      border: const BorderSide(width: 0, color: Colors.white),
                      gaps: [
                        TableGap.weight(),
                        TableGap.weight(),
                      ],
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "DPJP",
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 55.sp,
                                child: CustomQrWidget(
                                  dimension: 30.sp,
                                  dataBarcode: "",
                                ),
                              ),
                              Text(
                                "( ............................................ )",
                                style: blackTextStyle.copyWith(),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("PERAWAT",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 55.sp,
                                child: CustomQrWidget(
                                  dimension: 30.sp,
                                  dataBarcode: "",
                                ),
                              ),
                              Text(
                                "( ............................................ )",
                                style: blackTextStyle.copyWith(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35.sp,
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

  Container titleBox({required String title}) {
    return Container(
      color: Colors.white,
      child: TableDeskColumn(
        border: const BorderSide(width: 0, color: Colors.white),
        children: [
          Container(
            color: Colors.white,
            child: TableDeskRow(
              border: const BorderSide(width: 0, color: Colors.white),
              gaps: [
                TableGap.width(650),
                TableGap.width(200),
                TableGap.width(50),
                TableGap.weight(),
              ],
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "",
                    style: blackTextStyle.copyWith(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: blackTextStyle.copyWith(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ": ",
                    style: blackTextStyle.copyWith(),
                  ),
                ),
                Wrap(
                  children: List.generate(
                      50,
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
    );
  }

  TableDeskColumn boxItem(
      {required String title, required String total, required String value}) {
    return TableDeskColumn(
      border: const BorderSide(width: 1, color: Colors.black),
      children: [
        Container(
          color: Colors.white,
          child: TableDeskRow(
            border: const BorderSide(width: 1, color: Colors.black),
            gaps: [
              TableGap.width(450),
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
