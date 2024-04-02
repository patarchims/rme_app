import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/kebidanan/bloc/kebidanan/kebidanan_bloc.dart';
import 'package:hms_app/presentation/kebidanan/bloc/pengkajian_kebidanan/pengkajian_kebidanan_bloc.dart';
import 'package:hms_app/presentation/kebidanan/bloc/pengkajian_nutrisi/pengkajian_nutrisi_bloc.dart';
import 'package:hms_app/presentation/kebidanan/bloc/pengkajian_persistem/pengkajian_persistem_bloc.dart';
import 'package:hms_app/presentation/kebidanan/bloc/resiko_jatuh_kebidanan/resiko_jatuh_kebidanan_bloc.dart';
import 'package:hms_app/presentation/kebidanan/presentation/asesmen/fungsional_content_widget.dart';
import 'package:hms_app/presentation/kebidanan/presentation/asesmen/kebidanan_widget_content.dart';
import 'package:hms_app/presentation/kebidanan/presentation/asesmen/nutrisi_widget.dart';
import 'package:hms_app/presentation/kebidanan/presentation/asesmen/pemeriksaan_fisik_kebidanan_content_widget.dart';
import 'package:hms_app/presentation/kebidanan/presentation/asesmen/pengkajian_persistem_page_widget.dart';
import 'package:hms_app/presentation/kebidanan/presentation/asesmen/resiko_jatuh_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/asesmen_nyeri/asesmen_nyeri_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/pengkajian_fungsional_keperawatan/asesemen_nyeri_keperawatan_widget.dart';
import 'package:provider/provider.dart';

class AsessmenKebidananWidget extends StatelessWidget {
  const AsessmenKebidananWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    AuthState authState = context.watch<AuthBloc>().state;

    return DefaultTabController(
        length: menu.length,
        child: Scaffold(
          backgroundColor: ThemeColor.transparentColor,
          appBar: AppBar(
            backgroundColor: ThemeColor.bgColor,
            foregroundColor: Colors.black,
            surfaceTintColor: Colors.black,
            flexibleSpace: SafeArea(
                child: TabBar(
              labelColor: ThemeColor.primaryColor,
              unselectedLabelColor: Colors.black,
              dividerColor: Colors.white,
              indicatorColor: ThemeColor.primaryColor,
              onTap: (index) {
                if (index == 0) {
                  if (authState is Authenticated) {
                    context.read<PengkajianKebidananBloc>().add(
                        OnGetAsesmenKebidananEvent(
                            noReg: singlePasien.first.noreg,
                            person: toPerson(person: authState.user.person)));
                  }
                }
                if (index == 1) {
                  context.read<PengkajianNutrisiBloc>().add(
                      OnGetPengkajianNutrisi(noReg: singlePasien.first.noreg));
                }
                if (index == 5) {
                  context.read<KebidananBloc>().add(
                      OnGetPengkajianFungsionalKebidanan(
                          noReg: singlePasien.first.noreg));
                }
                if (index == 6) {
                  context
                      .read<AsesmenNyeriBloc>()
                      .add(OnGetAsesemenNyeri(noReg: singlePasien.first.noreg));
                }

                if (index == 4) {
                  context.read<ResikoJatuhKebidananBloc>().add(
                      OnGetResikoJatuhKebidanan(
                          noReg: singlePasien.first.noreg));
                }

                if (index == 2) {
                  // GET PENGKAJIAN PERSISTEM
                  log("PENGKAJIAN PERSISTEM");
                  if (authState is Authenticated) {
                    context.read<PengkajianPersistemBloc>().add(
                        OnGetPengkajianPersistemEvent(
                            noReg: singlePasien.first.noreg,
                            person: toPerson(person: authState.user.person)));
                  }
                }
              },
              tabs: menu
                  .map(
                    (e) => Tab(
                      text: e,
                    ),
                  )
                  .toList(),
            )),
            leading: null,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          body: TabBarView(
              children: menu.asMap().entries.map((e) {
            if (e.value == "Pemeriksaan Fisik") {
              return const PemeriksaanFisikKebidananContentWidget();
            }

            if (e.value == "Fungsional") {
              return const AsesmentFungsionalKebidananWidget();
            }

            if (e.value == "Nutrisi") {
              return const AsesmenNutrisiKebidananWidget();
            }
            if (e.value == "Kebidanan") {
              return const PengkajianKebidananWidgetContent();
            }
            if (e.value == "Resiko Jatuh") {
              return const ResikoJatuhWidget();
            }

            if (e.value == "Pengkajian Persistem") {
              return const PengkajianPersistemPageWidget();
            }

            if (e.value == "Nyeri") {
              return const AsesmenAwalNyeriKeperawatanWidgetPage();
            }

            return Container();
          }).toList()),
        ));
  }
}

List<String> menu = [
  "Kebidanan",
  "Nutrisi",
  "Pengkajian Persistem",
  "Pemeriksaan Fisik",
  "Resiko Jatuh",
  "Fungsional",
  "Nyeri"
];
