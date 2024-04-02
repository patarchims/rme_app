import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';

class AsesmenFungsionalWidget extends StatefulWidget {
  const AsesmenFungsionalWidget({super.key});

  @override
  State<AsesmenFungsionalWidget> createState() =>
      _AsesmenFungsionalWidgetState();
}

class _AsesmenFungsionalWidgetState extends State<AsesmenFungsionalWidget> {
  String fungsionalStr = "";
  @override
  void initState() {
    fungsionalStr = fungsional.first;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setFungsional(String value) {
    setState(() {
      fungsionalStr = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
        widget: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: Column(
              children: fungsional
                  .map((e) => ListTile(
                        title: Text(
                          e,
                          style: blackTextStyle,
                        ),
                        leading: Radio(
                            activeColor: ThemeColor.primaryColor,
                            value: e,
                            groupValue: fungsionalStr,
                            onChanged: (value) {
                              log(value.toString());
                              setFungsional(value.toString());
                            }),
                      ))
                  .toList(),
            ),
          ),
          Card(
            elevation: 0,
            child: DropdownButton(
                items: bantuan
                    .map((e) => DropdownMenuItem(
                            child: Text(
                          e,
                          style: blackTextStyle,
                        )))
                    .toList(),
                onChanged: (value) {}),
          )
        ],
      ),
    ));
  }
}

List<String> fungsional = ["Madiri", "Dengan Bantuan"];

List<String> bantuan = ["Bidan", "Perawat", "Dokter", "Keluarga"];
