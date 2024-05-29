import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/report/report_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/header/tabbar_without_expanded_widget.dart';
import 'package:hms_app/presentation/kebidanan/report/view/pengkajian_awal_dokter_rawat_inap.dart';
import 'package:hms_app/presentation/kebidanan/report/view/report_formulir_double_check_high_alert.dart';
import 'package:hms_app/presentation/kebidanan/report/view/report_pengkajian_awal_anak_widget_page.dart';
import 'package:hms_app/presentation/kebidanan/report/view/report_pengkajian_awal_keperawatan_rawat_inap_widget_page.dart';

class ViewReportPengkajianAwalKeperawatanPage extends StatelessWidget {
  const ViewReportPengkajianAwalKeperawatanPage({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return TabbarWithoutExpandexWidget(
        backgroundColor: ThemeColor.bgColor,
        onTap: (index) {
          if (index == 0) {
            context.read<ReportBloc>().add(
                  OnGetReportPengkajianAwalRawatInapDokter(
                      noRM: singlePasien.first.mrn,
                      noReg: singlePasien.first.noreg,
                      tanggal: DateTime.now().toString().substring(0, 10)),
                );
          }

          if (index == 1) {
            context.read<ReportBloc>().add(
                OnGetReportPengkajianAwalRawatInapPerawat(
                    noRM: singlePasien.first.mrn,
                    noReg: singlePasien.first.noreg,
                    tanggal: DateTime.now().toString().substring(0, 10)));
          }
        },
        menu: menu,
        children: menu.asMap().entries.map((e) {
          if (e.key == 0) {
            return const ReportPengkajianAwalDokterRawatInap();
          }

          if (e.key == 1) {
            return const ReportPengkajianAwalKeperawatanRawatInapPage();
          }

          if (e.key == 2) {
            return const ReportPengkajianAwalAnakPageWidget();
          }

          if (e.key == 3) {
            return const ReportFormulirDoubleCheckHighAlertPage();
          }

          return Container();
        }).toList());
  }
}

List<String> menu = [
  "Dokter",
  "Perawat",
  "Anak",
  "Double Check",
];
