import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:sizer/sizer.dart';

class AddImplementasiKeperawatanWidget extends StatelessWidget {
  const AddImplementasiKeperawatanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - 50.sp,
      width: Get.width - 50.sp,
      decoration: const BoxDecoration(color: Colors.white),
      child: const TabbarHeaderContentWidget(menu: [], children: []),
    );
  }
}

List<String> menu = [""];
