import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/report/report_bloc.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/header/tabbar_without_expanded_widget.dart';
import 'package:hms_app/presentation/kebidanan/report/view/report_catatan_keperawatan_page_widget.dart';
import 'package:hms_app/presentation/kebidanan/report/view/report_perkembangan_pasien_cppt_page_widget.dart';

class ReportCpttMethodistPageWidget extends StatelessWidget {
  const ReportCpttMethodistPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    return TabbarWithoutExpandexWidget(
        backgroundColor: ThemeColor.bgColor,
        onTap: (index) {
          if (index == 1) {}

          if (index == 0) {
            context
                .read<ReportBloc>()
                .add(OnGetReportCPPTPasienEvent(noRM: singlePasien.first.mrn));
          }
        },
        menu: menu,
        children: menu.map((e) {
          if (e == "Catatan Keperawatan") {
            return const ReportCatatanKeperawatanPageWidget();
          } else {
            return const ReportPerkembanganPasienCPTTPageWidget();
          }
        }).toList());
  }
}

List<String> menu = ["Catatan Keperawatan", "CPPT"];
