// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/pages/poli_dalam/asesmen_medis_keperawatan/asesmen_risiko_jatuh_widget.dart';
import 'package:hms_app/presentation/pages/poli_dalam/asesmen_medis_keperawatan/riwayat_dan_tanda_vital/riwayat_dan_tanda_vital_content.dart';
import 'package:hms_app/presentation/pages/poli_dalam/asesmen_medis_keperawatan/skala_flack_widget.dart';
import 'package:hms_app/presentation/pages/poli_dalam/asesmen_medis_keperawatan/skala_nyeri_widget.dart';
import 'package:hms_app/presentation/pages/poli_dalam/asesmen_medis_keperawatan/skrining_geriatri_widget_content.dart';

class AsesmenMedisKeperawatanWidgetContent extends StatelessWidget {
  final List<String> menu;
  const AsesmenMedisKeperawatanWidgetContent({
    super.key,
    required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: DefaultTabController(
      length: menu.length, // Added
      initialIndex: 0, //A
      child: Scaffold(
        backgroundColor: ThemeColor.bgColor,
        appBar: AppBar(
          backgroundColor: Colors.blue.withOpacity(0.5),
          foregroundColor: Colors.black,
          surfaceTintColor: Colors.black,
          flexibleSpace: SafeArea(
              child: TabBar(
            labelColor: ThemeColor.primaryColor,
            unselectedLabelColor: Colors.black,
            dividerColor: Colors.white,
            indicatorColor: ThemeColor.primaryColor,
            onTap: (index) {
              // =====================
            },
            tabs: menu
                .map(
                  (e) => Tab(
                    text: e,
                  ),
                )
                .toList(),
          )),
          leading: null,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: TabBarView(
            children: menu.map((e) {
          //========================
          if (e == menu[0]) {
            return const RiwayatDanTandaVitalContent();
          }

          if (e == menu[1]) {
            return const AsesmenRisikoJatuhWidget();
          }

          if (e == menu[3]) {
            return const SkriningGeriatriWidgetContent();
          }

          if (e == menu[2]) {
            // SKALA NYERI
            return const SkalaNyeriWidget();
          }

          if (e == menu[4]) {
            return const SkalaFlakWidgetContent();
          }

          return Container();
        }).toList()),
      ),
    ));
  }
}
