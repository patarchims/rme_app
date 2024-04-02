import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/input_diagnosa/input_diagnosa_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_dokter/asesmen_dokter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_igd/asesmen_igd_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pemeriksaan_fisik/pemeriksaan_fisik_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_bedah/pemeriksaan_fisik_spesialisasi_bedah_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_bedah/rencana_tindak_lanjut_bedah_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_bedah/status_lokalis_spesialisasi_bedah_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_bedah/terapi_bedah_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_bedah/vital_sign_bedah_view_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_medical/anamnesa_medical_widget.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/diagnosa_sesuai_icd/input_diagnosa.dart';

class SpesialisasiBedahContentWidget extends StatelessWidget {
  const SpesialisasiBedahContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return TabbarHeaderContentWidget(
        menu: menuBedah,
        onTap: (index) {
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

          if (index == 4) {
            context.read<AsesmenIgdBloc>().add(AsesmenIgdEvent.getStatusLokalis(
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

          if (index == 6) {
            context.read<AsesmenIgdBloc>().add(
                AsesmenIgdEvent.getRencanaTindakLanjut(
                    noreg: singlePasien.first.noreg));
          }
        },
        children: menuBedah.asMap().entries.map((e) {
          // TAMPILKAN KELUHAN UTAMA KHUSU DOKTER ANAK
          // TODO : DOKTER ANAK MEDS
          if (e.key == 0) {
            return const AnamnesaMedicalWidget();
          }

          if (e.key == 2) {
            return const PemeriksaanFisikSpesialisasiBedah();
          }

          if (e.key == 1) {
            // TAMPILKAN CONTENT SPESIALIS PENYAKIT DALAM
            return const VitalBedahViewWidget();
          }

          if (e.key == 3) {
            return const InputDignosaWidget(enableEdit: true);
          }

          // STATUS LOKALIS
          if (e.key == 4) {
            return const StatusLokalisSpesialisBedahWidget();
          }

          if (e.key == 6) {
            return const RencanaTindakLanjutBedah();
          }

          if (e.key == 5) {
            return const TerapiBedahWidgetContentWidget();
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

List<String> menuBedah = [
  "Keluhan Utama",
  "Vital Sign",
  "Pemeriksaan Fisik",
  "Diagnosis",
  "Status Lokalis",
  "Terapi Medis",
  "Rencana Penunjang"
];
