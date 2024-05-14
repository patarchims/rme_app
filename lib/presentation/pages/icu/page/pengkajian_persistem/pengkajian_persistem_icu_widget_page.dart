import 'package:flutter/material.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/pengkajian_nutrisi_anak/pengkajian_nutrisi_anak_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/pengkajian_nutrisi_keperawatan/pengkajian__keperawtan_nutrisi_widget.dart';
import 'package:hms_app/presentation/pages/icu/bloc/asesmen_nyeri_icu/asesmen_nyeri_icu_bloc.dart';
import 'package:hms_app/presentation/pages/icu/bloc/pemeriksaan_fisik_icu/pemeriksaan_fisik_icu_bloc.dart';
import 'package:hms_app/presentation/pages/icu/page/pengkajian_persistem/pengkajian_nyeri_icu_widget_page.dart';
import 'package:hms_app/presentation/pages/icu/page/pengkajian_persistem/pengkajian_persistem_page_widge.dart';
import 'package:provider/provider.dart';

class PengkajianPersistemWidgetPage extends StatelessWidget {
  const PengkajianPersistemWidgetPage({super.key});

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
        if (index == 0) {
          if (authState is Authenticated) {
            context.read<PemeriksaanFisikIcuBloc>().add(
                OnGetPengkajianPersistemICU(
                    noRM: singlePasien.first.mrn,
                    tanggal: DateTime.now().toString().substring(0, 10),
                    noReg: singlePasien.first.noreg,
                    person: toPerson(person: authState.user.person)));
          }
        }

        if (index == 1) {
          context.read<PengkajianNutrisiAnakBloc>().add(
              OnGetPengkajianNutrisiAnakEvent(noReg: singlePasien.first.noreg));
        }

        if (index == 2) {
          context
              .read<AsesmenNyeriIcuBloc>()
              .add(OnGetAsesmenNyeriIcuEvent(noReg: singlePasien.first.noreg));
        }
      },
      children: menu.asMap().entries.map((e) {
        if (e.value == "Pengkajian Persistem") {
          return const PengkajianICUPersistemPageWidget();
        }

        if (e.value == "Nutrisi") {
          return const AsesmenPengkajianNutrisiKeperawatanWidget();
        }

        if (e.value == "Nyeri") {
          return const PengkajianNyeriICUWidgetPage();
        }

        return Container();
      }).toList(),
    );
  }
}

List<String> menu = [
  "Pengkajian Persistem",
  "Nutrisi",
  "Nyeri",
];
