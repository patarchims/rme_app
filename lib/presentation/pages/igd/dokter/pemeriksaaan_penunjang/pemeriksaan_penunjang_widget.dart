import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/header/tabbar_without_expanded_widget.dart';
import 'package:hms_app/presentation/pages/igd/dokter/cari_labor_widget.dart';
import 'package:hms_app/presentation/pages/igd/dokter/pemeriksaaan_penunjang/pemeriksaan_lainnya/pemeriksaan_lainnya_content_widget.dart';
import 'package:hms_app/presentation/pages/igd/dokter/pemeriksaaan_penunjang/peresepan_pasien/peresepan_manual_pasien_page_widget.dart';
import 'package:hms_app/presentation/pages/igd/dokter/pemeriksaaan_penunjang/peresepan_pasien/peresepan_pasien_widget.dart';
import 'package:hms_app/presentation/pages/igd/widget/cari_labor_widget.dart';
import 'package:hms_app/presentation/pages/igd/widget/labor_content_widget.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/riwayat_pasien/widget/riwayat_labor_widget.dart';

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

        if (e.value == menu[2]) {
          return const PemeriksaanLainnyaContentWidget();
          // return CariLaborWidget();
          // return const RiwayatLaborWidget(
          //   tanggal: "2024-12-22",
          // );
          // return const CariPenmedLaborWidget();
          // return const CariLaborWidget();
          // return const LaborContentWidget();
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
