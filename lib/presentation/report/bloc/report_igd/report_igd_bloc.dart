import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/services/library_services.dart';
import 'package:hms_app/presentation/pages/igd/repository/report_ringkasan_masuk_dan_keluar_model.dart';

part 'report_igd_event.dart';
part 'report_igd_state.dart';

class ReportIgdBloc extends Bloc<ReportIgdEvent, ReportIgdState> {
  ReportIgdBloc() : super(ReportIgdState.initial()) {
    on<ReportIgdEvent>((event, emit) {});
    on<OnGetRingkasanPulang>(_onGetReportRingkasanPulang);
  }

  Future<void> _onGetReportRingkasanPulang(
    OnGetRingkasanPulang event,
    Emitter<ReportIgdState> emit,
  ) async {
    emit(state.copyWith(status: ReportIgdStatus.loading));
    try {
      final data = await libraryService.getRingkasanPulangIGD(
          noReg: event.noReg, noRM: event.noRM);

      RingkasanMasukDanKeluar datas =
          RingkasanMasukDanKeluar.fromMap(data["response"]);

      emit(state.copyWith(
          status: ReportIgdStatus.loaded, ringkasanMasukDanKeluar: datas));
    } catch (e) {
      emit(state.copyWith(status: ReportIgdStatus.loaded));
    }
  }
}
