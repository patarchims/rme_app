import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/pages/icu/bloc/pemeriksaan_fisik_icu/pemeriksaan_fisik_icu_bloc.dart';
import 'package:hms_app/presentation/pages/icu/page/pemeriksaan_fisik/pemeriksaan_fisik_icu_page_widget.dart';
import 'package:hms_app/presentation/pages/icu/page/riwayat_keperawatan/riwayat_keperawatan_page_widget.dart';

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
          if (index == 0) {}

          if (index == 2) {
            if (authState is Authenticated) {
              context.read<PemeriksaanFisikIcuBloc>().add(
                  OnGetPemeriksaanFisikICU(
                      noReg: singlePasien.first.noreg,
                      person: toPerson(person: authState.user.person)));
            }
          }
        },
        children: menu.asMap().entries.map((e) {
          if (menu.first == e.value) {
            return const RiwayatKeperawatanPageWidget();
          }

          if (e.value == "Pemeriksaan Fisik") {
            return const PemeriksaanFisikIcuPageWidget();
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
