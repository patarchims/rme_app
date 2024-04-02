import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asuhan_keperawatan/hasil_asuhan_keperawatan/hasil_asuhan_keperawatan_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/asuhan_keperawatan/asuhan_keperawatan_page_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/asuhan_keperawatan/pencapaian_asuhan_keperawatan_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/resume/resume_content_widget.dart';

class AsuhanKeperawatanContentWidget extends StatelessWidget {
  const AsuhanKeperawatanContentWidget({super.key});

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
          // TAMPILKAN ANAMNESA

          if (index == 2) {
            context.read<HasilAsuhanKeperawatanBloc>().add(
                OnGetHasilAsuhanKeperawatanStatusClosedEvent(
                    noReg: singlePasien.first.noreg, status: "Closed"));
          }

          if (index == 1) {
            context.read<HasilAsuhanKeperawatanBloc>().add(
                OnGetHasilAsuhanKeperawatanEvent(
                    noReg: singlePasien.first.noreg, status: "Open"));
          }
        },
        children: menu.asMap().entries.map((e) {
          // ====== TAMPILKAN INFORMASI INDEX 1
          if (e.key == 0) {
            return const AsuhanKeperawatanPageWidget();
          }

          // TAMPILKAN ASUHAN // KEPERATAN UNTUK PENCAPAIAN
          if (e.key == 1) {
            return const PencapaianAsuhanKeperawatanContentWidget();
          }

          // TAMPILKAN RESUME
          if (e.key == 2) {
            // RESUME
            return const ResumeContentWidget();
          }

          return SizedBox(
            child: Text(
              e.value.toString(),
              style: blackTextStyle,
            ),
          );
        }).toList());
  }
}

List<String> menu = ["Asuhan Keperawatan", "Pencapaian", "Resume"];
