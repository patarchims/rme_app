import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/input_diagnosa/input_diagnosa_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
// import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/pages/igd/dokter/diagonosa_banding/input_diagnosa_igd_tabview.dart';
import 'package:hms_app/presentation/perina/bloc/asesmen_bayi/asesmen_bayi_bloc.dart';
// import 'package:hms_app/presentation/perina/pages/asesmen/asesmen_medis/input_pemeriksaan_fisik_perina_page.dart';
import 'package:hms_app/presentation/perina/pages/asesmen/asesmen_medis/input_tindak_lanjut_perina_page_widget.dart';
// import 'package:hms_app/presentation/perina/pages/asesmen/pemeriksaan_fisik_perina_page_widget.dart';

class AsesmenMedisBayiPerinaPage extends StatelessWidget {
  const AsesmenMedisBayiPerinaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return TabbarHeaderContentWidget(
      backgroundColor: ThemeColor.bgColor,
      menu: menu,
      onTap: (index) {
        if (index == 0) {
          context.read<InputDiagnosaBloc>().add(
              InputDiagnosaEvent.getDiagnosa(noreg: singlePasien.first.noreg));
        }
        if (index == 1) {
          context.read<AsesmenBayiBloc>().add(OnGetTindakLanjutEvent(
              noReg: singlePasien.first.noreg, noRM: singlePasien.first.mrn));
        }
      },
      children: menu.asMap().entries.map((e) {
        if (e.key == 0) {
          // return const AsesmenHDContentWidgetPage();

          return const InputDiagnosaTabViewIGDWidget();
        }

        if (e.key == 1) {
          // TAMPILKAN TINDAK LANJUT
          return const InputTindakLanjuPerinaPage();
        }

        if (e.key == 2) {
          // return const InputPemeriksaanFisikPerinaPage();
        }

        if (e.key == 1) {}

        return Container();
      }).toList(),
    );
  }
}

List<String> menu = ["Diagnosa", "Tindakan Lanjut", "Penunjang Medik"];
