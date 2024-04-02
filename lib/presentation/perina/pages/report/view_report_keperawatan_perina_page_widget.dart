import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/report/report_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/kebidanan/bloc/eary_warning_system/early_warning_system_bloc.dart';
import 'package:hms_app/presentation/kebidanan/bloc/identitas_bayi/indentias_bayi_bloc.dart';
import 'package:hms_app/presentation/kebidanan/report/view/report_perkembangan_pasien_cppt_page_widget.dart';
import 'package:hms_app/presentation/perina/bloc/asesmen_bayi/asesmen_bayi_bloc.dart';
import 'package:hms_app/presentation/perina/bloc/report_asesmen_bayi/report_asesmen_bayi_bloc.dart';
import 'package:hms_app/presentation/perina/pages/report/report_analisa_data_page_widget.dart';
import 'package:hms_app/presentation/perina/pages/report/report_asesmen_keperawatan_bayi_baru_lahir_page_widget.dart';
import 'package:hms_app/presentation/perina/pages/report/report_early_warning_system_ews_page_widget.dart';
import 'package:hms_app/presentation/perina/pages/report/report_identitas_bayi_page_widget.dart';
import 'package:hms_app/presentation/perina/pages/report/report_resume_medis_perinatologi_page_widet.dart';
import 'package:hms_app/presentation/report/view/bangsal/report_pelaksanaan_keperawatan_dan_perkembangan_pasien_widget.dart';

class ReportViewKeperawatanPerinaPageWidget extends StatelessWidget {
  const ReportViewKeperawatanPerinaPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    // AuthState authState = context.watch<AuthBloc>().state;

    return TabbarHeaderContentWidget(
        backgroundColor: ThemeColor.bgColor,
        menu: menu,
        onTap: (index) {
          if (index == 0) {
            context.read<AsesmenBayiBloc>().add(
                OnGetReportAsesmenAwalKeperawatanBayi(
                    noReg: singlePasien.first.noreg,
                    noRM: singlePasien.first.mrn));
          }
          if (index == 2) {
            context
                .read<ReportBloc>()
                .add(OnGetReportCPPTPasienEvent(noRM: singlePasien.first.mrn));
          }
          if (index == 1) {
            context.read<ReportBloc>().add(
                OnGetReportPerkembanganPerkembanganPasien(
                    noRM: singlePasien.first.mrn));
          }
          if (index == 3) {
            context
                .read<ReportAsesmenBayiBloc>()
                .add(OnGetReportAnalisaData(noReg: singlePasien.first.noreg));
          }
          if (index == 5) {
            context.read<IndentiasBayiBloc>().add(OnGetIdentitasBayi(
                noReg: singlePasien.first.noreg, noRM: singlePasien.first.mrn));
          }
          if (index == 4) {
            context.read<ReportAsesmenBayiBloc>().add(
                OnGetReportResumeMedisPerinatologi(
                    noReg: singlePasien.first.noreg,
                    noRM: singlePasien.first.mrn));
          }
          if (index == 7) {
            context.read<EarlyWarningSystemBloc>().add(
                OnGetDataEarlyWarningSystem(noReg: singlePasien.first.noreg));
          }
        },
        children: menu.asMap().entries.map((e) {
          if (e.key == 0) {
            return const ReportAsesmenKeperawatanBayiBaruLahirPage();
          }
          if (e.key == 1) {
            return const ReportPelaksanaanKeperawatanDanPerkembanganPasienWidgetPage();
          }
          if (e.key == 2) {
            return const ReportPerkembanganPasienCPTTPageWidget();
          }
          if (e.key == 3) {
            return const ReportAnalisaDataPageWidget();
          }
          if (e.key == 4) {
            return const ResumePerinatologiPageWidget();
          }
          if (e.key == 5) {
            return const ReportIdentitasBayiPageWidget();
          }
          if (e.key == 6) {
            return const ReportEarlyWarningSystemPage();
          }
          if (e.key == 7) {
            return const ReportEarlyWarningSystemPage();
          }
          return Container();
        }).toList());
  }
}

List<String> menu = [
  "Asesmen Awal\nKeperawatan Bayi",
  "Formulir Pelaksanaan\nKeperawatan & Perkembangan Pasien",
  "CPPT",
  "Analisa Data",
  "Resum Medis\nPerinatologi",
  "Surat Identitas Bayi",
  "Edukasi Terintegrasi",
  "Early Warning Syste (EWS)"
];
