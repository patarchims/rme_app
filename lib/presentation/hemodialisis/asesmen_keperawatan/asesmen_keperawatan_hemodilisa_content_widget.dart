import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/hemodialisis/asesmen_keperawatan/asesmen_hd_content_widget.dart';

class AsesmenKeperawatanHemodialisaContentWidget extends StatelessWidget {
  const AsesmenKeperawatanHemodialisaContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabbarHeaderContentWidget(
      menu: menuAsessmen,
      onTap: (index) {},
      children: menuAsessmen.asMap().entries.map((e) {
        if (e.key == 0) {
          return const AsesmenHDContentWidgetPage();
        }

        return Container();
      }).toList(),
    );
  }
}

List<String> menuAsessmen = [
  "Asesmen",
  "Pemeriksaan Fisik",
  "Resiko Jatuh",
  "Gizi",
  "Riwayat Psikososial",
];
