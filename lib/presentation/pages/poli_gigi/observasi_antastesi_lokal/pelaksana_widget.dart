import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/form/form_textfield_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class PelaksanaWidget extends StatelessWidget {
  const PelaksanaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
      widget: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(6.sp),
          child: Column(
            children: [
              Card(
                color: ThemeColor.bgColor,
                elevation: 0,
                margin: EdgeInsets.all(2.sp),
                child: Row(
                  children: [
                    SizedBox(
                      width: Get.width / 6,
                      child: Text(
                        "Dokter Pelaksana",
                        style: blackTextStyle,
                      ),
                    ),
                    Expanded(
                        child: Row(
                      children: [
                        SizedBox(
                          width: 250.sp,
                          child: FormWidget.textForm(
                            enable: true,
                          ),
                        ),
                        SizedBox(width: 5.sp),
                      ],
                    ))
                  ],
                ),
              ),
              Card(
                color: ThemeColor.bgColor,
                elevation: 0,
                margin: EdgeInsets.all(2.sp),
                child: Row(
                  children: [
                    SizedBox(
                      width: Get.width / 6,
                      child: Text(
                        "Asistan",
                        style: blackTextStyle,
                      ),
                    ),
                    Expanded(
                        child: Row(
                      children: [
                        SizedBox(
                          width: 250.sp,
                          child: FormWidget.textForm(
                            enable: true,
                          ),
                        ),
                        SizedBox(width: 5.sp),
                      ],
                    ))
                  ],
                ),
              ),
              Card(
                color: ThemeColor.bgColor,
                elevation: 0,
                margin: EdgeInsets.all(2.sp),
                child: Row(
                  children: [
                    SizedBox(
                      width: Get.width / 6,
                      child: Text(
                        "Instrumentator",
                        style: blackTextStyle,
                      ),
                    ),
                    Expanded(
                        child: Row(
                      children: [
                        SizedBox(
                          width: 250.sp,
                          child: FormWidget.textForm(
                            enable: true,
                          ),
                        ),
                        SizedBox(width: 5.sp),
                      ],
                    ))
                  ],
                ),
              ),
              Card(
                color: ThemeColor.bgColor,
                elevation: 0,
                margin: EdgeInsets.all(2.sp),
                child: Row(
                  children: [
                    SizedBox(
                      width: Get.width / 6,
                      child: Text(
                        "Sirkular",
                        style: blackTextStyle,
                      ),
                    ),
                    Expanded(
                        child: Row(
                      children: [
                        SizedBox(
                          width: 250.sp,
                          child: FormWidget.textForm(
                            enable: true,
                          ),
                        ),
                        SizedBox(width: 5.sp),
                      ],
                    ))
                  ],
                ),
              ),
              Card(
                color: ThemeColor.bgColor,
                elevation: 0,
                margin: EdgeInsets.all(2.sp),
                child: Row(
                  children: [
                    SizedBox(
                      width: Get.width / 6,
                      child: Text(
                        "Jenis Operasi",
                        style: blackTextStyle,
                      ),
                    ),
                    Expanded(
                        child: Wrap(
                      children: jenisOperasi
                          .map((e) => SizedBox(
                                width: 155.sp,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(2.sp)),
                                  color: ThemeColor.bgColor,
                                  elevation: 1,
                                  child: ListTile(
                                    selectedColor: ThemeColor.primaryColor,
                                    title: Text(
                                      e,
                                      style: blackTextStyle,
                                    ),
                                    leading: Radio(
                                        activeColor: ThemeColor.primaryColor,
                                        value: jenisOperasi,
                                        groupValue: jenisOperasi,
                                        onChanged: (value) {}),
                                  ),
                                ),
                              ))
                          .toList(),
                    ))
                  ],
                ),
              ),
              Card(
                color: ThemeColor.bgColor,
                elevation: 0,
                margin: EdgeInsets.all(2.sp),
                child: Row(
                  children: [
                    SizedBox(
                      width: Get.width / 6,
                      child: Text(
                        "Obat Anastesi",
                        style: blackTextStyle,
                      ),
                    ),
                    Expanded(
                        child: Wrap(
                      children: obatAnastesi
                          .map((e) => SizedBox(
                                width: 145.sp,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(2.sp)),
                                  color: ThemeColor.bgColor,
                                  elevation: 0,
                                  child: ListTile(
                                    selectedColor: ThemeColor.primaryColor,
                                    title: Text(
                                      e,
                                      style: blackTextStyle,
                                    ),
                                    leading: Radio(
                                        activeColor: ThemeColor.primaryColor,
                                        value: obatAnastesi,
                                        groupValue: obatAnastesi,
                                        onChanged: (value) {}),
                                  ),
                                ),
                              ))
                          .toList(),
                    ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2.sp),
                child: Card(
                  elevation: 0,
                  color: ThemeColor.bgColor,
                  child: Row(
                    children: [
                      SizedBox(
                        width: Get.width / 5,
                        child: Text(
                          "Diagnosa",
                          style: blackTextStyle,
                        ),
                      ),
                      Expanded(
                          child: Row(
                        children: [
                          SizedBox(
                            width: 250.sp,
                            child: FormWidget.textForm(
                              enable: true,
                            ),
                          ),
                          SizedBox(width: 5.sp),
                          SizedBox(
                            height: 25.sp,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(2.sp)),
                                  backgroundColor: ThemeColor.primaryColor),
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2.sp),
                child: Card(
                  elevation: 0,
                  color: ThemeColor.bgColor,
                  child: Row(
                    children: [
                      SizedBox(
                        width: Get.width / 5,
                        child: Text(
                          "Tindakan Operasi",
                          style: blackTextStyle,
                        ),
                      ),
                      Expanded(
                          child: Row(
                        children: [
                          SizedBox(
                            width: 250.sp,
                            child: FormWidget.textForm(
                              enable: true,
                            ),
                          ),
                          SizedBox(width: 5.sp),
                          SizedBox(
                            height: 25.sp,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(2.sp)),
                                  backgroundColor: ThemeColor.primaryColor),
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2.sp),
                child: Card(
                  elevation: 0,
                  color: ThemeColor.bgColor,
                  child: Row(
                    children: [
                      SizedBox(
                        width: Get.width / 5,
                        child: Text("Jam Anastesi", style: blackTextStyle),
                      ),
                      Container(
                        width: 55.sp,
                        margin: EdgeInsets.only(
                          bottom: 6.sp,
                        ),
                        child: DropdownButtonFormField(
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          value: jamAnastesi[0],
                          icon: const Icon(
                            Icons.arrow_downward_rounded,
                            color: ThemeColor.primaryColor,
                          ),
                          items: jamAnastesi
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {},
                          decoration: FormWidget.styleDropdown(context),
                          style: blackTextStyle.copyWith(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> jenisOperasi = ["Bersih", "Bersih Terkontaminasi"];
List<String> obatAnastesi = [
  "Lidocain 2%",
  "Pehacain 2%",
  "Benzocain 20% gel",
  "ChlorEty Spray",
  "Articain 4%"
];

List<String> jamAnastesi = [
  "00",
  "01",
  "02",
  "03",
  "04",
  "05",
  "06",
  "07",
  "08",
  "09",
  "10",
  "11",
  "12",
  "13",
  "14",
  "15",
  "16",
  "17",
  "18",
  "19",
  "20",
  "21"
];
