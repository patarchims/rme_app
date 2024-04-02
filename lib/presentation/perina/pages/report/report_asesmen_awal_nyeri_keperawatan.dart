import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/header/tabbar_without_expanded_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/asesmen_nyeri/asesmen_nyeri_bloc.dart';
import 'package:hms_app/presentation/perina/pages/report/report_asesesmen_nyeri_baker_face_page_widget.dart';
import 'package:hms_app/presentation/perina/pages/report/report_asesmen_nyeri_numeric_scale_page_widget.dart';

class AsesmeAwalNyeriKeperawatanPage extends StatelessWidget {
  const AsesmeAwalNyeriKeperawatanPage({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return TabbarWithoutExpandexWidget(
        backgroundColor: ThemeColor.bgColor,
        menu: menu,
        onTap: (index) {
          if (index == 0) {
            context
                .read<AsesmenNyeriBloc>()
                .add(OnGetReportAsesmenNyeri(noReg: singlePasien.first.noreg));
          }
          if (index == 1) {
            context
                .read<AsesmenNyeriBloc>()
                .add(OnGetReportAsesmenNyeri(noReg: singlePasien.first.noreg));
          }
        },
        children: menu.asMap().entries.map((e) {
          if (e.key == 0) {
            return const ReportAsesmenNyeriNumbericScalePage();
          }

          if (e.key == 1) {
            return const AsesmenAwalNyeriWongBakerFaceScalePage();
          }

          return Container();
        }).toList());
  }
}

List<String> menu = [
  "Asesmen Awal Nyeri\nNumeric Scale",
  "Asesmen Awal Nyeri\nWong Baker Face Scale"
];
