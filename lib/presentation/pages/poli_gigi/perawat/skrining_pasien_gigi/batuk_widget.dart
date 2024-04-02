import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';

class BatukWidget extends StatelessWidget {
  const BatukWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
        widget: SingleChildScrollView(
      child: Column(
        children: batuk
            .map((e) => ListTile(
                  title: Text(
                    e,
                    style: blackTextStyle,
                  ),
                  leading: Radio(
                      value: batuk[0],
                      groupValue: batuk,
                      onChanged: (value) {}),
                ))
            .toList(),
      ),
    ));
  }
}

List<String> batuk = [
  "Batuk-batuk Berkepanjangan (Baik Diserta Panas Atau Tidak)",
  "Batuk Berdarah"
];
