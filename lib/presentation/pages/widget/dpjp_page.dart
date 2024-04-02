import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DpjpWidgetPage extends StatelessWidget {
  const DpjpWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          appBar: AppBar(),
          backgroundColor: Colors.transparent,
          body: SizedBox(width: Get.width / 2, child: const Placeholder())),
    );
  }
}
