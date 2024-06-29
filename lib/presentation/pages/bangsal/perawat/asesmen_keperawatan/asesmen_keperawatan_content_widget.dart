import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/header/tabbar_without_expanded_widget.dart';
import 'package:hms_app/presentation/component/resources/app_config.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/kebidanan/bloc/kebidanan/kebidanan_bloc.dart';
import 'package:hms_app/presentation/kebidanan/bloc/pengkajian_nutrisi/pengkajian_nutrisi_bloc.dart';
import 'package:hms_app/presentation/kebidanan/bloc/resiko_jatuh_kebidanan/resiko_jatuh_kebidanan_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/asesmen_nyeri/asesmen_nyeri_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/pengkajian_persistem_keperawatan/pengkajian_persistem_keperawatan_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/pengkajian_fungsional_keperawatan/asesemen_nyeri_keperawatan_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/pengkajian_fungsional_keperawatan/fungsional_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/pengkajian_nutrisi_keperawatan/pengkajian__keperawtan_nutrisi_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/pengkajian_persistem_keperawatan/pengkajian_persistem_page_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/resiko_jatuh/resiko_jatuh_keperawatan_widget.dart';
import 'package:hms_app/presentation/pages/igd/bloc/pemeriksaan_fisik_igd/pemeriksaan_fisik_igd_bloc.dart';
import 'package:hms_app/presentation/pages/igd/dokter/pemeriksaan_fisik/pemeriksaan_fisik_igd_dokter_methodis_widget.dart';

class AsesmenKeperawatanWidget extends StatelessWidget {
  const AsesmenKeperawatanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    AuthState authState = context.watch<AuthBloc>().state;

    return TabbarWithoutExpandexWidget(
        backgroundColor: ThemeColor.bgColor,
        onTap: (index) {
          // ====== //
          if (index == 0) {
            context
                .read<PengkajianNutrisiBloc>()
                .add(OnGetPengkajianNutrisi(noReg: singlePasien.first.noreg));
          }

          // ====== //
          if (index == 2) {
            context.read<ResikoJatuhKebidananBloc>().add(
                OnGetResikoJatuhKebidanan(noReg: singlePasien.first.noreg));
          }

          // ====== //
          if (index == 1) {
            if (authState is Authenticated) {
              context.read<PengkajianPersistemKeperawatanBloc>().add(
                  OnGetPengkajianPersistem(
                      noReg: singlePasien.first.noreg,
                      noRM: singlePasien.first.mrn,
                      person: toPerson(person: authState.user.person)));
            }
          }

          if (index == 3) {
            context.read<KebidananBloc>().add(
                OnGetPengkajianFungsionalKebidanan(
                    noReg: singlePasien.first.noreg));
          }

          // ====== //
          if (index == 4) {
            if (authState is Authenticated) {
              if (AppConstant.appSetup == AppSetup.methodist ||
                  AppConstant.appSetup == AppSetup.rsTiara) {
                context.read<PemeriksaanFisikIgdBloc>().add(
                    OnGetPemeriksaanFisikMethodist(
                        noReg: singlePasien.first.noreg,
                        person: toPerson(person: authState.user.person)));
              } else if (AppConstant.appSetup == AppSetup.batuRaja) {
                context.read<PemeriksaanFisikIgdBloc>().add(
                    OnGetPemeriksaanFisikAntonio(
                        noReg: singlePasien.first.noreg,
                        person: toPerson(person: authState.user.person)));
              } else {
                context.read<PemeriksaanFisikIgdBloc>().add(
                    OnGetPemeriksaanFisikBangsalEvent(
                        person: toPerson(person: authState.user.person),
                        noReg: singlePasien.first.noreg));
              }
            }
          }

          // ====== //
          if (index == 5) {
            context
                .read<AsesmenNyeriBloc>()
                .add(OnGetAsesemenNyeri(noReg: singlePasien.first.noreg));
          }

          // ====== //
        },
        menu: menu,
        children: menu.asMap().entries.map((e) {
          if (e.value == "Pengkajian Nutrisi") {
            return const AsesmenPengkajianNutrisiKeperawatanWidget();
          }

          if (e.value == "Pengkajian Persistem") {
            return const PengkajianPersistemKeperawatanPageWidget();
          }

          if (e.value == "Resiko Jatuh") {
            return const ResikoJatuKeperawatanWidget();
          }

          if (e.value == "Pengkajian Fungsional") {
            return const PengkajianFungsionalKeperawatanWidget();
          }
          if (e.value == "Pemeriksaan\nFisik") {
            return const PemeriksaanFisikIGDDokterMethodistWidgetPage();
          }

          if (e.key == 5) {
            return const AsesmenAwalNyeriKeperawatanWidgetPage();
          }

          return Container();
        }).toList());
  }
}

List<String> menu = [
  "Pengkajian Nutrisi",
  "Pengkajian Persistem",
  "Resiko Jatuh",
  "Pengkajian Fungsional",
  "Pemeriksaan\nFisik",
  "Nyeri"
];
