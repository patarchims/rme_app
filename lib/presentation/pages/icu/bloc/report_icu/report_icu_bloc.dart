import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/presentation/kebidanan/repository/kartu_cairan_model_repository.dart';
import 'package:hms_app/presentation/kebidanan/repository/kartu_observasi_model_repository.dart';
import 'package:hms_app/presentation/kebidanan/services/kebidanan_service.dart';
import 'package:hms_app/presentation/pages/icu/repository/report_asesmen_ulang_intensive_repository.dart';
import 'package:hms_app/presentation/pages/icu/services/icu_services.dart';

part 'report_icu_event.dart';
part 'report_icu_state.dart';

class ReportIcuBloc extends Bloc<ReportIcuEvent, ReportIcuState> {
  ReportIcuBloc() : super(ReportIcuState.initial()) {
    on<ReportIcuEvent>((event, emit) {});
    on<OnGetReportAsesmenUlangIntensive>(_onGetReportAsesmenUlangIntensive);
    on<OnGetReportKartuCairan>(_onGetReportKartuCairan);
    on<OnGetReportKartuObservasi>(_onGetReportKartuObservasi);
  }

  Future<void> _onGetReportAsesmenUlangIntensive(
    OnGetReportAsesmenUlangIntensive event,
    Emitter<ReportIcuState> emit,
  ) async {
    emit(state.copyWith(status: ReportIcuStatus.isLoadingGet));

    try {
      final onGetData = await icuServices.onGetAsesmenPerawatanIntensiveICU(
        noReg: event.noReg,
        pelayanan: event.person,
        tanggal: event.tanggal,
        person: event.person,
      );

      ReportPerawatanIntensiveIcuModel datas =
          ReportPerawatanIntensiveIcuModel.fromJson(onGetData["response"]);

      emit(state.copyWith(
          reportIntensiveIcuModel: datas, status: ReportIcuStatus.loaded));
    } catch (e) {
      emit(state.copyWith(status: ReportIcuStatus.loaded));
    }
  }

  Future<void> _onGetReportKartuObservasi(
    OnGetReportKartuObservasi event,
    Emitter<ReportIcuState> emit,
  ) async {
    emit(
      state.copyWith(status: ReportIcuStatus.isLoadingGet),
    );

    try {
      final data = await kebidananService.onGetObservasi(noReg: event.noReg);

      List<KartuObservasiModelRepository> value = (data["response"] as Iterable)
          .map((e) => KartuObservasiModelRepository.fromMap(e))
          .toList();

      emit(state.copyWith(
        kartuObservasi: value,
        status: ReportIcuStatus.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(status: ReportIcuStatus.loaded));
    }
  }

  Future<void> _onGetReportKartuCairan(
    OnGetReportKartuCairan event,
    Emitter<ReportIcuState> emit,
  ) async {
    emit(state.copyWith(status: ReportIcuStatus.isLoadingGet));

    try {
      final getData =
          await kebidananService.onGetKartuCairan(noReg: event.noReg);

      List<KartuCairanRepository> value = (getData["response"] as Iterable)
          .map((e) => KartuCairanRepository.fromMap(e))
          .toList();

      // == //
      emit(state.copyWith(
        status: ReportIcuStatus.loaded,
        kartuCairan: value,
      ));
    } catch (e) {
      emit(state.copyWith(status: ReportIcuStatus.loaded));
    }
  }
}
