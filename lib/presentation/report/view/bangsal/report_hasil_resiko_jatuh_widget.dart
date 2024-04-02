import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/report/bloc/resiko_jatuh/resiko_jatuh_bloc.dart';
import 'package:hms_app/presentation/report/view/resiko_jatuh/report_intervensi_resiko_jatuh_widget.dart';
import 'package:hms_app/presentation/report/view/resiko_jatuh/report_reasesmen_risiko_jatuh_pada_pasien_dewasa_report_widget.dart';
import 'package:hms_app/presentation/report/view/resiko_jatuh/report_reasesmen_risiko_jatuh_pasien_dewasa_content_widget.dart';
import 'package:hms_app/presentation/report/view/resiko_jatuh/report_resiko_jatuh_anak_widget.dart';

class ReportHasilResikoJatuhWidget extends StatelessWidget {
  const ReportHasilResikoJatuhWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return TabbarHeaderContentWidget(
        backgroundColor: ThemeColor.lightGreyColor2,
        menu: menu,
        onTap: (index) {
          // indexs
          if (index == 0) {
            context.read<ResikoJatuhReportBloc>().add(
                OnGetReportResikoJatuhMorseEvent(
                    noreg: singlePasien.first.noreg));
          }

          // GET DATA
          if (index == 1) {
            context.read<ResikoJatuhReportBloc>().add(
                OnGetIntervensiResikoJatuhEvent(
                    noReg: singlePasien.first.noreg,
                    noRM: singlePasien.first.mrn));
          }

          if (index == 2) {
            context.read<ResikoJatuhReportBloc>().add(
                OnGetRisikoJatuhDewasaEvent(noReg: singlePasien.first.noreg));
          }

          if (index == 3) {
            context.read<ResikoJatuhReportBloc>().add(
                OnGetResikoJatuhAnakEvent(noReg: singlePasien.first.noreg));
          }
        },
        children: menu.asMap().entries.map((e) {
          if (e.value ==
              "Re Assesmen Resiko\nJatuh Dewasa ( Skala Jatuh Morse )") {
            return const ReportReAsesmenResikoJatuhPasienDewasaContentWidget();
          }

          if (e.value == "Intervensi Risiko\nJatuh Pasien") {
            return const ReportIntervensiResikoJatuhWidget();
          }

          if (e.value == "Re-Assesmen Resiko\nJatuh Pada Pasien Dewasa") {
            return const ReAsesmenRisikoJatuhPadaPasienDewasaWidget();
          }

          if (e.value == "Assesmen Pasien\nResiko Jatuh Pada Anak") {
            return const ReportResikoJatuhAnakWidget();
          }

          return const Text("data");
        }).toList());
  }
}

// CONTENT WIDGET FOR PERAWAT
List<String> menu = [
  "Re Assesmen Resiko\nJatuh Dewasa ( Skala Jatuh Morse )",
  "Intervensi Risiko\nJatuh Pasien",
  "Re-Assesmen Resiko\nJatuh Pada Pasien Dewasa",
  "Assesmen Pasien\nResiko Jatuh Pada Anak",
];
