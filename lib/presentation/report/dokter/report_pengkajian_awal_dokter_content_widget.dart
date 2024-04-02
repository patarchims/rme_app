import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/bloc.dart';
import 'package:hms_app/domain/bloc/report/report_bloc.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/report/view/bangsal/report_hasil_pengkajian_awal_medis_pasien_obstetri.dart';
import 'package:hms_app/presentation/report/view/bangsal/report_pasien_rawat_inap_medical_widget.dart';
import 'package:hms_app/presentation/report/view/bangsal/report_pengkajian_awal_pasien_rawat_jalan_anak.dart';

class ReportPengkajianDokterContentWidget extends StatelessWidget {
  const ReportPengkajianDokterContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;

    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        // CHECK SPESIALISI DOKTER
        if (state is Authenticated) {
          // check spesialisasi
          if (state.user.spesialisasi == Spesialisasi.anak) {
            // TAMPILKAN REPORT SPESIALISASI ANAK
            context.read<ReportBloc>().add(
                OnGetReportPengkajianPasienRawatInapAnak(
                    noRM: singlePasien.first.mrn,
                    noReg: singlePasien.first.noreg));
            return const Expanded(child: ReportPengkajianPasienRawatInapAnak());
          }

          if (state.user.spesialisasi == Spesialisasi.penyakitDalam) {
            context.read<ReportBloc>().add(
                OnGetReportPengkajianPasienRawatInapAnak(
                    noRM: singlePasien.first.mrn,
                    noReg: singlePasien.first.noreg));
            return const Expanded(child: ReportRawatInapMedicalWidget());
          }

          if (state.user.spesialisasi == Spesialisasi.paru) {
            context.read<ReportBloc>().add(
                OnGetReportPengkajianPasienRawatInapAnak(
                    noRM: singlePasien.first.mrn,
                    noReg: singlePasien.first.noreg));
            return const Expanded(child: ReportRawatInapMedicalWidget());
          }

          if (state.user.spesialisasi == Spesialisasi.jantung) {
            context.read<ReportBloc>().add(
                OnGetReportPengkajianPasienRawatInapAnak(
                    noRM: singlePasien.first.mrn,
                    noReg: singlePasien.first.noreg));
            return const Expanded(child: ReportRawatInapMedicalWidget());
          }

          if (state.user.spesialisasi == Spesialisasi.obgyn) {
            context.read<ReportBloc>().add(
                OnGetReportPengkajianPasienRawatInapAnak(
                    noRM: singlePasien.first.mrn,
                    noReg: singlePasien.first.noreg));
            return const ReportHasilPengkajianAwalMedisPasienObsetri();
          }
        }
        return const Placeholder();
      },
    );
  }
}
