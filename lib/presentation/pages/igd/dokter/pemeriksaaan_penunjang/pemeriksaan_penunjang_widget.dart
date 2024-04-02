import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/header/tabbar_without_expanded_widget.dart';
import 'package:hms_app/presentation/pages/igd/dokter/pemeriksaaan_penunjang/peresepan_pasien/peresepan_manual_pasien_page_widget.dart';
import 'package:hms_app/presentation/pages/igd/dokter/pemeriksaaan_penunjang/peresepan_pasien/peresepan_pasien_widget.dart';

class PemeriksaanPenunjangIGDWidget extends StatelessWidget {
  const PemeriksaanPenunjangIGDWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabbarWithoutExpandexWidget(
      backgroundColor: ThemeColor.bgColor,
      menu: menu,
      children: menu.asMap().entries.map((e) {
        // JIKA PERESEPAN PASIEN
        if (e.value == menu.first) {
          return const PeresepanPasienWidget();
        }
        if (e.value == menu[1]) {
          return const PeresepanManualPasienPageWidget();
        }
        return Container();
      }).toList(),
    );
  }
}

List<String> menu = [
  "Peresepan Pasien",
  "Peresepan Manual Pasien",
  "Pemeriksaan Lainnya"
];
