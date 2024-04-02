import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';

class KeterbatasanFisikWidget extends StatelessWidget {
  const KeterbatasanFisikWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
      widget: SingleChildScrollView(
        child: Column(
          children: keterbatasanFisik
              .map((e) => ListTile(
                    title: Text(
                      e,
                      style: blackTextStyle,
                    ),
                    leading: Radio(
                        value: keterbatasanFisik[0],
                        groupValue: keterbatasanFisik,
                        onChanged: (value) {}),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

List<String> keterbatasanFisik = [
  "Kesulitan Berjalan",
  "Kesakitan",
  "Gangguan Penglihatan",
  "Kelemahan Anggota Gerak"
];
