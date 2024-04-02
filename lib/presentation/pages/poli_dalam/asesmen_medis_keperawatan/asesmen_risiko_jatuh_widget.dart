import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class AsesmenRisikoJatuhWidget extends StatefulWidget {
  const AsesmenRisikoJatuhWidget({super.key});

  @override
  State<AsesmenRisikoJatuhWidget> createState() =>
      _AsesmenRisikoJatuhWidgetState();
}

class _AsesmenRisikoJatuhWidgetState extends State<AsesmenRisikoJatuhWidget> {
  late String caraBerjalanValue1;
  late String caraBerjalanValue2;
  late String skriningResiko1;
  late String skriningResiko2;
  late String skriningResiko3;
  late String skriningResiko4;
  late String skriningResiko5;
  late String hasilResikoEdukasi;

  void setHasilResiko() {
    if (caraBerjalanValue1 == "Ya" && caraBerjalanValue2 == "Ya") {
      setState(() {
        hasilResikoEdukasi = "RISIKO TINGGI - Pasang Stiker";
      });
    }

    if (caraBerjalanValue1 == "Ya" && caraBerjalanValue2 == "Tidak") {
      setState(() {
        hasilResikoEdukasi = "RISIKO RENDAH - Edukasi";
      });
    }

    if (caraBerjalanValue1 == "Tidak" && caraBerjalanValue2 == "Ya") {
      setState(() {
        hasilResikoEdukasi = "RISIKO RENDAH - Edukasi";
      });
    }
    if (caraBerjalanValue1 == "Tidak" && caraBerjalanValue2 == "Tidak") {
      setState(() {
        hasilResikoEdukasi = "TIDAK BERISIKO - Tidak Ada Tindakan";
      });
    }
  }

  @override
  void initState() {
    hasilResikoEdukasi = "";
    caraBerjalanValue1 = "";
    caraBerjalanValue2 = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // =========================== //
    return Expanded(
        child: HeaderContentWidget(
            onPressed: () {},
            title: "Simpan",
            widget: Column(
              children: [
                titleContainer(
                    title: "Asesmen Risiko Jatuh (Get Up & Go Test)"),
                // ===================== //
                yaAtauTidakBox(
                    title:
                        "1. Tidak Seimbang/Sempoyongan/Limbung\n2. Jalan Dengan Menggunakan Alat bantu (Tongkat & Tripot, Kursi Roda, Orang Lain)",
                    selected: caraBerjalanValue1,
                    onChanged: (value) {
                      setState(() {
                        caraBerjalanValue1 = value.toString();
                      });

                      // SET HASIL  RISIKO JATUH
                      log(caraBerjalanValue1.toString());
                      setHasilResiko();
                    }),

                const Divider(),

                yaAtauTidakBox(
                    title:
                        "Menopang Saat Akan Duduk : Tampak Memegang Pinggang Kursi Atau Meja/Benda Lain Sebagai Penopang Saat Akan Duduk",
                    onChanged: (value) {
                      setState(() {
                        caraBerjalanValue2 = value.toString();
                      });
                      log(caraBerjalanValue2.toString());
                      setHasilResiko();
                    },
                    selected: caraBerjalanValue2),

                const Divider(),

                // TODO Hasil Resiko
                Text(hasilResikoEdukasi,
                    textAlign: TextAlign.left,
                    style:
                        blackTextStyle.copyWith(fontWeight: FontWeight.bold)),
              ],
            )));
  }
}

Container titleContainer({required String title}) {
  return Container(
    width: Get.width,
    height: 20.sp,
    decoration: BoxDecoration(
      color: ThemeColor.blueColor.withOpacity(0.5),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(2.sp), topRight: Radius.circular(2.sp)),
    ),
    child: Center(
      child: Text(
        title,
        style: blackTextStyle.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Container yaAtauTidakBox(
    {required String title,
    required String selected,
    required void Function(String?)? onChanged}) {
  return Container(
    margin: EdgeInsets.only(bottom: 2.sp),
    child: Row(
      children: [
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: yaAtauTidak
                    .map((e) => SizedBox(
                          width: 60.sp,
                          height: 25.sp,
                          child: RadioListTile(
                              selected: (e == selected) ? true : false,
                              activeColor: const Color(0xFF293074),
                              selectedTileColor: Colors.cyan,
                              title: Text(
                                e,
                                style: blackCalibriTextStyle.copyWith(
                                    fontSize: 8.sp),
                                maxLines: 3,
                                textAlign: TextAlign.start,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                              value: e,
                              groupValue: selected,
                              onChanged: onChanged),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: blackTextStyle,
          ),
        ),
      ],
    ),
  );
}

Row chooseBox(
    {required String title,
    required String selected,
    required void Function(String?)? onChanged,
    required List<String> list}) {
  return Row(
    children: [
      Container(
        padding: EdgeInsets.all(2.sp),
        width: Get.width / 2.sp,
        child: Text(
          title,
          style: blackTextStyle,
        ),
      ),
      Expanded(
          child: SizedBox(
        width: Get.width / 2.sp,
        child: Wrap(
          children: list
              .map((e) => SizedBox(
                    width: 90.sp,
                    height: 35.sp,
                    child: Card(
                      color: ThemeColor.lightGrey,
                      elevation: 1.sp,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.sp)),
                      child: Center(
                        child: RadioListTile(
                            selected: (e == selected) ? true : false,
                            activeColor: const Color(0xFF293074),
                            selectedTileColor: ThemeColor.bgColor,
                            title: Text(
                              e,
                              style: blackCalibriTextStyle.copyWith(
                                  fontSize: 8.sp),
                              maxLines: 3,
                              textAlign: TextAlign.start,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                            value: e,
                            groupValue: selected,
                            onChanged: onChanged),
                      ),
                    ),
                  ))
              .toList(),
        ),
      )),
    ],
  );
}

List<String> yaAtauTidak = ["Tidak", "Ya"];
