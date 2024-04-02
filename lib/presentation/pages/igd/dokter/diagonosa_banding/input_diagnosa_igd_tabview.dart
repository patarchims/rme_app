import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/input_diagnosa/input_diagnosa_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/header/tabbar_without_expanded_widget.dart';
import 'package:hms_app/presentation/pages/igd/bloc/diagnosa_banding/diagnosa_banding_bloc.dart';
import 'package:hms_app/presentation/pages/igd/dokter/diagonosa_banding/diagnosa_banding_igd_dokter_widget.dart';
import 'package:hms_app/presentation/pages/igd/dokter/input_diagnosa_igd_widget.dart';

class InputDiagnosaTabViewIGDWidget extends StatelessWidget {
  const InputDiagnosaTabViewIGDWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    AuthState authState = context.watch<AuthBloc>().state;

    return TabbarWithoutExpandexWidget(
        backgroundColor: ThemeColor.bgColor,
        menu: menu,
        onTap: (index) {
          if (index == 0) {
            context.read<InputDiagnosaBloc>().add(
                InputDiagnosaEvent.getDiagnosa(
                    noreg: singlePasien.first.noreg));
          }
          if (index == 1) {
            if (authState is Authenticated) {
              context.read<DiagnosaBandingBloc>().add(
                  OnGetDiagnosaBandingDokter(
                      noReg: singlePasien.first.noreg,
                      person: toPerson(person: authState.user.person)));
              context.read<DiagnosaBandingBloc>().add(OnGetDiagnosaBanding(
                  noReg: singlePasien.first.noreg,
                  person: toPerson(person: authState.user.person)));
            }
          }
        },
        children: menu.asMap().entries.map((e) {
          if (e.value == menu.first) {
            return const InputDiagnosaIgdWidget(enableEdit: true);
          }
          if (e.value == menu.last) {
            return const DiagnosaBandingIGDDokterWidget();
          }

          return Container();
        }).toList());
  }
}

List<String> menu = ["Diagnosa ICD-10", "Diagnosa Banding"];
