import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/qr_code/qr_code_widget.dart';

class CustomQrWidget extends StatelessWidget {
  final double? dimension;
  final String dataBarcode;
  const CustomQrWidget({
    super.key,
    this.dimension,
    required this.dataBarcode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BarcodeGreenWidget(dataBarcode: dataBarcode),
    );
  }
}
