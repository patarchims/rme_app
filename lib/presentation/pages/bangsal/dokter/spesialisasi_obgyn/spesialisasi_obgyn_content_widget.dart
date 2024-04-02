import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/input_diagnosa/input_diagnosa_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_dokter/asesmen_dokter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_igd/asesmen_igd_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pemeriksaan_fisik/pemeriksaan_fisik_bloc.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_obgyn/anamnesa_spesialisasi_obgyn.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_obgyn/diagnosa_obgyn_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_obgyn/pemeriksaan_fisik_obgyn_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_obgyn/rencana_tindak_lanjut_obgyn_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_obgyn/vital_sign_obgyn_view_widget.dart';

class SpesialisasiObgynContentWidget extends StatelessWidget {
  const SpesialisasiObgynContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return TabbarHeaderContentWidget(
        menu: menuBedah,
        onTap: (index) {
          // JIKA DI TEKAN
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

          if (index == 4) {
            context.read<AsesmenIgdBloc>().add(
                AsesmenIgdEvent.getRencanaTindakLanjut(
                    noreg: singlePasien.first.noreg));
          }
        },
        children: menuBedah.asMap().entries.map((e) {
          // TAMPILKAN KELUHAN UTAMA KHUSU DOKTER ANAK
          // TODO : DOKTER ANAK MEDS
          if (e.key == 0) {
            return const AnamnesaSpesialisasiObgyn();
          }

          if (e.key == 1) {
            // TAMPILKAN CONTENT SPESIALIS PENYAKIT DALAM
            return const VitalSignObginViewWidget();
          }

          if (e.key == 2) {
            return const PemeriksaanFisikObgynWidget();
          }

          if (e.key == 3) {
            return const InputDignosaObgynWidget(enableEdit: true);
          }

          if (e.key == 4) {
            return const RencanaTindakLanjutSpeasialisasiObgyn();
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
  "Diagnosa",
  "Rencana Penunjang"
];
