import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/kebidanan/bloc/diagnosa_kebidanan/diagnosa_kebidanan_bloc.dart';
import 'package:hms_app/presentation/kebidanan/bloc/identitas_bayi/indentias_bayi_bloc.dart';
import 'package:hms_app/presentation/kebidanan/bloc/kebidanan/kebidanan_bloc.dart';
import 'package:hms_app/presentation/kebidanan/bloc/keluhan_utama_kebidanan/keluhan_utama_kebidanan_bloc.dart';
import 'package:hms_app/presentation/kebidanan/bloc/pengkajian_kebidanan/pengkajian_kebidanan_bloc.dart'
    as kebidanan;
import 'package:hms_app/presentation/kebidanan/presentation/asesmen/asessmen_content_widget.dart';
import 'package:hms_app/presentation/kebidanan/presentation/asesmen/diagnosa_icd_kebidanan_widget.dart';
import 'package:hms_app/presentation/kebidanan/presentation/asesmen/indentitas_bayi_kebidanan_page_wiget.dart';
import 'package:hms_app/presentation/kebidanan/presentation/asesmen/keluhan_utama_widget.dart';
import 'package:hms_app/presentation/kebidanan/presentation/asesmen/riwayat_kehamilan_page_widget.dart';
import 'package:hms_app/presentation/kebidanan/presentation/asesmen/riwayat_pengobatan_page_widget.dart';
import 'package:hms_app/presentation/kebidanan/presentation/asesmen/tanda_tanda_vital_kebidanan_widget.dart';

class AssesmenKebidananContentWidget extends StatelessWidget {
  const AssesmenKebidananContentWidget({super.key});

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
            if (authState is Authenticated) {
              context.read<KeluhanUtamaKebidananBloc>().add(
                  OnGetAsesmenKebidananEvent(
                      noReg: singlePasien.first.noreg,
                      person: toPerson(person: authState.user.person)));
            }
          }

          // GET ASESMEN KEBIDANAN
          if (index == 1) {
            if (authState is Authenticated) {
              context.read<kebidanan.PengkajianKebidananBloc>().add(
                  kebidanan.OnGetAsesmenKebidananEvent(
                      noReg: singlePasien.first.noreg,
                      person: toPerson(person: authState.user.person)));
            }
          }

          if (index == 2) {
            log("GET TANDA VITAL KEBIDANAN");
            if (authState is Authenticated) {
              context.read<KebidananBloc>().add(OnGetVitalSignKebidanan(
                  noReg: singlePasien.first.noreg,
                  person: toPerson(person: authState.user.person)));
            }
          }

          if (index == 3) {
            context
                .read<KebidananBloc>()
                .add(OnGetRiwayatKebidanan(noReg: singlePasien.first.noreg));
            log("GET RIWAYAT KEBIDANAN");
          }

          if (index == 4) {
            context.read<KebidananBloc>().add(
                OnGetRiwayatPengobatanDirumah(noReg: singlePasien.first.noreg));
          }

          if (index == 5) {
            context.read<DiagnosaKebidananBloc>().add(
                OnGetDiagnosaKebidananEvent(noReg: singlePasien.first.noreg));
          }

          if (index == 6) {
            context.read<IndentiasBayiBloc>().add(OnGetIdentitasBayi(
                noReg: singlePasien.first.noreg, noRM: singlePasien.first.mrn));
            log("GET IDENTITAS BAYI KEBIDANAN");
          }

          if (index == 6) {
            context.read<IndentiasBayiBloc>().add(OnGetIdentitasBayi(
                noReg: singlePasien.first.noreg, noRM: singlePasien.first.mrn));
            log("GET IDENTITAS BAYI KEBIDANAN");
          }
        },
        menu: menu,
        children: menu.asMap().entries.map((e) {
          if (e.value == "Keluhan Utama") {
            return const KeluhanUtamaKebidananWidget();
          }
          if (e.value == "Assessment") {
            return const AsessmenKebidananWidget();
          }

          if (e.value == "Riwayat Kehamilan") {
            return const RiwayatKehamilanWidgetPage();
          }
          if (e.value == "Tanda - Tanda Vital") {
            return const TandaTandaVitalKebidananWidgetPage();
          }

          if (e.value == "Riwayat Pengobatan dirumah") {
            return const RiwayatPengobatanPageWidget();
          }
          if (e.value == "Diagnosa Kebidanan") {
            return const DiagnosaICD10KebidananWidget();
          }

          if (e.value == "Identitas Bayi") {
            return const IdentitasBayiKebidananWidgetPage();
          }

          return Container();
        }).toList());
  }
}

List<String> menu = [
  "Keluhan Utama",
  "Assessment",
  "Tanda - Tanda Vital",
  "Riwayat Kehamilan",
  "Riwayat Pengobatan dirumah",
  "Diagnosa Kebidanan",
  "Identitas Bayi"
];
