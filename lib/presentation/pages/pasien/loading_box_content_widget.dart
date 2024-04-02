import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/shimer/shimer_loading.dart';

class LoadingBoxContentWidget extends StatelessWidget {
  const LoadingBoxContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: ShimerLoading.loadingExpandCard(),
      ),
    );
  }
}
