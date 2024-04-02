import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/pages/bangsal/repository/report_skala_nyeri_repository.dart';
import 'package:hms_app/presentation/pages/bangsal/services/bangsal_services.dart';
import 'package:hms_app/presentation/perina/repository/asesmen_skala_nyeri_response_model.dart';

part 'asesmen_nyeri_event.dart';
part 'asesmen_nyeri_state.dart';

class AsesmenNyeriBloc extends Bloc<AsesmenNyeriEvent, AsesmenNyeriState> {
  AsesmenNyeriBloc() : super(AsesmenNyeriState.initial()) {
    on<AsesmenNyeriEvent>((event, emit) {});
    on<OnCHangedAsesmenNyeri>(_onSaveCPPTBangsal);
    on<OnGetAsesemenNyeri>(_onGetAsesemenNyeri);
    on<OnSaveAsesemenNyeri>(_onSaveAsesmenNyeri);
    on<OnGetReportAsesmenNyeri>(_onGetReportSkalaNyeri);
  }

  Future<void> _onSaveCPPTBangsal(
    OnCHangedAsesmenNyeri event,
    Emitter<AsesmenNyeriState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenNyeriStatus.isChanged));
    emit(state.copyWith(
        status: AsesmenNyeriStatus.loaded,
        skalaNyeri: state.skalaNyeri.copyWith(skalaNyeri: event.skalaNyeri)));
  }

  Future<void> _onGetAsesemenNyeri(
    OnGetAsesemenNyeri event,
    Emitter<AsesmenNyeriState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenNyeriStatus.isLoadingGet));
    //==//
    final getData = await keperawatanBangsalService.onGetSkalaAsesmenNyeri(
        noReg: event.noReg);

    SkalaNyeriResponse data = SkalaNyeriResponse.fromJson(getData["response"]);

    emit(state.copyWith(status: AsesmenNyeriStatus.loaded, skalaNyeri: data));
  }

  Future<void> _onSaveAsesmenNyeri(
    OnSaveAsesemenNyeri event,
    Emitter<AsesmenNyeriState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenNyeriStatus.isLoadingSave));
    //==//
    final saveData =
        await keperawatanBangsalService.onSaveAsesmenNyeriKeperawatan(
            devicesID: event.devicesID,
            pelayanan: event.pelayanan,
            skalaNyeri: event.skalaNyeri,
            person: event.person,
            noReg: event.noReg);

    emit(state.copyWith(
        status: AsesmenNyeriStatus.loaded,
        saveResultFailure: optionOf(saveData)));

    emit(state.copyWith(
        status: AsesmenNyeriStatus.loaded, saveResultFailure: none()));
  }

  Future<void> _onGetReportSkalaNyeri(
    OnGetReportAsesmenNyeri event,
    Emitter<AsesmenNyeriState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenNyeriStatus.isLoadingGet));

    //==//
    try {
      final report = await keperawatanBangsalService.onReportAsesmenSkalaNyeri(
          noReg: event.noReg);

      // ReportSkalaNyeri
      ReportSkalaNyeri data = ReportSkalaNyeri.fromJson(report["response"]);

      emit(state.copyWith(
          status: AsesmenNyeriStatus.loaded,
          reportSkalaNyeri: data,
          saveResultFailure: none()));
    } catch (e) {
      emit(state.copyWith(
          status: AsesmenNyeriStatus.loaded, saveResultFailure: none()));
    }
  }
}
