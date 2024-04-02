import 'package:flutter/material.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/report/bloc/pengkajian_awal_kebidanan_report/pengkajian_kebidanan_awal_kebidanan_bloc.dart';
import 'package:hms_app/presentation/report/view/bangsal/report_pengkajian_awal_kebidanan_widget.dart';
import 'package:provider/provider.dart';

class ReportKebidananContentWidget extends StatelessWidget {
  const ReportKebidananContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    AuthState authState = context.watch<AuthBloc>().state;

    return TabbarHeaderContentWidget(
        menu: menu,
        backgroundColor: ThemeColor.lightGreyColor2,
        onTap: (index) {
          if (index == 2) {
            // context
            //     .read<ReportBloc>()
            //     .add(OnGetReportCPPTPasienEvent(noRM: singlePasien.first.mrn));
          }
          if (index == 1) {
            // context.read<ReportBloc>().add(
            //     OnGetReportPerkembanganPerkembanganPasien(
            //         noRM: singlePasien.first.mrn));
          }
          if (index == 0) {
            if (authState is Authenticated) {
              context.read<ReportPengkajianKebidananAwalKebidananBloc>().add(
                  OnGetPengkajianEvent(
                      noRM: singlePasien.first.mrn,
                      noReg: singlePasien.first.noreg,
                      person: toPerson(person: authState.user.person)));
            }
          }
        },
        children: menu.asMap().entries.map((e) {
          if (e.key == 0) {
            return const ReportPengkajianAwalKebidananWidget();
          }
          if (e.value ==
              "Formulir Pengkajian\nRawat Pasien Dewasa Rawat Inap") {}
          if (e.value == "Formulir CPPT") {}

          if (e.value ==
              "Formulir Pelaksanaan\nKeperawatan & Perkembangan Pasien") {}
          return Container();
        }).toList());
  }
}

List<String> menu = ["Pengkajian Awal\nKebidanan", "Laporan Persalinan"];
