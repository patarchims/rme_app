import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/input_diagnosa/input_diagnosa_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_igd/asesmen_igd_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/triase/triase_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/component/resources/app_config.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/pages/igd/bloc/keluhan_utama/keluhan_utama_bloc.dart';
import 'package:hms_app/presentation/pages/igd/bloc/pemeriksaan_fisik_igd/pemeriksaan_fisik_igd_bloc.dart';
import 'package:hms_app/presentation/pages/igd/bloc/tanda_vital_igd_dokter/tanda_vital_igd_dokter_bloc.dart';
import 'package:hms_app/presentation/pages/igd/dokter/asesmen/asesmen_medis_igd_content_widget.dart';
import 'package:hms_app/presentation/pages/igd/dokter/diagonosa_banding/input_diagnosa_igd_tabview.dart';
import 'package:hms_app/presentation/pages/igd/dokter/pemeriksaaan_penunjang/pemeriksaan_penunjang_widget.dart';
import 'package:hms_app/presentation/pages/igd/dokter/pemeriksaan_fisik/pemeriksaan_fisik_igd_dokter_methodis_widget.dart';
import 'package:hms_app/presentation/pages/igd/dokter/pemeriksaan_fisik/pemeriksaan_fisik_igd_dokter_widgert.dart';
import 'package:hms_app/presentation/pages/igd/dokter/rencana_tindak_lanjut_widget.dart';
import 'package:hms_app/presentation/pages/igd/dokter/status_lokalis_widget.dart';
import 'package:hms_app/presentation/pages/igd/medis/triase_igd_dokter/tanda_vital_dan_gangguan_perilaku_igd.dart';

class PasienAwalIGDWidget extends StatefulWidget {
  final List<String> menu;
  const PasienAwalIGDWidget({
    super.key,
    required this.menu,
  });

  @override
  State<PasienAwalIGDWidget> createState() => _PasienAwalIGDWidgetState();
}

class _PasienAwalIGDWidgetState extends State<PasienAwalIGDWidget> {
  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return TabbarHeaderContentWidget(
        backgroundColor: ThemeColor.bgColor,
        onTap: (index) {
          if (index == 0) {
            if (authState is Authenticated) {
              context.read<KeluhanUtamaBloc>().add(OnGetKeluhanUtamaEvent(
                  noRM: singlePasien.first.mrn,
                  noReg: singlePasien.first.noreg,
                  tanggal: DateTime.now().toString().substring(0, 10),
                  person: toPerson(person: authState.user.person),
                  pelayanan:
                      toPelayanan(poliklinik: authState.user.poliklinik)));
            }
          }

          if (index == 1) {
            if (authState is Authenticated) {
              context.read<TandaVitalIgdDokterBloc>().add(
                  OnGetTandaVitalIGDDokter(
                      pelayanan:
                          toPelayanan(poliklinik: authState.user.poliklinik),
                      noReg: singlePasien.first.noreg,
                      person: toPerson(person: authState.user.person)));
            }
          }

          if (index == 2) {
            if (authState is Authenticated) {
              if (AppConstant.appSetup == AppSetup.methodist) {
                context.read<PemeriksaanFisikIgdBloc>().add(
                    OnGetPemeriksaanFisikMethodist(
                        noReg: singlePasien.first.noreg,
                        person: toPerson(person: authState.user.person)));
              } else if (AppConstant.appSetup == AppSetup.batuRaja) {
                context.read<PemeriksaanFisikIgdBloc>().add(
                    OnGetPemeriksaanFisikMethodist(
                        noReg: singlePasien.first.noreg,
                        person: toPerson(person: authState.user.person)));
              } else if (AppConstant.appSetup == AppSetup.rsTiara) {
                context.read<PemeriksaanFisikIgdBloc>().add(
                    OnGetPemeriksaanFisikMethodist(
                        noReg: singlePasien.first.noreg,
                        person: toPerson(person: authState.user.person)));
              } else {
                context.read<PemeriksaanFisikIgdBloc>().add(
                    OnGetPemeriksaanFisik(
                        noReg: singlePasien.first.noreg,
                        person: toPerson(person: authState.user.person)));
              }
            }
          }

          if (index == 3) {
            context.read<AsesmenIgdBloc>().add(AsesmenIgdEvent.getStatusLokalis(
                noReg: singlePasien.first.noreg));
          }

          if (index == 4) {
            context.read<InputDiagnosaBloc>().add(
                InputDiagnosaEvent.getDiagnosa(
                    noreg: singlePasien.first.noreg));
          }

          if (index == 6) {
            context.read<AsesmenIgdBloc>().add(
                AsesmenIgdEvent.getRencanaTindakLanjut(
                    noreg: singlePasien.first.noreg));
          }

          if (index == 5) {}
          if (index == 8) {
            context.read<TriaseBloc>().add(
                TriaseEvent.getTriaseSkala(noReg: singlePasien.first.noreg));
          }
        },
        menu: widget.menu,
        children: widget.menu.asMap().entries.map((e) {
          if (e.key == 0) {
            return const AsesmenMedisIGdContentWidget();
          }

          if (e.key == 1) {
            return const TandaVitalDanGannguanPerilakuWidgetContent(
                isENableAdd: true);
          }

          if (e.key == 2) {
            if (AppConstant.appSetup == AppSetup.methodist) {
              return const PemeriksaanFisikIGDDokterMethodistWidgetPage();
            } else if (AppConstant.appSetup == AppSetup.rsTiara) {
              return const PemeriksaanFisikIGDDokterMethodistWidgetPage();
            } else if (AppConstant.appSetup == AppSetup.batuRaja) {
              return const PemeriksaanFisikIGDDokterMethodistWidgetPage();
            } else {
              return const PemeriksaanFisikIGDDokterWidget(isENableAdd: true);
            }
          }

          if (e.key == 3) {
            return const StatusLokalisWidget();
          }

          if (e.key == 4) {
            return const InputDiagnosaTabViewIGDWidget();
          }

          if (e.key == 5) {
            return const PemeriksaanPenunjangIGDWidget();
          }

          if (e.key == 6) {
            return const RencanaTindakLanjutIGDWiget();
          }

          return Container();
        }).toList());
  }
}
