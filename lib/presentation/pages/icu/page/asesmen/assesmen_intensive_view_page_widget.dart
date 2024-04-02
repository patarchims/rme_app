import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/pages/icu/page/pemeriksaan_fisik/pemeriksaan_fisik_icu_page_widget.dart';
import 'package:hms_app/presentation/pages/icu/page/riwayat_keperawatan/riwayat_keperawatan_page_widget.dart';

class AsesmenIntensivePageWidget extends StatelessWidget {
  const AsesmenIntensivePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabbarHeaderContentWidget(
        backgroundColor: ThemeColor.bgColor,
        menu: menu,
        children: menu.asMap().entries.map((e) {
          if (menu.first == e.value) {
            return const RiwayatKeperawatanPageWidget();
          }

          if (e.value == "Pemeriksaan Fisik") {
            return const PemeriksaanFisikIcuPageWidget();
          }
          return Container();
        }).toList());
  }
}

List<String> menu = [
  "Riwayat Keperawatan",
  "Vital Sign",
  "Pemeriksaan Fisik",
  "Pengkajian Persistem",
];
