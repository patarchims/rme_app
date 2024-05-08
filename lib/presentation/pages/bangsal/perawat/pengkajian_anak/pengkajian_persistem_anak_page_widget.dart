import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/nyeri_anak/asesmen_nyeri_anak_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/pengkajian_nutrisi_anak/pengkajian_nutrisi_anak_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/pengkajian_anak/pengkajian_keperawatan_anak_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/pengkajian_anak/pengkajian_nutrisi_anak_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/pengkajian_anak/pengkajian_nyeri_anak_widget_page.dart';

class PengkajianPersistemAnakPageWidget extends StatelessWidget {
  const PengkajianPersistemAnakPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return TabbarHeaderContentWidget(
        backgroundColor: ThemeColor.bgColor,
        menu: menu,
        onTap: (index) {
          if (index == 0) {}
          if (index == 1) {
            // GET ASESMEN NYERI NIPS
            context.read<PengkajianNutrisiAnakBloc>().add(
                OnGetPengkajianNutrisiAnakEvent(
                    noReg: singlePasien.first.noreg));
          }
          if (index == 2) {
            // GET ASESMEN NYERI NIPS
            context.read<AsesmenNyeriAnakBloc>().add(
                OnGetAsesmenNyeriAnakEvent(noReg: singlePasien.first.noreg));
          }
        },
        children: menu.asMap().entries.map((e) {
          if (e.key == 0) {
            return const PengkajianKeperawatanAnakWidgetPage();
          }

          if (e.key == 1) {
            return const PengkajianNutrisiAnakPageWidget();
          }

          if (e.key == 2) {
            return const PengkajianNyeriAnakWigetPage();
          }

          return Container();
        }).toList());
  }
}

List<String> menu = ["Pemeriksaan Fisik", "Nutrisi", "Nyeri"];
