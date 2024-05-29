import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/alert/custom_dialog.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/kebidanan/presentation/fornulir_surveilans/formulir_surveilans_pasien_tirah_baring_widget_page.dart';
import 'package:hms_app/presentation/kebidanan/presentation/fornulir_surveilans/tambah_data_formulir_survailans_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';

class FormulirSourvilnPage extends StatefulWidget {
  const FormulirSourvilnPage({super.key});

  @override
  State<FormulirSourvilnPage> createState() => _FormulirSourvilnState();
}

class _FormulirSourvilnState extends State<FormulirSourvilnPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TabbarHeaderContentWidget(
      menu: menu,
      backgroundColor: ThemeColor.bgColor,
      onTap: (index) {},
      children: menu.asMap().entries.map((e) {
        if (menu.first == e.value) {
          return const FormulirSurveilansPasienTirahBaringWidgetPage();
        }
        return Container();
      }).toList(),
      // onPressed: () {
      // TODO: TAMBAH DATA
      // CustomDialogWidget.getDialog(
      //     widget: SizedBox(
      //         height: Get.height,
      //         width: Get.width,
      //         child: const TambahFormulirSurvailansWidgetPage()),
      //     color: ThemeColor.blueColor);
      // },
      // title: "TAMBAH",
      // widget: Container(),
      // isENableAdd: true,
    ));
  }
}

List<String> menu = [
  "SURVEILANS PASIEN TIRAH BARING TOTAL",
  "SURVAILANS PASIEN TERPASANG KATETER URINE",
];
