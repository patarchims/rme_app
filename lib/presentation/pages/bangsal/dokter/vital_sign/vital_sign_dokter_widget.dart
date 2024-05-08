import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class VitalSignDokterRawatInapWidget extends StatefulWidget {
  const VitalSignDokterRawatInapWidget({super.key});

  @override
  State<VitalSignDokterRawatInapWidget> createState() =>
      _VitalSignDokterRawatInapWidgetState();
}

class _VitalSignDokterRawatInapWidgetState
    extends State<VitalSignDokterRawatInapWidget> {
  late String keadaanValue = "";
  late String kesadaranValue = "";

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: HeaderContentWidget(
      onPressed: () {},
      title: "Simpan",
      widget: SingleChildScrollView(
        child: Column(
          children: [
            // KEADAAN UMUM KESADARAAN
            TitleWidget.titleContainer(title: "Keadaan"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Keadaan Umum",
                    style: blackTextStyle,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    width: Get.width / 3,
                    child: DropdownButtonFormField2(
                      hint: const Text(
                        'Pilih',
                        style: TextStyle(fontSize: 14),
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'Pilih';
                        }
                        return null;
                      },
                      isExpanded: true,
                      decoration: InputDecoration(
                        fillColor: ThemeColor.bgColor,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.sp),
                        ),
                        // Add more decoration..
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 24,
                      ),
                      value:
                          (keadaanValue == "") ? _keadaanUmum[0] : keadaanValue,
                      items: (_keadaanUmum.isNotEmpty)
                          ? _keadaanUmum
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
                              .toList()
                          : [],
                      onChanged: (value) {
                        // TAMBAHKAN SELECTED USER PADA STATE
                      },
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      style: blackTextStyle.copyWith(
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
            ),
            // KESADARAAN
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kesadaran",
                    style: blackTextStyle,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    width: Get.width / 3,
                    child: DropdownButtonFormField2(
                      hint: const Text(
                        'Pilih',
                        style: TextStyle(fontSize: 14),
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'Pilih';
                        }
                        return null;
                      },
                      isExpanded: true,
                      decoration: InputDecoration(
                        fillColor: ThemeColor.bgColor,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.sp),
                        ),
                        // Add more decoration..
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 24,
                      ),
                      value: (kesadaranValue == "")
                          ? _kesadaran[0]
                          : kesadaranValue,
                      items: (_kesadaran.isNotEmpty)
                          ? _kesadaran
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
                              .toList()
                          : [],
                      onChanged: (value) {
                        // TAMBAHKAN SELECTED USER PADA STATE
                      },
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      style: blackTextStyle.copyWith(
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
            ),
            // VITAL SIGN
            TitleWidget.titleContainer(title: "Vital Sign"),
            Row(
              children: [
                SizedBox(
                  width: Get.width / 2.5,
                  child: Column(
                    children: [
                      TitleWidget.formBox(
                        title: "Tekanan Darah",
                        subTitle: "mmHg",
                      ),
                      TitleWidget.formBox(
                        title: "Nadi",
                        subTitle: "x/mnt",
                      ),
                      TitleWidget.formBox(
                        title: "Pernapasan",
                        subTitle: "x/mnt",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: Column(
                      children: [
                        TitleWidget.formBox(
                          title: "Suhu",
                          subTitle: "°C",
                        ),
                        TitleWidget.formBox(
                          title: "Tinggi Badan",
                          subTitle: "cm",
                        ),
                        TitleWidget.formBox(
                          title: "Berat Badan",
                          subTitle: "Kg",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

List<String> _keadaanUmum = [
  "Baik",
  "Sedang",
  "Jelek",
  "Kooperatif",
  "Non Kooperatif"
];

List<String> _kesadaran = ["CM", "Somnolen", "Apatis", "Sopor", "Koma"];
