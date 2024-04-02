import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/form/form_textfield_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class SkalaNyeriWidget extends StatefulWidget {
  const SkalaNyeriWidget({super.key});

  @override
  State<SkalaNyeriWidget> createState() => _SkalaNyeriWidgetState();
}

class _SkalaNyeriWidgetState extends State<SkalaNyeriWidget> {
  late TextEditingController _provokasiController = TextEditingController();
  late TextEditingController _qualityController = TextEditingController();
  late TextEditingController _radiationController = TextEditingController();
  late TextEditingController _severityController = TextEditingController();
  late TextEditingController _timeController = TextEditingController();

  double _currentNyeri = 0;

  @override
  void initState() {
    _provokasiController = TextEditingController();
    _qualityController = TextEditingController();
    _radiationController = TextEditingController();
    _severityController = TextEditingController();
    _timeController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: HeaderContentWidget(
            widget: ListView(
      children: [
        titleContainer(title: "Skala Nyeri"),
        Slider(
          value: _currentNyeri,
          max: 10,
          divisions: 10,
          label: _currentNyeri.round().toString(),
          activeColor: ThemeColor.greenColor,
          onChanged: (double value) {
            setState(() {
              _currentNyeri = value;
            });
            // log(value.toString());
            log(_currentNyeri.toString());
          },
        ),
        Row(
          children: [
            SizedBox(height: 50.sp, width: 50.sp, child: Image.asset("1.png")),
          ],
        ),
        SizedBox(
          child: Row(
            children: [
              SizedBox(
                  width: Get.width / 2.5,
                  child: Text(
                    "Skala\nNyeri\n${_currentNyeri.toInt()}",
                    style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
              Expanded(
                  child: SizedBox(
                child: Column(
                  children: [
                    SizedBox(
                        height: 50.sp,
                        child: Image.asset(toNyeri(nyeri: _currentNyeri))),
                    Text(
                      toNyeriText(nyeri: _currentNyeri),
                      style: blackTextStyle,
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
        formBox(
            title: "P",
            subTitle: "",
            labelText: "Isikan Deskripsi Provokatif Disini",
            controller: _provokasiController),
        formBox(
            title: "Q",
            subTitle: "",
            labelText: "Isikan Deskripsi Quality Disini",
            controller: _qualityController),
        formBox(
            title: "R",
            subTitle: "",
            labelText: "Isikan Deskripsi Radiation Disini",
            controller: _radiationController),
        formBox(
            title: "S",
            subTitle: "",
            labelText: "Isikan Deskripsi Severity Disini",
            controller: _severityController),
        formBox(
            title: "T",
            subTitle: "",
            labelText: "Isikan Deskripsi Time Disini",
            controller: _timeController),
        SizedBox(height: 5.sp),
      ],
    )));
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
}

String toNyeriText({required double nyeri}) {
  switch (nyeri) {
    case 1:
      return "Tidak Ada Nyeri";
    case 2:
      return "Nyeri Ringan";
    case 3:
      return "Nyeri Ringan";
    case 4:
      return "Nyeri Yang Menganggu";
    case 5:
      return "Nyeri Yang Menganggu";
    case 6:
      return "Nyeri Yang Menyusahkan";
    case 7:
      return "Nyeri Yang Menyusahkan";
    case 8:
      return "Nyeri Hebat";
    case 9:
      return "Nyeri Hebat";
    case 10:
      return "Nyeri Sangat Hebat";
    default:
      return "Tidak Ada Nyeri";
  }
}

String toNyeri({required double nyeri}) {
  switch (nyeri) {
    case 1:
      return "assets/images/nyeri/1.png";
    case 2:
      return "assets/images/nyeri/2.png";
    case 3:
      return "assets/images/nyeri/2.png";
    case 4:
      return "assets/images/nyeri/3.png";
    case 5:
      return "assets/images/nyeri/3.png";
    case 6:
      return "assets/images/nyeri/4.png";
    case 7:
      return "assets/images/nyeri/5.png";
    case 8:
      return "assets/images/nyeri/5.png";
    case 9:
      return "assets/images/nyeri/6.png";
    case 10:
      return "assets/images/nyeri/6.png";
    default:
      return "assets/images/nyeri/1.png";
  }
}

List<String> skala = ["Wajah", "Kaki", "Aktifitas", "Menangis", "Bersuara"];

Container formBox(
    {required String title,
    required String subTitle,
    String? labelText,
    TextEditingController? controller}) {
  return Container(
    width: Get.width,
    padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 4.sp),
    child: Row(
      children: [
        SizedBox(
          width: 70.sp,
          child: Text(
            title,
            style: (labelText != null)
                ? blackTextStyle.copyWith(fontWeight: FontWeight.bold)
                : blackTextStyle,
          ),
        ),
        Expanded(
            child: FormWidget.textForm(
          labelText: labelText,
          controller: controller,
          enable: true,
        )),
        SizedBox(
          width: 5.sp,
        ),
        SizedBox(
          width: 25.sp,
          child: Text(
            subTitle,
            style: blackTextStyle,
          ),
        ),
      ],
    ),
  );
}
