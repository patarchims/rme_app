import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/pengkajian_awal_keperawatan/pengkajian_awal_keperawatan_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/pengkajian_fisik_anak/pengkajian_fisik_anak_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/pengkajian_anak/keluhan_utama_anak_widget_page.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/pengkajian_anak/pengkajian_persistem_anak_page_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/pengkajian_anak/vital_sign_anak_page_widget.dart';
import 'package:hms_app/presentation/pages/igd/bloc/tanda_vital_igd_dokter/tanda_vital_igd_dokter_bloc.dart';

class PengkajianAwalAnakRawatInapPageWidget extends StatelessWidget {
  const PengkajianAwalAnakRawatInapPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return TabbarHeaderContentWidget(
        backgroundColor: ThemeColor.bgColor,
        onTap: (index) {
          if (index == 1) {
            if (authState is Authenticated) {
              context.read<TandaVitalIgdDokterBloc>().add(
                  OnGetTandaVitalIGDAnak(
                      noReg: singlePasien.first.noreg,
                      person: toPerson(person: authState.user.person),
                      pelayanan:
                          toPelayanan(poliklinik: authState.user.poliklinik)));
            }
          }

          if (index == 2) {
            if (authState is Authenticated) {
              context.read<PengkajianFisikAnakBloc>().add(
                  OnGetPengkajianFisikAnakEvent(
                      noReg: singlePasien.first.noreg,
                      person: toPerson(person: authState.user.person)));
            }
          }

          if (index == 0) {
            //  GET DATA //
            if (authState is Authenticated) {
              context.read<PengkajianAwalKeperawatanBloc>().add(
                  OnGetAsesmenAnakEvent(
                      noReg: singlePasien.first.noreg,
                      noRM: singlePasien.first.mrn,
                      person: "Anak",
                      tanggal: DateTime.now().toString().substring(0, 10)));
            }
          }
        },
        menu: menu,
        children: menu.asMap().entries.map((e) {
          if (e.key == 0) {
            return const KeluhanUtamaAnakWidgetPage();
          }

          if (e.key == 2) {
            return const PengkajianPersistemAnakPageWidget();
          }

          if (e.key == 1) {
            return const VitalSignAnakPageWidget(isENableAdd: true);
          }
          return Container();
        }).toList());
  }
}

List<String> menu = [
  "Keluhan Utama",
  "Vital Sign",
  "Asesmen",
];
