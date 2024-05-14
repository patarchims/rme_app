import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/asesmen_intensive/asesmen_intensive_bloc.dart';
import 'package:hms_app/presentation/pages/icu/bloc/pemeriksaan_fisik_icu/pemeriksaan_fisik_icu_bloc.dart';
import 'package:hms_app/presentation/pages/icu/bloc/vital_sign_icu/vital_sign_icu_bloc.dart';
import 'package:hms_app/presentation/pages/icu/page/asesmen/riwayat_keperawatan_widget_page.dart';
import 'package:hms_app/presentation/pages/icu/page/pemeriksaan_fisik/pemeriksaan_fisik_icu_page_widget.dart';
import 'package:hms_app/presentation/pages/icu/page/pengkajian_persistem/pengkajian_persistem_icu_widget_page.dart';
import 'package:hms_app/presentation/pages/icu/page/vital_sign/vital_sign_page_widget.dart';

class AsesmenIntensivePageWidget extends StatelessWidget {
  const AsesmenIntensivePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return TabbarHeaderContentWidget(
        backgroundColor: ThemeColor.bgColor,
        menu: menu,
        onTap: (index) {
          if (index == 0) {
            // ON GET RIWAYAT KEPERAWATAN
            if (authState is Authenticated) {
              context.read<AsesmenIntensiveBloc>().add(
                  OnGetRiwayatKeperawatanIntensive(
                      noReg: singlePasien.first.noreg,
                      person: toPerson(person: authState.user.person),
                      noRM: singlePasien.first.mrn));
            }
          }
          if (index == 1) {
            // ========//
            if (authState is Authenticated) {
              context.read<VitalSignIcuBloc>().add(OnGetVitalSignEvent(
                  noReg: singlePasien.first.noreg,
                  person: toPerson(person: authState.user.person),
                  pelayanan:
                      toPelayanan(poliklinik: authState.user.poliklinik)));
            }
          }

          if (index == 2) {
            if (authState is Authenticated) {
              context.read<PemeriksaanFisikIcuBloc>().add(
                  OnGetPemeriksaanFisikICU(
                      noReg: singlePasien.first.noreg,
                      person: toPerson(person: authState.user.person)));
            }
          }

          if (index == 3) {
            if (authState is Authenticated) {
              context.read<PemeriksaanFisikIcuBloc>().add(
                  OnGetPengkajianPersistemICU(
                      noRM: singlePasien.first.mrn,
                      tanggal: DateTime.now().toString().substring(0, 10),
                      noReg: singlePasien.first.noreg,
                      person: toPerson(person: authState.user.person)));
            }
          }

          //===//
        },
        children: menu.asMap().entries.map((e) {
          if (menu.first == e.value) {
            // return const RiwayatKeperawatanIntensivePageWidget();
            return const RiwayatKeperawatanIntensiveWidgetPage();
          }

          if (e.value == "Pemeriksaan Fisik") {
            return const PemeriksaanFisikIcuPageWidget();
          }

          if (e.value == "Vital Sign") {
            return const VitalSignPageWidget();
          }

          // ====== PENGKAJIAN PERSISTEM
          if (e.value == menu.last) {
            return const PengkajianPersistemWidgetPage();
          }

          return Container();
        }).toList());
  }
}

List<String> menu = [
  "Riwayat Keperawatan",
  "Vital Sign",
  "Pemeriksaan Fisik",
  "Pengkajian Persistem",
];
