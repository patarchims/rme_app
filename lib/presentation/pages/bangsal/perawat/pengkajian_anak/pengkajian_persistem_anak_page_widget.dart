import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/header/tabbar_without_expanded_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/nyeri_anak/asesmen_nyeri_anak_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/pengkajian_fisik_anak/pengkajian_fisik_anak_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/pengkajian_nutrisi_anak/pengkajian_nutrisi_anak_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/pengkajian_persistem_keperawatan/pengkajian_persistem_keperawatan_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/pengkajian_anak/pengkajian_keperawatan_anak_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/pengkajian_anak/pengkajian_nutrisi_anak_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/pengkajian_anak/pengkajian_nyeri_anak_widget_page.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/pengkajian_persistem_keperawatan/pengkajian_persistem_page_widget.dart';

class PengkajianPersistemAnakPageWidget extends StatelessWidget {
  const PengkajianPersistemAnakPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    AuthState authState = context.watch<AuthBloc>().state;

    return TabbarWithoutExpandexWidget(
        backgroundColor: ThemeColor.bgColor,
        menu: menu,
        onTap: (index) {
          if (index == 0) {
            if (authState is Authenticated) {
              context.read<PengkajianPersistemKeperawatanBloc>().add(
                  OnGetPengkajianPersistem(
                      noReg: singlePasien.first.noreg,
                      noRM: singlePasien.first.mrn,
                      person: toPerson(person: authState.user.person)));
            }
          }

          if (index == 1) {
            if (authState is Authenticated) {
              context.read<PengkajianFisikAnakBloc>().add(
                  OnGetPengkajianFisikAnakEvent(
                      noReg: singlePasien.first.noreg,
                      person: toPerson(person: authState.user.person)));
            }
          }

          if (index == 2) {
            // GET ASESMEN NYERI NIPS
            context.read<PengkajianNutrisiAnakBloc>().add(
                OnGetPengkajianNutrisiAnakEvent(
                    noReg: singlePasien.first.noreg));
          }
          if (index == 3) {
            // GET ASESMEN NYERI NIPS
            context.read<AsesmenNyeriAnakBloc>().add(
                OnGetAsesmenNyeriAnakEvent(noReg: singlePasien.first.noreg));
          }
        },
        children: menu.asMap().entries.map((e) {
          // PENGKAJIAN PERSISTEM ANAK
          if (e.key == 0) {
            return const PengkajianPersistemKeperawatanPageWidget();
          }

          if (e.key == 1) {
            return const PengkajianKeperawatanAnakWidgetPage();
          }

          if (e.key == 2) {
            return const PengkajianNutrisiAnakPageWidget();
          }

          if (e.key == 3) {
            return const PengkajianNyeriAnakWigetPage();
          }

          return Container();
        }).toList());
  }
}

List<String> menu = ["Persistem", "Pemeriksaan Fisik", "Nutrisi", "Nyeri"];
