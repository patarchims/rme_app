import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/report/report_bloc.dart' as rb;
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/pages/asesmen/menu_asesmen.dart';
import 'package:hms_app/presentation/pages/igd/bloc/triase_igd_dokter/triase_igd_dokter_bloc.dart';
import 'package:hms_app/presentation/report/bloc/asesmen_medis_igd_dokter/asesmen_medis_igd_dokter_bloc.dart';
import 'package:hms_app/presentation/report/bloc/report_igd/report_igd_bloc.dart';

import 'package:hms_app/presentation/report/igd/report_asesmen_awal_medis_content_widget.dart';
import 'package:hms_app/presentation/report/igd/ringkasan_pulang_content_widget.dart';
import 'package:hms_app/presentation/report/view/report_formulir_skrining_pasien_widget.dart';
import 'package:hms_app/presentation/report/view/report_formulir_triase_ponek_widget.dart';
import 'package:hms_app/presentation/report/view/report_formulir_triase_widget.dart';
import 'package:hms_app/presentation/report/view/report_ringkasan_masuk_dan_keluar_widget.dart';
import 'package:hms_app/presentation/widget/pengembangan_widget.dart';

class ReportFormulirIGDContentWidget extends StatelessWidget {
  const ReportFormulirIGDContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    AuthState authState = context.watch<AuthBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return TabbarHeaderContentWidget(
        backgroundColor: ThemeColor.lightGreyColor2,
        onTap: (index) {
          if (index == 0) {
            if (authState is Authenticated) {
              context.read<ReportAsesmenMedisIgdDokterBloc>().add(
                  OnGetReportAsesmenMedisDokterIgd(
                      noRM: singlePasien.first.mrn,
                      noReg: singlePasien.first.noreg,
                      tanggal: DateTime.now().toString().substring(0, 10),
                      person: toPerson(person: authState.user.person)));
            }
          }

          // TAMPILKAN REPORT TRIASE IGD
          if (index == 2) {
            if (authState is Authenticated) {
              if (authState.user.poliklinik == Poliklinik.igd) {
                context.read<TriaseIgdDokterBloc>().add(
                    OnGetReportTriaseIGDDokterEvent(
                        noReg: singlePasien.first.noreg,
                        noRM: singlePasien.first.mrn,
                        tanggal: DateTime.now().toString().substring(0, 10)));
              } else if (authState.user.poliklinik == Poliklinik.ponek) {
                context.read<TriaseIgdDokterBloc>().add(
                    OnGetReportTriasePonekEvent(
                        noReg: singlePasien.first.noreg,
                        noRM: singlePasien.first.mrn,
                        tanggal: DateTime.now().toString().substring(0, 10)));
              } else {
                context.read<TriaseIgdDokterBloc>().add(
                    OnGetReportTriaseIGDDokterEvent(
                        noReg: singlePasien.first.noreg,
                        noRM: singlePasien.first.mrn,
                        tanggal: DateTime.now().toString().substring(0, 10)));
              }
            }
          }

          if (index == 1) {
            context.read<rb.ReportBloc>().add(
                rb.OnGetReportRingkasanPulangEvent(
                    noRM: singlePasien.first.mrn,
                    noReg: singlePasien.first.noreg));
          }

          if (index == 6) {
            context.read<ReportIgdBloc>().add(OnGetRingkasanPulang(
                noReg: singlePasien.first.noreg, noRM: singlePasien.first.mrn));
          }
        },
        menu: menu,
        children: menu.asMap().entries.map((e) {
          if (e.value == "Asesmen\nAwal Medis") {
            return const ReportAsesmenAwalMedisContentWidget();
          }
          if (e.value == "Ringkasan Pulang") {
            return const RingkasanPulangContentWidget();
          }
          if (e.value == "Ringkasan Masuk\n& Keluar") {
            return const ReportRingkasanMasukDanKeluarContentWidget();
          }
          if (e.value == "Skrining Pasien") {
            return const ReportFormulirSkriningPasienWidget();
          }

          //====//
          if (e.value == "Triase") {
            // TRIASE IGD
            if (authState is Authenticated) {
              if (authState.user.poliklinik == Poliklinik.igd) {
                return const ReportFormulirTriaseWidget();
              }

              if (authState.user.poliklinik == Poliklinik.ponek) {
                return const ReportFormulirTriasePonekWidget();
              }

              return const ReportFormulirTriaseWidget();
            }
          }
          return const PengembanganWidget();
        }).toList());
  }
}

List<String> menu = [
  "Asesmen\nAwal Medis",
  "Ringkasan Pulang",
  "Triase",
  "Skrining Pasien",
  "Formulir Asesmen\nKeperawatan Dewasa IGD",
  "Formulir Catatan\nTransfer Pasien Antar Pulang",
  "Ringkasan Masuk\n& Keluar"
];
