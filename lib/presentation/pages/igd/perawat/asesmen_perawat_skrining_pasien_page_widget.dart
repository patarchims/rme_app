import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';

class AsesmenPerawatSkriningPasienWidget extends StatefulWidget {
  const AsesmenPerawatSkriningPasienWidget({super.key});

  @override
  State<AsesmenPerawatSkriningPasienWidget> createState() =>
      _AsesmenPerawatSkriningPasienWidgetState();
}

class _AsesmenPerawatSkriningPasienWidgetState
    extends State<AsesmenPerawatSkriningPasienWidget> {
  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
        isENableAdd: true,
        backgroundColor: ThemeColor.bgColor,
        widget: const SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ));
  }
}
