import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/form/form_textfield_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class PascaOperasiWidget extends StatefulWidget {
  const PascaOperasiWidget({super.key});

  @override
  State<PascaOperasiWidget> createState() => _PascaOperasiWidgetState();
}

class _PascaOperasiWidgetState extends State<PascaOperasiWidget> {
  late TextEditingController _keadaanUmumController;
  late TextEditingController _tekDarahController;
  late TextEditingController _nadiController;
  late TextEditingController _suhuController;
  late TextEditingController _pernapasanController;

  @override
  void initState() {
    _keadaanUmumController = TextEditingController();
    _keadaanUmumController = TextEditingController();
    _tekDarahController = TextEditingController();
    _nadiController = TextEditingController();
    _suhuController = TextEditingController();
    _pernapasanController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _keadaanUmumController.clear();
    _keadaanUmumController.clear();
    _tekDarahController.clear();
    _nadiController.clear();
    _suhuController.clear();
    _pernapasanController.clear();

    _keadaanUmumController.dispose();
    _tekDarahController.dispose();
    _nadiController.dispose();
    _suhuController.dispose();
    _pernapasanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
      widget: SingleChildScrollView(
        child: Column(
          children: [
            titleBox(title: "Keadaan Umum"),
            titleBox(title: "Keluhan Utama"),
            formBox(title: "Tek Darah", subTitle: "mmHG"),
            formBox(title: "Nadi", subTitle: "x/mnt"),
            formBox(title: "Suhu", subTitle: "*C"),
            formBox(title: "Pernapasan", subTitle: "x/mnt"),
          ],
        ),
      ),
      onPressed: () {},
    );
  }

  Container formBox({required String title, required String subTitle}) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 4.sp),
      child: Row(
        children: [
          SizedBox(
            width: 150.sp,
            child: Text(
              title,
              style: blackTextStyle,
            ),
          ),
          Expanded(child: FormWidget.textForm(enable: true)),
          SizedBox(
            width: 5.sp,
          ),
          SizedBox(
            width: 150.sp,
            child: Text(
              subTitle,
              style: blackTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  Container titleBox({required String title}) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 4.sp),
      child: Row(
        children: [
          SizedBox(
            width: 150.sp,
            child: Text(
              title,
              style: blackTextStyle,
            ),
          ),
          Expanded(child: FormWidget.textForm(enable: true))
        ],
      ),
    );
  }
}
