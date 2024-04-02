import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/presentation/report/repository/report_asesmen_igd_respon_model.dart';
import 'package:hms_app/presentation/report/services/report_service.dart';
part 'asesmen_medis_igd_dokter_event.dart';
part 'asesmen_medis_igd_dokter_state.dart';

class ReportAsesmenMedisIgdDokterBloc
    extends Bloc<AsesmenMedisIgdDokterEvent, AsesmenMedisIgdDokterState> {
  ReportAsesmenMedisIgdDokterBloc()
      : super(AsesmenMedisIgdDokterState.initial()) {
    on<AsesmenMedisIgdDokterEvent>((event, emit) {});
    on<OnGetReportAsesmenMedisDokterIgd>(_onGetIntervensiReport);
  }

  Future<void> _onGetIntervensiReport(
    OnGetReportAsesmenMedisDokterIgd event,
    Emitter<AsesmenMedisIgdDokterState> emit,
  ) async {
    emit(state.copyWith(
        status: AsesmenMedisStatus.loading, reportIGD: state.reportIGD));

    try {
      final getData = await reportServices.getReportAsesmen(
          noReg: event.noReg,
          person: "Dokter",
          noRM: event.noRM,
          tanggal: event.tanggal);

      log(getData.toString());

      ReponseReportIgdAsesmenMedis datas =
          ReponseReportIgdAsesmenMedis.fromJson(getData["response"]);

      emit(state.copyWith(status: AsesmenMedisStatus.loaded, reportIGD: datas));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(
          status: AsesmenMedisStatus.loaded, reportIGD: state.reportIGD));
      log(e.toString());
    }
  }
}
