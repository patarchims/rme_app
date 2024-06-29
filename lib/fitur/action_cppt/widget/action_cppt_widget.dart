import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/models/response/list_cppt_pasien_model_response.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:sizer/sizer.dart';

class ActionCpptWidget extends StatelessWidget {
  final CpptPasienModel cpptPasien;
  const ActionCpptWidget({super.key, required this.cpptPasien});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height - 100.sp,
      decoration: const BoxDecoration(color: Colors.white),
      child: Scaffold(
        backgroundColor: ThemeColor.bgColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "ACTION",
            style: whiteTextStyle,
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: 5.sp, left: 5.sp),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(0.4),
                  9: FlexColumnWidth(
                    1.5,
                  ),
                },
                border: TableBorder.all(color: Colors.black),
                children: [
                  TableRow(children: [
                    TitleWidget.headerTitle(title: "Subjectif"),
                    TitleWidget.headerTitle(title: "Objectif"),
                    TitleWidget.headerTitle(title: "Asesmen"),
                    TitleWidget.headerTitle(title: "Plan"),
                    TitleWidget.headerTitle(title: "PPA"),
                  ])
                ],
              ),
            ),
            Container(
              width: Get.width,
              padding: EdgeInsets.only(right: 5.sp, left: 5.sp),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(
                    0.4,
                  ),
                  9: FlexColumnWidth(
                    1.5,
                  ),
                },
                border: TableBorder.all(color: Colors.black),
                children: [
                  TableRow(children: [
                    TitleWidget.contentTitle(title: cpptPasien.subjektif),
                    TitleWidget.contentTitle(title: cpptPasien.objectif),
                    TitleWidget.contentTitle(title: cpptPasien.asesmen),
                    TitleWidget.contentTitle(title: cpptPasien.plan),
                    TitleWidget.contentTitle(title: cpptPasien.instruksiPpa),
                  ])
                ],
              ),
            ),
            Container(
              width: Get.width,
              padding: EdgeInsets.only(right: 5.sp, left: 5.sp),
              child: Table(
                columnWidths: const {},
                border: TableBorder.all(color: Colors.black),
                children: [
                  TableRow(children: [
                    FormWidget.textArea(
                      enabled: true,
                      maxLines: 10,
                    ),
                  ])
                ],
              ),
            ),
            Container(
              width: Get.width,
              padding: EdgeInsets.only(right: 5.sp, left: 5.sp),
              child: Table(
                columnWidths: const {},
                border: TableBorder.all(color: Colors.black),
                children: [
                  TableRow(children: [
                    SizedBox(
                      height: 20.sp,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp)),
                            backgroundColor: ThemeColor.primaryColor,
                          ),
                          onPressed: () {
                            // TODO : LAKUKAN SIMPAN
                            // PADA SAAT ACTION CPPT
                          },
                          child: Text(
                            "SIMPAN",
                            style: whiteTextStyle,
                          )),
                    )
                  ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
