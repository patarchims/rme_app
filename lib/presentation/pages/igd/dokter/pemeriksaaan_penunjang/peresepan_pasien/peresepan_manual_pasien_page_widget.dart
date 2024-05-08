import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:hms_app/presentation/widget/pengembangan_widget.dart';

class PeresepanManualPasienPageWidget extends StatelessWidget {
  const PeresepanManualPasienPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
      backgroundColor: ThemeColor.bgColor,
      isENableAdd: true,
      widget: const Center(child: PengembanganWidget()),
    );
  }
}
