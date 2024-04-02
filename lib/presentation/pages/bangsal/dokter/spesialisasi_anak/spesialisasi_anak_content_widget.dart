import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/input_diagnosa/input_diagnosa_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_dokter/asesmen_dokter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_igd/asesmen_igd_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pemeriksaan_fisik/pemeriksaan_fisik_bloc.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_anak/anamnesa_spesialis_anak_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_anak/diagnosa_anak_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_anak/pemeriksaan_fisik_spesialis_anak_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_anak/prognosis_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_anak/terapi_anak_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_anak/vital_sign_anak_view_widget.dart';

class SpesialisasiAnakContentWidget extends StatelessWidget {
  const SpesialisasiAnakContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return TabbarHeaderContentWidget(
        menu: menuBangsalDokterAnak,
        onTap: (index) {
          // FUNGSI KETIKA DI TEKAN
          if (index == 0) {
            context.read<AsesmenDokterBloc>().add(
                AsesmenDokterEvent.onGetAsesment(
                    value: singlePasien.first.noreg));
          }
          if (index == 2) {
            context.read<PemeriksaanFisikBloc>().add(
                PemeriksaanFisikEvent.onGetPemeriksaanFisikAnak(
                    noReg: singlePasien.first.noreg));
          }
          if (index == 4) {
            context.read<AsesmenIgdBloc>().add(
                AsesmenIgdEvent.getRencanaTindakLanjut(
                    noreg: singlePasien.first.noreg));
          }

          if (index == 3) {
            context
                .read<InputDiagnosaBloc>()
                .add(const InputDiagnosaEvent.onGetDiagnosa());

            context.read<InputDiagnosaBloc>().add(
                InputDiagnosaEvent.getDiagnosa(
                    noreg: singlePasien.first.noreg));
          }
        },
        children: menuBangsalDokterAnak.asMap().entries.map((e) {
          // TAMPILKAN KELUHAN UTAMA KHUSU DOKTER ANAK
          // TODO : DOKTER ANAK MEDS
          if (e.key == 0) {
            return const AnamnesaSpesialisAnakContentWidget();
          }

          if (e.key == 2) {
            return const PemeriksaanFisikSpesialisasiAnak();
          }

          if (e.key == 1) {
            // TAMPILKAN CONTENT SPESIALIS PENYAKIT DALAM
            return const VitalAnakViewWidget();
          }

          if (e.key == 3) {
            return const InputDignosaSpesialisAnak(enableEdit: true);
          }

          if (e.key == 5) {
            return const TerapiAnakWidgetContentWidget();
          }

          if (e.key == 4) {
            return const PrognosisContentAnakWidget();
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

List<String> menuBangsalDokterAnak = [
  "Keluhan Utama",
  "Vital Sign",
  "Pemeriksaan Fisik",
  "Diagnosa",
  "Prognosis",
  "Terapi",
];
