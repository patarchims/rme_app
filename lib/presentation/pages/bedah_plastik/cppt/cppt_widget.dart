import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class CPPTWidgetContentBedah extends StatefulWidget {
  const CPPTWidgetContentBedah({super.key});

  @override
  State<CPPTWidgetContentBedah> createState() => _CPPTWidgetContentBedahState();
}

class _CPPTWidgetContentBedahState extends State<CPPTWidgetContentBedah> {
  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: HeaderContentWidget(
            title: "Tambah",
            onPressed: () {
              // TAMPILKAN SILAHKAN INPUT DATA
              CustomDialogWidget.getDialog(
                  widget: Container(
                    width: 300.sp,
                    height: 200.sp,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Scaffold(
                      backgroundColor: ThemeColor.bgColor,
                      appBar: AppBar(
                        title: Text(
                          "SILAHKAN INPUT PASIEN BERBASIS SOAP",
                          style: whiteTextStyle,
                        ),
                      ),
                      body: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: _keyForm,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ===============
                              Text(
                                "Isikan SUBJEKTIF Pada Kolom Dibawah Ini :",
                                style: blackTextStyle,
                              ),
                              FormWidget.textForm(enable: true),
                              const Divider(),
                              Text(
                                "Isikan SUBJEKTIF Pada Kolom Dibawah Ini :",
                                style: blackTextStyle,
                              ),
                              FormWidget.textForm(enable: true),
                              const Divider(),
                              Text(
                                "Isikan SUBJEKTIF Pada Kolom Dibawah Ini :",
                                style: blackTextStyle,
                              ),
                              FormWidget.textForm(enable: true),
                              const Divider(),
                              Text(
                                "Isikan SUBJEKTIF Pada Kolom Dibawah Ini :",
                                style: blackTextStyle,
                              ),
                              FormWidget.textForm(enable: true),
                              const Divider(),
                              Row(
                                children: [
                                  SizedBox(
                                    width: Get.width / 4,
                                    height: 25.sp,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2.sp)),
                                        backgroundColor:
                                            ThemeColor.primaryColor,
                                      ),
                                      child: Text(
                                        "OK",
                                        style: whiteTextStyle,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 25.sp,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.sp)),
                                          backgroundColor: ThemeColor.greyColor,
                                        ),
                                        child: Text(
                                          "CANCEL",
                                          style: whiteTextStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  color: Colors.transparent);
            },
            widget: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width,
                    height: 15.sp,
                    decoration:
                        const BoxDecoration(color: Colors.lightBlueAccent),
                    child: Center(
                      child: Text(
                        "Catatan Perkembangan Pasien Terintegrasi CPPT",
                        style: blackTextStyle.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
