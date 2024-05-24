import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/pages/icu/bloc/report_icu/report_icu_bloc.dart';
import 'package:hms_app/presentation/pages/icu/report/asesmen_ulang_perawatan_intensive_report_page_widget.dart';
import 'package:hms_app/presentation/pages/icu/report/report_kartu_cairan_page_widget.dart';
import 'package:hms_app/presentation/pages/icu/report/report_kartu_observasi_page_widget.dart';

class ViewReportICUPage extends StatelessWidget {
  const ViewReportICUPage({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    AuthState authState = context.watch<AuthBloc>().state;

    return TabbarHeaderContentWidget(
      backgroundColor: ThemeColor.bgColor,
      menu: menu,
      onTap: (index) {
        if (index == 0) {
          if (authState is Authenticated) {
            context.read<ReportIcuBloc>().add(OnGetReportAsesmenUlangIntensive(
                noReg: singlePasien.first.noreg,
                noRM: singlePasien.first.mrn,
                tanggal: DateTime.now().toString().substring(0, 10),
                person: toPerson(person: authState.user.person)));
          }
        }

        if (index == 2) {
          if (authState is Authenticated) {
            context.read<ReportIcuBloc>().add(
                OnGetReportKartuObservasi(noReg: singlePasien.first.noreg));
          }
        }

        if (index == 1) {
          if (authState is Authenticated) {
            context
                .read<ReportIcuBloc>()
                .add(OnGetReportKartuCairan(noReg: singlePasien.first.noreg));
          }
        }
      },
      children: menu.asMap().entries.map((e) {
        if (e.key == 0) {
          return const ReportAsesmenUlangPerawatIntensivePageWidget();
        }

        if (e.key == 1) {
          return const ReportKartuCairanPageWidget();
        }

        if (e.key == 2) {
          return const ReportKartuObservasiPageWidget();
        }

        return Container();
      }).toList(),
    );
  }
}

List<String> menu = [
  "Asesmen Ulang\nPerawatan Intensive",
  "KARTU CAIRAN",
  "KARTU OBSERVASI"
];
