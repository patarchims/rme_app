import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/input_diagnosa/input_diagnosa_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_dokter/asesmen_dokter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pemeriksaan_fisik/pemeriksaan_fisik_bloc.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_medical/anamnesa_medical_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_medical/diagnosa_medical_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_medical/pemeriksaan_fisik_medical_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_medical/rencana_tindak_lanjut_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_medical/terapi_medical_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_medical/vital_sign_medical_view_widget.dart';

class SpesialisMedicalContentWidget extends StatelessWidget {
  const SpesialisMedicalContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return TabbarHeaderContentWidget(
        menu: menu,
        onTap: (index) {
          // KETIKA TOMBOL DI TEKAN
          if (index == 0) {
            context.read<AsesmenDokterBloc>().add(
                AsesmenDokterEvent.onGetAsesment(
                    value: singlePasien.first.noreg));
          }

          if (index == 2) {
            context.read<PemeriksaanFisikBloc>().add(
                PemeriksaanFisikEvent.getPemeriksaanFisikBangsal(
                    noReg: singlePasien.first.noreg));
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
        children: menu.asMap().entries.map((e) {
          // TAMPILKAN KELUHAN UTAMA KHUSU DOKTER ANAK
          if (e.key == 0) {
            return const AnamnesaMedicalWidget();
          }

          if (e.key == 1) {
            // TAMPILKAN CONTENT SPESIALIS PENYAKIT DALAM
            return const VitalSignMedicalViewWidget();
          }

          if (e.key == 4) {
            return const TerapiMedicalWidgetContentWidget();
          }

          if (e.key == 5) {
            return const RencanaTindakLanjutMedical();
          }

          if (e.key == 2) {
            return const PemeriksaanFisikMedicalWidget();
          }
          if (e.key == 3) {
            return const InputDignosaMedialRecord(
              enableEdit: true,
            );
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

List<String> menu = [
  "Asesmen",
  "Vital Sign",
  "Pemeriksaan Fisik",
  "Diagnosa",
  "Terapi",
  "Rencana Penunjang"
];
