import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class SkriningPasienWidget extends StatefulWidget {
  const SkriningPasienWidget({super.key});

  @override
  State<SkriningPasienWidget> createState() => _SkriningPasienWidgetState();
}

class _SkriningPasienWidgetState extends State<SkriningPasienWidget> {
  late String kegawatanValue;
  late String keterbatasanFisikValue;
  late String risikoJatuhValue;

  String selectedRisikoJatuhValue = "";
  @override
  void initState() {
    kegawatanValue = kegawatan[0];
    keterbatasanFisikValue = "";
    risikoJatuhValue = "";
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setRisikoJatuh(String value) {
    setState(() {
      selectedRisikoJatuhValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: HeaderContentWidget(
      onPressed: () {},
      widget: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.all(1.sp),
        decoration: const BoxDecoration(),
        child: Card(
          elevation: 2.sp,
          color: ThemeColor.transparentColor,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: ThemeColor.darkColor,
                  width: 1.sp,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(
                2.sp,
              )),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // TAMPILKAN KEGAWATAN
                titleBox(title: "Kegawatan"),

                Wrap(
                  children: kegawatan
                      .map((e) => ListTile(
                            title: Text(
                              e,
                              style: blackTextStyle,
                            ),
                            leading: Radio(
                                activeColor: ThemeColor.primaryColor,
                                value: kegawatanValue,
                                groupValue: kegawatan,
                                onChanged: (value) {}),
                          ))
                      .toList(),
                ),

                // TAMPILKAN KEGAWATAN
                titleBox(title: "Intervensi"),

                Wrap(
                  children: intervensi
                      .map((e) => Card(
                            margin: EdgeInsets.all(6.sp),
                            elevation: 0,
                            color: ThemeColor.transparentColor,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 55.sp,
                                  child: ListTile(
                                    title: Text(
                                      "Ya",
                                      style: blackTextStyle,
                                    ),
                                    leading: Radio(
                                        activeColor: ThemeColor.primaryColor,
                                        value: intervensi,
                                        groupValue: intervensi,
                                        onChanged: (value) {}),
                                  ),
                                ),
                                SizedBox(
                                  width: 65.sp,
                                  child: ListTile(
                                    title: Text(
                                      "Tidak",
                                      style: blackTextStyle,
                                    ),
                                    leading: Radio(
                                        value: intervensi,
                                        activeColor: ThemeColor.primaryColor,
                                        groupValue: intervensi,
                                        onChanged: (value) {}),
                                  ),
                                ),
                                Expanded(
                                    child: Text(
                                  e,
                                  style: blackTextStyle,
                                ))
                              ],
                            ),
                          ))
                      .toList(),
                ),

                // keterbatasan fisik
                // TAMPILKAN KEGAWATAN
                titleBox(title: "Keterbatasan Fisik"),

                Wrap(
                  children: keterbatasanFisik
                      .map((e) => SizedBox(
                            width: 200.sp,
                            child: ListTile(
                              title: Text(
                                e,
                                style: blackTextStyle,
                              ),
                              leading: Radio(
                                  activeColor: ThemeColor.primaryColor,
                                  value: kegawatanValue,
                                  groupValue: kegawatan,
                                  onChanged: (value) {}),
                            ),
                          ))
                      .toList(),
                ),

                // TAMPILKAN KEGAWATAN
                titleBox(title: "Batuk"),

                Wrap(
                  children: batuk
                      .map((e) => SizedBox(
                            width: 200.sp,
                            child: ListTile(
                              title: Text(
                                e,
                                style: blackTextStyle,
                              ),
                              leading: Radio(
                                  activeColor: ThemeColor.primaryColor,
                                  value: kegawatanValue,
                                  groupValue: kegawatan,
                                  onChanged: (value) {}),
                            ),
                          ))
                      .toList(),
                ),
                titleBox(title: "Risiko Jatuh"),
                SizedBox(
                  height: 10.sp,
                ),

                Wrap(
                  children: batuk
                      .map((e) => SizedBox(
                            width: 200.sp,
                            height: 35.sp,
                            child: Card(
                              color: ThemeColor.lightGrey,
                              elevation: 1.sp,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.sp)),
                              child: Center(
                                child: RadioListTile(
                                    selected: (e == selectedRisikoJatuhValue)
                                        ? true
                                        : false,
                                    activeColor: const Color(0xFF293074),
                                    selectedTileColor: ThemeColor.bgColor,
                                    title: Text(
                                      e,
                                      style: blackCalibriTextStyle.copyWith(
                                          fontSize: 10.sp),
                                      maxLines: 3,
                                      textAlign: TextAlign.start,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    value: e,
                                    groupValue: selectedRisikoJatuhValue,
                                    onChanged: (value) {
                                      setRisikoJatuh(value.toString());
                                    }),
                              ),
                            ),
                          ))
                      .toList(),
                ),

                SizedBox(
                  height: 10.sp,
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Container titleBox({required String title}) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(5.sp),
      decoration: BoxDecoration(
          color: ThemeColor.blueColor.withOpacity(0.5),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(2.sp), topRight: Radius.circular(2.sp))),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: whiteTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

List<String> kegawatan = [
  "Tidak Sadar",
  "Jari-jari & Kaki Dingin Atau Tampak Kebiruan",
  "Sesak Napas Berat",
  "Muntah, Diare Atau Keduanya >4-5x/24jam",
  "Kejang",
  "Khusus Bayi:Ubun-ubun Keliatan Cekung Atau Teraba Cekung"
];

List<String> intervensi = [
  "Berikan Kursi Roda Atau Tawaran Brankat Apabila Pasien Membutuhkan",
  "Berikan Edukasi Kepada Dan Atau Kelurga Agar Meminta Pertolongan Petugas Apabila Melakukan Aktifitas Selama Berada di Rumah Dakit, misal : ke Toilet, dll",
  "Informasi Kepada Pasien dan Atau Keluarga Melepas Pita Risiko Jatuh Setelah Keluar Dari Rumah Sakit",
  "Bantu Pasien Yang Melakukan Kegiatan Di Lokasi Yang meningkatkan Risiko Jatuh, misal Pasien Melakukan Latihan Dengan Menggunakan Alat-Alat Yang meningkatkan Risiko Jatuh di Unit Rehabilitas Medik"
];

List<String> keterbatasanFisik = [
  "Kesulitan Berjalan",
  "Kesakitan",
  "Gangguan Penglihatan",
  "Kelemahan Anggota Gerak"
];

List<String> batuk = [
  "Batuk-batuk berkepanjangan (Baik Disertai Panas Atau Tidak)",
  "Batuk Berdarah"
];
