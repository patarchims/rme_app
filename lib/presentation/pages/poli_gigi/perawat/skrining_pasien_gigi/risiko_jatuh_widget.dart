import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';

class RisikoJatuhWidget extends StatelessWidget {
  const RisikoJatuhWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
      widget: SingleChildScrollView(
        child: Column(
          children: risiko
              .map((e) => Card(
                    elevation: 0,
                    color: ThemeColor.bgColor,
                    child: ListTile(
                      title: Text(
                        e,
                        style: blackTextStyle,
                      ),
                      leading: Radio(
                          value: risiko[0],
                          groupValue: risiko,
                          onChanged: (value) {}),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

List<String> risiko = ["Berisiko Jatuh", "Tidak Berisiko Jatuh"];
