import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/igd/dokter/input_diagnosa_igd_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class AsesmenDokterWidgetContent extends StatelessWidget {
  const AsesmenDokterWidgetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: HeaderContentWidget(
            onPressed: () {},
            title: "Simpan",
            widget: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //===============
                  Container(
                    width: Get.width,
                    height: 15.sp,
                    decoration:
                        const BoxDecoration(color: Colors.lightBlueAccent),
                    child: Center(
                      child: Text(
                        "Asesmen Awal Rawat Jalan (Dokter)",
                        style: blackTextStyle.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Anamnesa",
                      textAlign: TextAlign.start,
                      style:
                          blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.sp),
                    child: FormWidget.textArea(
                        maxLines: 3,
                        validator: (e) {
                          return null;

                          //
                        }),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Pemeriksaan Fisik",
                      textAlign: TextAlign.start,
                      style:
                          blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.sp),
                    child: FormWidget.textArea(
                        maxLines: 3,
                        validator: (e) {
                          return null;

                          //
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Input Diagnosa Sesuai ICD-10",
                      textAlign: TextAlign.start,
                      style:
                          blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: Get.width,
                    height: 100.sp,
                    child: const InputDiagnosaIgdWidget(enableEdit: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Input Diagnosa Sesuai ICD-9",
                      textAlign: TextAlign.start,
                      style:
                          blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: Get.width,
                    height: 100.sp,
                    child: const InputDiagnosaIgdWidget(enableEdit: true),
                  ),
                  SizedBox(
                    height: 25.sp,
                  )
                ],
              ),
            )));
  }
}
