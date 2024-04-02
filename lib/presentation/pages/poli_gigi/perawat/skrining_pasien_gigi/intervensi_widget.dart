import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class IntervensiWidget extends StatelessWidget {
  const IntervensiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
        widget: SingleChildScrollView(
      child: Column(
        children: intervensi
            .map((e) => Card(
                  margin: EdgeInsets.all(6.sp),
                  elevation: 0,
                  color: ThemeColor.bgColor,
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
    ));
  }
}

List<String> intervensi = [
  "Berikan Kursi Roda Atau Tawaran Brankat Apabila Pasien Membutuhkan",
  "Berikan Edukasi Kepada Dan Atau Kelurga Agar Meminta Pertolongan Petugas Apabila Melakukan Aktifitas Selama Berada di Rumah Dakit, misal : ke Toilet, dll",
  "Informasi Kepada Pasien dan Atau Keluarga Melepas Pita Risiko Jatuh Setelah Keluar Dari Rumah Sakit",
  "Bantu Pasien Yang Melakukan Kegiatan Di Lokasi Yang meningkatkan Risiko Jatuh, misal Pasien Melakukan Latihan Dengan Menggunakan Alat-Alat Yang meningkatkan Risiko Jatuh di Unit Rehabilitas Medik"
];
