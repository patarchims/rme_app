import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/component/resources/app_config.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/cppt_sbar_bangsal/cppt_sbar_bangsal_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/medis/cppt_bangsal_no_expanded_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/medis/cppt_sbar_bangsal_widget.dart';

class CpptContentWidgetPage extends StatelessWidget {
  const CpptContentWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    if (AppConstant.appSetup == AppSetup.rsVitaInSani) {
      return const Expanded(child: CpptWidgetNoExpandedBangsal());
    } else {
      return TabbarHeaderContentWidget(
          backgroundColor: ThemeColor.bgColor,
          menu: menu,
          onTap: (index) {
            if (index == 0) {
              context
                  .read<CpptSbarBangsalBloc>()
                  .add(OnGetCpptBangsal(noReg: singlePasien.first.noreg));
            }

            if (index == 1) {
              context
                  .read<CpptSbarBangsalBloc>()
                  .add(OnGetCpptBangsal(noReg: singlePasien.first.noreg));
            }
          },
          children: menu.asMap().entries.map((e) {
            if (e.key == 0) {
              return const CpptWidgetNoExpandedBangsal();
            }

            if (e.key == 1) {
              return const CpptSBARBansalWidget();
            }

            return Container();
          }).toList());
    }
  }
}

List<String> menu = ["CPPT SOAP", "CPPT SBAR"];
List<String> menuMed = ["Catatan Keperawatan", "CPPT"];
List<String> menuVita = ["CPPT SOAP"];
