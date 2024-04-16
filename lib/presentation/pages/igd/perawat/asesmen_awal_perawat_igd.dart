import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_igd/asesmen_igd_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/triase/triase_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/pages/igd/perawat/asesmen_perawat_skrining_pasien_page_widget.dart';
import 'package:hms_app/presentation/pages/igd/perawat/asesmen_tindak_lanjut_igd_content_widget.dart';
import 'package:hms_app/presentation/pages/igd/perawat/informasi_keluhan_asesmen_igd_content_widget.dart';
import 'package:hms_app/presentation/pages/igd/perawat/riwayat_kehamilan_igd_perawat_content_widget.dart';
import 'package:hms_app/presentation/pages/igd/perawat/skrining_dekubitus_igd_widget_content.dart';
import 'package:hms_app/presentation/pages/igd/perawat/skrining_nyeri_perawat_igd_content_widget.dart';

class AsesmenKeperawatanIGDContentWidget extends StatelessWidget {
  const AsesmenKeperawatanIGDContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return TabbarHeaderContentWidget(
      backgroundColor: ThemeColor.bgColor,
      menu: menuAsesmen,
      onTap: (index) {
        // ========== ACTION KETIKA DILAKUKAN ONTAP
        if (index == 0) {
          context.read<AsesmenIgdBloc>().add(
              AsesmenIgdEvent.getInformasiDanKeluhan(
                  noreg: singlePasien.first.noreg));
        }

        // ==============================
        if (index == 1) {
          context.read<TriaseBloc>().add(
              TriaseEvent.getSkriningNyeri(noReg: singlePasien.first.noreg));
        }

        if (index == 2) {
          context.read<AsesmenIgdBloc>().add(
              AsesmenIgdEvent.getRiwayatKehamilan(
                  noreg: singlePasien.first.noreg));
        }

        if (index == 3) {
          context.read<AsesmenIgdBloc>().add(
              AsesmenIgdEvent.getSkriningResikoDekubitus(
                  noreg: singlePasien.first.noreg));
        }

        if (index == 4) {
          context.read<AsesmenIgdBloc>().add(
              AsesmenIgdEvent.getTindakLanjut(noreg: singlePasien.first.noreg));
        }
      },
      children: menuAsesmen.asMap().entries.map((e) {
        if (e.key == 0) {
          return const InformasiKeluhanAsesmenIgdContentWidget();
        }
        if (e.key == 1) {
          return const SkriningNyeriPerawatContentWidget();
        }
        if (e.key == 2) {
          return const RiwayatKehamilanContentWidget();
        }
        if (e.key == 3) {
          return const SkriningDekubitusIGdContentWidget();
        }
        if (e.key == 4) {
          return const AsesmenTindakLanjutIGDContentWidget();
        }
        if (e.key == 5) {
          return const AsesmenPerawatSkriningPasienWidget();
        }
        return Container();
      }).toList(),
    );
  }
}

// MENU ASESMEN AWAL PERAWAT IGD CONTENT WIDGET
List<String> menuAsesmen = [
  "Informasi & Keluhan",
  "Skrining Nyeri",
  "Riwayat Kehamilan",
  "Skrining Resiko Dekubitus",
  "Tindak Lanjut",
  "Skrining Pasien"
];
