import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/component/resources/app_config.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/pages/igd/bloc/pemeriksaan_fisik_igd/pemeriksaan_fisik_igd_bloc.dart';
import 'package:hms_app/presentation/pages/igd/bloc/tanda_vital_igd_dokter/tanda_vital_igd_dokter_bloc.dart';
import 'package:hms_app/presentation/pages/igd/dokter/pemeriksaan_fisik/pemeriksaan_fisik_igd_dokter_methodis_widget.dart';
import 'package:hms_app/presentation/pages/igd/dokter/pemeriksaan_fisik/pemeriksaan_fisik_igd_dokter_widgert.dart';
import 'package:hms_app/presentation/pages/igd/medis/triase_igd_dokter/tanda_vital_dan_gangguan_perilaku_igd.dart';
import 'package:hms_app/presentation/pages/igd/perawat/asesmen_keperawatan/pengkajian_awal_keperawatan_igd_page_widget.dart';

class PengkajianAwalKeperawatanIGDPageWidget extends StatelessWidget {
  const PengkajianAwalKeperawatanIGDPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return TabbarHeaderContentWidget(
        backgroundColor: ThemeColor.whiteColor,
        menu: menu,
        onTap: (index) {
          if (index == 2) {
            if (authState is Authenticated) {
              if (AppConstant.appSetup == AppSetup.methodist) {
                context.read<PemeriksaanFisikIgdBloc>().add(
                    OnGetPemeriksaanFisikMethodist(
                        noReg: singlePasien.first.noreg, person: "Dokter"));
              } else {
                context.read<PemeriksaanFisikIgdBloc>().add(
                    OnGetPemeriksaanFisikPerawatIGD(
                        noReg: singlePasien.first.noreg, person: "Dokter"));
              }
            }
          }

          if (index == 1) {
            if (authState is Authenticated) {
              context.read<TandaVitalIgdDokterBloc>().add(
                  OnGetTandaVitalIGDPerawat(
                      pelayanan: "rajal",
                      noReg: singlePasien.first.noreg,
                      person: "Dokter"));
            }
          }
        },
        children: menu.asMap().entries.map((e) {
          if (e.key == 0) {
            return const PengkajianAwalIGDPerawatDokterPageWidget();
          }

          if (e.key == 1) {
            return const TandaVitalDanGannguanPerilakuWidgetContent(
              isENableAdd: false,
            );
            // return const VitalSignKeperawatanIGDPage();
          }

          if (e.key == 2) {
            if (AppConstant.appSetup == AppSetup.methodist) {
              return const PemeriksaanFisikIGDDokterMethodistWidgetPage();
            } else {
              return const PemeriksaanFisikIGDDokterWidget(isENableAdd: false);
            }
          }

          return Container();
        }).toList());
  }
}

List<String> menu = [
  "Pengkajian\nKeperawatan",
  "Vital Sign",
  "Pemeriksaan Fisik"
];
