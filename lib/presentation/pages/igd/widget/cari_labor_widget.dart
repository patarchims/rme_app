import 'package:flutter/material.dart';

class CariPenmedLaborWidget extends StatefulWidget {
  const CariPenmedLaborWidget({super.key});

  @override
  State<CariPenmedLaborWidget> createState() => _CariLaborWidgetState();
}

class _CariLaborWidgetState extends State<CariPenmedLaborWidget> {
  late TextEditingController _cariController;
  String valueSearch = "";

  @override
  void initState() {
    _cariController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _cariController.clear();
    _cariController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
