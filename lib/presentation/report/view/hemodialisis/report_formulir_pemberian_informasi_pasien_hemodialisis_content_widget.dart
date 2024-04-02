import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class ReportFormulirPemberianInformasiHemodialisisContentWidget
    extends StatelessWidget {
  const ReportFormulirPemberianInformasiHemodialisisContentWidget({super.key});

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
            Text(
              "UNIT HEMODIALISIS\nPEMBERIAN INFORMASI HEMODIALISIS\n",
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 9.sp),
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
                        TableGap.width(500),
                        TableGap.width(50),
                        TableGap.weight(),
                      ],
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Pemberi Informasi",
                            style: blackTextStyle.copyWith(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ":",
                            style: blackTextStyle.copyWith(),
                          ),
                        ),
                        Wrap(
                          children: List.generate(
                              100,
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
                        TableGap.width(500),
                        TableGap.width(50),
                        TableGap.weight(),
                      ],
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Pelaksana tindakan",
                            style: blackTextStyle.copyWith(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ":",
                            style: blackTextStyle.copyWith(),
                          ),
                        ),
                        Wrap(
                          children: List.generate(
                              100,
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
                        TableGap.width(500),
                        TableGap.width(50),
                        TableGap.weight(),
                      ],
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Penerima informasi/pemberi persetujuan",
                            style: blackTextStyle.copyWith(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ":",
                            style: blackTextStyle.copyWith(),
                          ),
                        ),
                        Wrap(
                          children: List.generate(
                              100,
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
            SizedBox(
              height: 15.sp,
            ),
            RichText(
              text: TextSpan(
                  text: 'Saya yang bertanda tangan di bawah ini :  ',
                  style: blackTextStyle),
            ),
            SizedBox(height: 25.sp),
            RichText(
              text: TextSpan(
                  text:
                      'Dari penjelasan yang diberikan, saya telah mengerti segala hal yang berhubungan dengan penyakit tersebut, serta tindakan medis yang akan dilakukan dan kemungkinan pasca tindakan yang dapat terjadi sesuai penjelasan yang diberikan.\nSurat persetujuan ini berlaku selama 1 (satu) bulan, kecuali : \n- Pasien menolak tindakan hemodialisis \n-  Terjadi perburukan klinis sehingga pasien tidak bisa dilakukan tindakan hemodialisis  ',
                  style: blackTextStyle),
            ),
            SizedBox(height: 15.sp)
          ],
        ),
      ),
    );
  }
}
