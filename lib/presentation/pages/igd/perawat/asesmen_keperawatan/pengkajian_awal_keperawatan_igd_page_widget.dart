import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_igd/asesmen_igd_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/triase/triase_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/header/tabbar_without_expanded_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/cppt_sbar_bangsal/cppt_sbar_bangsal_bloc.dart';
import 'package:hms_app/presentation/pages/igd/bloc/asesmen_igd/asesmen_igd_bloc.dart';
import 'package:hms_app/presentation/pages/igd/bloc/resiko_jatuh_getup/resiko_jatuh_getup_bloc.dart';
import 'package:hms_app/presentation/pages/igd/perawat/asesmen_keperawatan/pengkajian_awal_content_widget.dart';
import 'package:hms_app/presentation/pages/igd/perawat/asesmen_tindak_lanjut_igd_content_widget.dart';
import 'package:hms_app/presentation/pages/igd/perawat/resiko_jatuh_getup_and_gotest.dart';
import 'package:hms_app/presentation/pages/igd/perawat/riwayat_kehamilan_igd_perawat_content_widget.dart';
import 'package:hms_app/presentation/pages/igd/perawat/skrining_dekubitus_igd_widget_content.dart';
import 'package:hms_app/presentation/pages/igd/perawat/skrining_nyeri_perawat_igd_content_widget.dart';

class PengkajianAwalIGDPerawatDokterPageWidget extends StatelessWidget {
  const PengkajianAwalIGDPerawatDokterPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    AuthState authState = context.watch<AuthBloc>().state;

    return TabbarWithoutExpandexWidget(
        backgroundColor: ThemeColor.whiteColor,
        menu: menu,
        onTap: (index) {
          //==//
          if (index == 0) {
            if (authState is Authenticated) {
              context.read<AsesmenAwalIgdBloc>().add(OnGetAsesmenAwalIGDEvent(
                  noReg: singlePasien.first.noreg,
                  noRM: singlePasien.first.mrn,
                  tanggal: DateTime.now().toString().substring(0, 10),
                  person: toPerson(person: authState.user.person)));
            }
          }
          //==//
          if (index == 1) {
            context.read<TriaseBloc>().add(
                TriaseEvent.getSkriningNyeri(noReg: singlePasien.first.noreg));
          }
          if (index == 2) {
            context.read<ResikoJatuhGetupBloc>().add(
                OnGetResikoJatuhGetUpGoTestEvent(
                    noRM: singlePasien.first.mrn,
                    noReg: singlePasien.first.noreg));

            context.read<CpptSbarBangsalBloc>().add(
                OnGetCatatanKeperawatanEvent(noReg: singlePasien.first.noreg));
          }
          if (index == 4) {
            context.read<AsesmenIgdBloc>().add(
                AsesmenIgdEvent.getSkriningResikoDekubitus(
                    noreg: singlePasien.first.noreg));
          }

          if (index == 3) {
            context.read<AsesmenIgdBloc>().add(
                AsesmenIgdEvent.getRiwayatKehamilan(
                    noreg: singlePasien.first.noreg));
          }

          if (index == 4) {
            context.read<AsesmenIgdBloc>().add(
                AsesmenIgdEvent.getSkriningResikoDekubitus(
                    noreg: singlePasien.first.noreg));
          }

          if (index == 5) {
            context.read<AsesmenIgdBloc>().add(AsesmenIgdEvent.getTindakLanjut(
                noreg: singlePasien.first.noreg));
          }
        },
        children: menu.asMap().entries.map(
          (e) {
            if (e.key == 0) {
              return const PengkajianAwalKeperawatanContentWidget();
            }

            if (e.key == 1) {
              return const SkriningNyeriPerawatContentWidget();
            }

            if (e.key == 2) {
              return const ResikoJatuhGetUpAndGoTestPageWidget();
            }

            if (e.key == 3) {
              return const RiwayatKehamilanContentWidget();
            }

            if (e.key == 4) {
              return const SkriningDekubitusIGdContentWidget();
            }

            if (e.key == 5) {
              return const AsesmenTindakLanjutIGDContentWidget();
            }

            return Container();
          },
        ).toList());
  }
}

List<String> menu = [
  "Pengkajian Awal",
  "Skrining Nyeri",
  "Resiko Jatuh\nGet Up & Go Test",
  "Riwayat Kehamilan",
  "Skrining Dekubetus",
  "Tindak Lanjut"
];
