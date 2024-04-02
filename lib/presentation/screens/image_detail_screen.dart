import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/image/chace_image.dart';

class ImageDetailWidget extends StatelessWidget {
  const ImageDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final images = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: ThemeColor.blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(color: Colors.white),
      ),
      body: Center(
        child: InteractiveViewer(
          constrained: true,
          scaleEnabled: true,
          child: ChaceImage(
              imageUrl: images.toString(),
              height: Get.height / 2,
              width: Get.width),
        ),
      ),
    );
  }
}
