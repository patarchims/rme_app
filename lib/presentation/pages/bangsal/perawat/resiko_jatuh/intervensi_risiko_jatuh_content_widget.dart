import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_with_alert_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/resiko_jatuh/assesmen_resiko_jatuh_pada_anak_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/resiko_jatuh/intervensi_risiko_jatuh_pasien_dewasa_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/resiko_jatuh/re_assesmen_resiko_jatuh_pada_anak_content_widget%20.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/resiko_jatuh/reasesmen_resiko_jatuh_dewasa_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/resiko_jatuh/reassesmen_resiko_jatuh_pada_pasien_dewasa.dart';

class IntervensiRisikoJatuhContentWidget extends StatelessWidget {
  const IntervensiRisikoJatuhContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabbarWithAlertContentWidget(
        menu: menuBangsalPerawat,
        onTap: (index) {
          // TAMPILKAN ANAMNESA
          if (index == 0) {
            log("CARI INTERVENSI RESIKO JATUH PASIEN DEWASA");
          }
          if (index == 1) {
            log("EXECUTE DATA ");
          }
        },
        children: menuBangsalPerawat.asMap().entries.map((e) {
          if (e.key == 0) {
            return const IntervensiRisikoJaatuhPasienDewasaContentWidget();
          }

          if (e.key == 1) {
            return const ReAsessmentResikoJatuhContentWidget();
          }

          if (e.key == 2) {
            return const ReAsessmenResikoJatuhPadaPasienDewasa();
          }

          if (e.key == 3) {
            return const AsesmenResikoJatuhPadaAnak();
          }

          if (e.key == 4) {
            return const ReAsesmenResikoJatuhPadaAnak();
            // return const ReasesmenResikoJatuhAnakPageWidget();
          }

          return SizedBox(
            child: Text(e.value.toString(), style: blackTextStyle),
          );
        }).toList());
  }
}

// MENU ASESMEN AWAL BANGSAL
// CONTENT WIDGET FOR PERAWAT
List<String> menuBangsalPerawat = [
  "Intervensi Risiko\nJatuh Pasien",
  "Re Assesmen Resiko\nJatuh Dewasa ( Skala Jatuh Morse)",
  "Re-Assesmen Resiko\nJatuh Pada Pasien Dewasa",
  "Assesmen Pasien\nResiko Jatuh Pada Anak",
  "Re-Assesmen\nResiko Jatuh Pada Anak"
];
