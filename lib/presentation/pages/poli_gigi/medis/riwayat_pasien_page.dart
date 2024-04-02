import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/riwayat_pasien/riwayat_pasien_tablel_widget.dart';

class RiwayatPasienPage extends StatelessWidget {
  const RiwayatPasienPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.bgColor,
      appBar: AppBar(
        backgroundColor: ThemeColor.primaryColor,
        title: const Text("Riwayat Pasien"),
      ),
      body: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF1060AE),
              Color(0xFF8FA8BD),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: const RiwayatPasienTabelWidget()),
    );
  }
}
