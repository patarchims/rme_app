import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class IntraOperasiWidget extends StatefulWidget {
  const IntraOperasiWidget({super.key});

  @override
  State<IntraOperasiWidget> createState() => _IntraOperasiWidgetState();
}

class _IntraOperasiWidgetState extends State<IntraOperasiWidget> {
  late TextEditingController _tekDarahController;
  late TextEditingController _nadiController;
  late TextEditingController _suhuController;
  late TextEditingController _pernapasanController;

  @override
  void initState() {
    _tekDarahController = TextEditingController();
    _nadiController = TextEditingController();
    _suhuController = TextEditingController();
    _pernapasanController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _tekDarahController.clear();
    _nadiController.clear();
    _suhuController.clear();
    _pernapasanController.clear();

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
          Expanded(
              child: FormWidget.textForm(
            enable: true,
          )),
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
          Expanded(
              child: FormWidget.textForm(
            enable: true,
          ))
        ],
      ),
    );
  }
}
