import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';

class KegawatanWidget extends StatelessWidget {
  const KegawatanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
      widget: SingleChildScrollView(
        child: Column(
          children: kegawatan
              .map((e) => ListTile(
                    title: Text(
                      e,
                      style: blackTextStyle,
                    ),
                    leading: Radio(
                        value: kegawatan[0],
                        groupValue: kegawatan,
                        onChanged: (value) {}),
                  ))
              .toList(),
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
