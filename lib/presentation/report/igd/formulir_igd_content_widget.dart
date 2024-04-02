import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/report/report_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/kebidanan/report/view/report_perkembangan_pasien_cppt_page_widget.dart';
import 'package:hms_app/presentation/pages/igd/bloc/triase_igd_dokter/triase_igd_dokter_bloc.dart';
import 'package:hms_app/presentation/report/bloc/asesmen_medis_igd_dokter/asesmen_medis_igd_dokter_bloc.dart';
import 'package:hms_app/presentation/report/igd/report_asesmen_awal_medis_content_widget.dart';
import 'package:hms_app/presentation/report/view/report_formulir_triase_widget.dart';
import 'package:hms_app/presentation/widget/pengembangan_widget.dart';

class FormulirIGDContentWidget extends StatelessWidget {
  const FormulirIGDContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    AuthState authState = context.watch<AuthBloc>().state;

    return TabbarHeaderContentWidget(
      backgroundColor: ThemeColor.bgColor,
      onTap: (index) {
        if (index == 0) {
          context.read<TriaseIgdDokterBloc>().add(
              OnGetReportTriaseIGDDokterEvent(
                  noReg: singlePasien.first.noreg,
                  noRM: singlePasien.first.mrn,
                  tanggal: DateTime.now().toString().substring(0, 10)));
        }

        if (index == 3) {
          context
              .read<ReportBloc>()
              .add(OnGetReportCPPTPasienEvent(noRM: singlePasien.first.mrn));
        }

        if (index == 1) {
          if (authState is Authenticated) {
            context.read<ReportAsesmenMedisIgdDokterBloc>().add(
                OnGetReportAsesmenMedisDokterIgd(
                    noRM: singlePasien.first.mrn,
                    noReg: singlePasien.first.noreg,
                    tanggal: DateTime.now().toString().substring(0, 10),
                    person: toPerson(person: authState.user.person)));
          }
        }

        // ====== //
        if (index == 2) {
          if (authState is Authenticated) {
            context.read<ReportAsesmenMedisIgdDokterBloc>().add(
                OnGetReportAsesmenMedisDokterIgd(
                    noRM: singlePasien.first.mrn,
                    noReg: singlePasien.first.noreg,
                    tanggal: DateTime.now().toString().substring(0, 10),
                    person: toPerson(person: authState.user.person)));
          }
        }
      },
      menu: menu,
      children: menu.asMap().entries.map((e) {
        if (e.key == 0) {
          return const ReportFormulirTriaseWidget();
        }

        if (e.key == 1) {
          return const ReportAsesmenAwalMedisContentWidget();
        }

        if (e.key == 2) {
          return const PengembanganWidget();
        }

        if (e.key == 3) {
          return const ReportPerkembanganPasienCPTTPageWidget();
        }

        return Container();
      }).toList(),
    );
  }
}

List<String> menu = [
  "Triase",
  "Asesmen Awal Medis",
  "Asesmen Keperawatan",
  "CPPT"
];
