// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/resources/app_config.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sizer/sizer.dart';

import 'package:hms_app/presentation/component/resources/app_constant.dart';

class BarcodeGreenWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final String dataBarcode;

  const BarcodeGreenWidget({
    super.key,
    this.height,
    this.width,
    required this.dataBarcode,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height ?? 55.sp,
        width: width ?? 100.sp,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                  height: 55.sp,
                  child: QrImageView(
                    data: dataBarcode,
                    backgroundColor: Colors.white,
                  )),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                SetApp.qrCodw(appSetup: AppConstant.appSetup),
                height: 10.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
