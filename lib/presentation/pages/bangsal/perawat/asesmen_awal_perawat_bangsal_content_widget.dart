import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/input_diagnosa/input_diagnosa_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_dokter/asesmen_dokter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/asesmen_awal_dokter/anamnesa_rawat_inap_dokter_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/asesmen_awal/keadaan_umum_content_bangsal_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/asesmen_awal/pemeriksaan_fisik_content_bangsal_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/asesmen_awal/view_input_diagnosa_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/asesmen_awal/view_rencana_tindak_lanjut_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/asesmen_awal/vital_sign_content_perawat_bangsal_widget.dart';
import 'package:hms_app/domain/bloc/dashboard/pemeriksaan_fisik/pemeriksaan_fisik_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/riwayat_alergi/riwayat_alergi_widget_content.dart';

class AsesmenAwalPerawatBangsalContentWidget extends StatelessWidget {
  const AsesmenAwalPerawatBangsalContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return TabbarHeaderContentWidget(
        menu: menuBangsalPerawat,
        onTap: (index) {
          // TAMPILKAN ANAMNESA
          if (index == 0) {
            context.read<AsesmenDokterBloc>().add(
                AsesmenDokterEvent.onGetAsesment(
                    value: singlePasien.first.noreg));
          }
          if (index == 1) {
            context.read<PemeriksaanFisikBloc>().add(
                PemeriksaanFisikEvent.getKeadaanUmum(
                    noReg: singlePasien.first.noreg));
          }

          if (index == 4) {
            context
                .read<InputDiagnosaBloc>()
                .add(const InputDiagnosaEvent.onGetDiagnosa());
            context.read<InputDiagnosaBloc>().add(
                InputDiagnosaEvent.getDiagnosa(
                    noreg: singlePasien.first.noreg));
          }

          if (index == 2) {
            context.read<PemeriksaanFisikBloc>().add(
                PemeriksaanFisikEvent.getVitalSignResult(
                    noReg: singlePasien.first.noreg));
          }
          if (index == 3) {
            context.read<InputDiagnosaBloc>().add(
                InputDiagnosaEvent.getDiagnosa(
                    noreg: singlePasien.first.noreg));
          }
        },
        children: menuBangsalPerawat.asMap().entries.map((e) {
          // ====== TAMPILKAN INFORMASI INDEX 1
          if (e.key == 0) {
            return const AnamnesaRawatInapDokterWidget(enableEdit: false);
          }
          if (e.key == 1) {
            return const KeadaanUmumContentBangsalWidget();
          }

          if (e.key == 2) {
            return const VitalSignContentWidget();
          }

          if (e.key == 3) {
            return const PemeriksaanFisikContentWidget();
          }

          if (e.key == 4) {
            return const ViewInputDignosaWidget(enableEdit: false);
          }

          if (e.key == 5) {
            return const ViewRencanaTindakLanjutWidget();
          }

          if (e.key == 6) {
            return const RiwayatAlergiContentWidget();
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

// MENU ASESMEN AWAL BANGSAL CONTENT WIDGET FOR PERAWAT
List<String> menuBangsalPerawat = [
  "Asesmen",
  "Keadaan Umum",
  "Vital Sign",
  "Pemeriksaan Fisik",
  "Diagnosa",
  "Rencana Penunjang",
];
