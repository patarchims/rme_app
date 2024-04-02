import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/qr_code/qr_code_widget.dart';

class CustomQrWidget extends StatelessWidget {
  final double? dimension;
  final String dataBarcode;
  const CustomQrWidget({
    Key? key,
    this.dimension,
    required this.dataBarcode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Future<ui.Image> loadImage() async {
    //   final compiler = Completer<ui.Image>();
    //   final data =
    //       await rootBundle.load(SetApp.qrCodw(appSetup: AppConstant.appSetup));

    //   ui.decodeImageFromList(data.buffer.asUint8List(), compiler.complete);

    //   return compiler.future;
    // }

    // final qrCode = FutureBuilder(
    //     future: loadImage(),
    //     builder: (ctx, snapshot) {
    //       if (!snapshot.hasData) {
    //         return Container();
    //       }
    //       return CustomPaint(
    //         isComplex: true,
    //         size: const Size(200, 200),
    //         willChange: true,
    //         painter: QrPainter(
    //           data: dataBarcode,
    //           dataModuleStyle:
    //               const QrDataModuleStyle(color: ThemeColor.blackColor),
    //           version: QrVersions.auto,
    //           embeddedImage: snapshot.data,
    //           eyeStyle: const QrEyeStyle(
    //               color: ThemeColor.blackColor, eyeShape: QrEyeShape.square),
    //           embeddedImageStyle: const QrEmbeddedImageStyle(
    //             size: Size(30, 30),
    //           ),
    //           gapless: false,
    //         ),
    //       );
    //     });

    return SizedBox(
      child: BarcodeGreenWidget(dataBarcode: dataBarcode),
    );
  }
}
