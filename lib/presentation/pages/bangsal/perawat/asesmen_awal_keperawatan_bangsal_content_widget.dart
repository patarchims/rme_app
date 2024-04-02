import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/kebidanan/bloc/kebidanan/kebidanan_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/pengkajian_awal_keperawatan/pengkajian_awal_keperawatan_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/tanda_vital_keperawatan/tanda_vital_keperawatan_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/asesmen_keperawatan/asesmen_keperawatan_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/keluhan_utama/keluhan_utama_keperawatan_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/riwayat_pengobatan_dirumah/riwayat_pengobatan_dirumah_keperawatan_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/vital_sign/vital_sign_keperawatan_bangsal_widget.dart';

class AsesmenKeperawatanContentWidget extends StatelessWidget {
  const AsesmenKeperawatanContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    AuthState authState = context.watch<AuthBloc>().state;

    return TabbarHeaderContentWidget(
        backgroundColor: ThemeColor.bgColor,
        onTap: (index) {
          // PRINT INDEX
          if (index == 3) {
            context.read<KebidananBloc>().add(
                OnGetRiwayatPengobatanDirumah(noReg: singlePasien.first.noreg));
          }
          if (index == 0) {
            // LAKUKAN GET PENGKAJIAN
            if (authState is Authenticated) {
              context.read<PengkajianAwalKeperawatanBloc>().add(
                  OnGetPengkajianAwalKeperawatanEvent(
                      tanggal: DateTime.now().toString().substring(0, 10),
                      noReg: singlePasien.first.noreg,
                      noRM: singlePasien.first.mrn,
                      person: toPerson(person: authState.user.person)));
            }
          }
          if (index == 1) {
            // LAKUKAN GET TANDA VITAL
            if (authState is Authenticated) {
              context.read<TandaVitalKeperawatanBloc>().add(
                  OnGetTandaVitalKeperawatanBangsal(
                      noReg: singlePasien.first.noreg,
                      person: toPerson(person: authState.user.person)));
            }
          }
        },
        menu: menu,
        children: menu.asMap().entries.map((e) {
          if (e.value == menu.first) {
            return const KeluhanUtamaKeperawatanWidget();
          }

          if (e.value == "Tanda - Tanda Vital") {
            return const VitalSignKeperawatanBangsalWidget();
          }

          if (e.value == "Assessment") {
            return const AsesmenKeperawatanWidget();
          }

          if (e.value == "Riwayat Pengobatan dirumah") {
            return const RiwayatPengobatanDirumahKeperawatanWidget();
          }

          return Container();
        }).toList());
  }
}

List<String> menu = [
  "Keluhan Utama",
  "Tanda - Tanda Vital",
  "Assessment",
  "Riwayat Pengobatan dirumah",
];
