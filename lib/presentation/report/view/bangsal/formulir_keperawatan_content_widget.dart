import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/report/report_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/component/resources/app_config.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/kebidanan/bloc/eary_warning_system/early_warning_system_bloc.dart';
import 'package:hms_app/presentation/kebidanan/report/view/report_cppt_methodist_page_widget.dart';
import 'package:hms_app/presentation/kebidanan/report/view/report_perkembangan_pasien_cppt_page_widget.dart';
import 'package:hms_app/presentation/kebidanan/report/view/view_report_pengkajian_awal_keperawatan_widget_page.dart';
import 'package:hms_app/presentation/perina/bloc/report_asesmen_bayi/report_asesmen_bayi_bloc.dart';
import 'package:hms_app/presentation/perina/pages/report/report_analisa_data_page_widget.dart';
import 'package:hms_app/presentation/perina/pages/report/report_asesmen_awal_nyeri_keperawatan.dart';
import 'package:hms_app/presentation/perina/pages/report/report_early_warning_system_ews_page_widget.dart';
import 'package:hms_app/presentation/perina/pages/report/view_control_istimewa_pasien_widget_page.dart';
import 'package:hms_app/presentation/perina/pages/report/view_report_icu_page.dart';
import 'package:hms_app/presentation/report/view/bangsal/report_pelaksanaan_keperawatan_dan_perkembangan_pasien_widget.dart';

class FormulirKeperawatanWidgetContent extends StatelessWidget {
  const FormulirKeperawatanWidgetContent({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return TabbarHeaderContentWidget(
        menu: menu,
        backgroundColor: ThemeColor.lightGreyColor2,
        onTap: (index) {
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
            context.read<EarlyWarningSystemBloc>().add(
                OnGetDataEarlyWarningSystem(noReg: singlePasien.first.noreg));
          }

          if (index == 0) {
            context.read<ReportBloc>().add(
                OnGetReportPengkajianAwalRawatInapDokter(
                    noRM: singlePasien.first.mrn,
                    noReg: singlePasien.first.noreg,
                    tanggal: DateTime.now().toString().substring(0, 10)));
          }
        },
        children: menu.asMap().entries.map((e) {
          if (e.value == "Formulir Pengkajian\nRawat Pasien Rawat Inap") {
            return const ViewReportPengkajianAwalKeperawatanPage();
          }

          if (e.value == "Formulir CPPT") {
            if (AppConstant.appSetup == AppSetup.methodist) {
              return const ReportCpttMethodistPageWidget();
            } else {
              return const ReportPerkembanganPasienCPTTPageWidget();
            }
          }

          if (e.value ==
              "Formulir Pelaksanaan\nKeperawatan & Perkembangan Pasien") {
            return const ReportPelaksanaanKeperawatanDanPerkembanganPasienWidgetPage();
          }

          if (e.key == 3) {
            return const ReportAnalisaDataPageWidget();
          }

          if (e.key == 4) {
            return const AsesmeAwalNyeriKeperawatanPage();
          }

          if (e.key == 5) {
            return const ReportEarlyWarningSystemPage();
          }

          if (e.key == 6) {
            return const ViewReportICUPage();
          }

          if (e.key == 7) {
            return const ReportKontrolIstimewaPasienWidgetPage();
          }

          return Container();
        }).toList());
  }
}

List<String> menu = [
  "Formulir Pengkajian\nRawat Pasien Rawat Inap",
  "Formulir Pelaksanaan\nKeperawatan & Perkembangan Pasien",
  "Formulir CPPT",
  "Analisa Data",
  "Asesmen Nyeri",
  "Early Warning System",
  "ICU",
  "Kontrol Istimewa"
];
