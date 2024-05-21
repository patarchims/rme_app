import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/alert/custom_dialog.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
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
        child: HeaderContentWidget(
      onPressed: () {
        // TODO: TAMBAH DATA
        CustomDialogWidget.getDialog(
            widget: SizedBox(
                height: Get.height,
                width: Get.width,
                child: const TambahFormulirSurvailansWidgetPage()),
            color: ThemeColor.blueColor);
      },
      title: "TAMBAH",
      widget: Container(),
      isENableAdd: true,
    ));
  }
}
