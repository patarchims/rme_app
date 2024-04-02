import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/kebidanan/bloc/identitas_bayi/indentias_bayi_bloc.dart';
import 'package:hms_app/presentation/kebidanan/presentation/asesmen/indentitas_bayi_kebidanan_page_wiget.dart';
import 'package:hms_app/presentation/perina/bloc/apgar_score/apgar_score_bloc.dart';
import 'package:hms_app/presentation/perina/bloc/asesmen_bayi/asesmen_bayi_bloc.dart';
import 'package:hms_app/presentation/perina/bloc/down_socre_nonatus/down_score_neonatus_bloc.dart';
import 'package:hms_app/presentation/perina/bloc/pemeriksaan_fisik_perina/pemeriksaan_fisik_perina_bloc.dart'
    as bp;
import 'package:hms_app/presentation/perina/pages/asesmen/agpar_score_page_widget.dart';
import 'package:hms_app/presentation/perina/pages/asesmen/down_score_pada_neonatus_page_widget.dart';
import 'package:hms_app/presentation/perina/pages/asesmen/pemeriksaan_fisik_perina_page_widget.dart';
import 'package:hms_app/presentation/perina/pages/asesmen/riwayat_kehamilan_perina/riwayat_keperawatan_perina_page_widget.dart';
import 'package:hms_app/presentation/perina/pages/asesmen/tanda_vital_perina_page_widget.dart';

class AsesmenPerinaBayiPageWidget extends StatelessWidget {
  const AsesmenPerinaBayiPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    AuthState authState = context.watch<AuthBloc>().state;

    return TabbarHeaderContentWidget(
        backgroundColor: ThemeColor.bgColor,
        menu: menu,
        onTap: (index) {
          if (authState is Authenticated) {
            if (index == 2) {
              context.read<bp.PemeriksaanFisikPerinaBloc>().add(
                  bp.OnGetPemeriksaanFisikPerina(
                      noReg: singlePasien.first.noreg,
                      person: toPerson(person: authState.user.person)));
            }
            if (index == 1) {
              context.read<bp.PemeriksaanFisikPerinaBloc>().add(
                  bp.OnGetDVitalSingPerina(
                      pelayanan:
                          toPelayanan(poliklinik: authState.user.poliklinik),
                      noReg: singlePasien.first.noreg,
                      person: toPerson(person: authState.user.person)));
            }
            if (index == 3) {
              context
                  .read<ApgarScoreBloc>()
                  .add(OnGetApgarScoreEvent(noReg: singlePasien.first.noreg));
            }

            if (index == 5) {
              context.read<IndentiasBayiBloc>().add(OnGetIdentitasBayi(
                  noReg: singlePasien.first.noreg,
                  noRM: singlePasien.first.mrn));
              log("GET IDENTITAS BAYI KEBIDANAN");
            }
            if (index == 4) {
              context
                  .read<DownScoreNeonatusBloc>()
                  .add(OnGetDownScoreNeoNatus(noReg: singlePasien.first.noreg));
            }
          }
        },
        children: menu.asMap().entries.map((e) {
          if (authState is Authenticated) {
            if (e.key == 0) {
              context.read<AsesmenBayiBloc>().add(OnGetAsesmenKeperawatanBayi(
                  noReg: singlePasien.first.noreg,
                  noRM: singlePasien.first.mrn,
                  person: toPerson(person: authState.user.person)));
              return const RiwayatKeperawatanPerinaPageWidget();
            }

            if (e.key == 1) {
              return const TandaVitalPerinaWidgetPage();
            }
            if (e.key == 3) {
              return const AgparScoreWidgetPage();
            }

            if (e.key == 2) {
              return const PemeriksaanFisikPerinaPageWidget();
            }
            if (e.key == 4) {
              // read daa
              return const DownScroePadaNeoNatusPageWidget();
            }
            if (e.key == 5) {
              return const IdentitasBayiKebidananWidgetPage();
            }
          }

          return Container();
        }).toList());
  }
}

// RIWAYAT KEPERAWATAN
List<String> menu = [
  "Riwayat\nKeperawatan",
  "Tanda Vital",
  "Pemeriksaan Fisik",
  "Penilaian Apgar Score",
  "Down Scroe Pada Neonatus",
  "Identitas Bayi"
];
