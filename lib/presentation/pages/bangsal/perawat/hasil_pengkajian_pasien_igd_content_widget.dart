import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/hasil_pengkajian_igd_content_widget.dart';

class HasilPengkajianPasienIGDContentWidget extends StatelessWidget {
  const HasilPengkajianPasienIGDContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabbarHeaderContentWidget(
        onTap: (index) {},
        menu: menuHasilPengkajian,
        children: menuHasilPengkajian.asMap().entries.map((e) {
          // ====== TAMPILKAN INFORMASI INDEX 1

          if (e.key == 1) {
            return const HasilPengkajianIGDContentWidget();
          }

          return Container();
        }).toList());
  }
}

// MENU ASESMEN AWAL PERAWAT IGD CONTENT WIDGET
List<String> menuHasilPengkajian = [
  "Dokter",
  "Perawat",
];
