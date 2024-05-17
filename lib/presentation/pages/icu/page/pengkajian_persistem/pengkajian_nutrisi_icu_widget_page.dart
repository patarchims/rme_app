import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';

class PengkajianNutrisiAnakWidgetPage extends StatefulWidget {
  const PengkajianNutrisiAnakWidgetPage({super.key});

  @override
  State<PengkajianNutrisiAnakWidgetPage> createState() =>
      _PengkajianNutrisiAnakWidgetPageState();
}

class _PengkajianNutrisiAnakWidgetPageState
    extends State<PengkajianNutrisiAnakWidgetPage> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
        backgroundColor: ThemeColor.bgColor,
        isENableAdd: true,
        onPressed: () {
          // ON PRESSED
        },
        widget: SingleChildScrollView(
          controller: _scrollController,
          child: const Column(
            children: [],
          ),
        ));
  }
}
