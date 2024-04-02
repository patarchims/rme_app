import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/perina/repository/ddown_score_perina_response_model.dart';
import 'package:hms_app/presentation/perina/services/perina_services.dart';

part 'down_score_neonatus_event.dart';
part 'down_score_neonatus_state.dart';

class DownScoreNeonatusBloc
    extends Bloc<DownScoreNeonatusEvent, DownScoreNeonatusState> {
  DownScoreNeonatusBloc() : super(DownScoreNeonatusState.initial()) {
    on<DownScoreNeonatusEvent>((event, emit) {});
    on<OnGetDownScoreNeoNatus>(_onSaveRiwayatPengobatanDirumah);
    on<OnChangeFrekwesiEvent>(_onChangedFrekwensiEvent);
    on<OnChangedSianosisEvent>(_onChangedSianosisEvent);
    on<OnChangeMerintihEvent>(_onChangedMerintiEvent);
    on<OnChangedRetraksiEvent>(_onChangedRetraksiEvent);
    on<OnChangedAirEntryEvent>(_onChangedAirEntryEvent);
    on<OnSaveScroeNeoNatus>(_onSaveScoreNeoNatus);
  }

  _toTotal(
    Emitter<DownScoreNeonatusState> emit,
  ) {
    emit(state.copyWith(
        score: state.score.copyWith(
            total: state.score.airEntry +
                state.score.merintih +
                state.score.nifas +
                state.score.retraksi +
                state.score.sianosis)));
  }

  Future<void> _onSaveRiwayatPengobatanDirumah(
    OnGetDownScoreNeoNatus event,
    Emitter<DownScoreNeonatusState> emit,
  ) async {
    emit(state.copyWith(
        status: DownScoreStatus.isLoadingGet, saveResult: none()));

    try {
      final getData =
          await perinaServices.onGetNeoNatusPerina(noreg: event.noReg);

      DDownScorePerinaModel data =
          DDownScorePerinaModel.fromJson(getData["response"]);

      emit(state.copyWith(status: DownScoreStatus.loaded, score: data));
    } catch (e) {
      emit(state.copyWith(
        status: DownScoreStatus.loaded,
      ));
    }
  }

  Future<void> _onSaveScoreNeoNatus(
    OnSaveScroeNeoNatus event,
    Emitter<DownScoreNeonatusState> emit,
  ) async {
    emit(state.copyWith(status: DownScoreStatus.isLoadingSave));
    try {
      final save = await perinaServices.onSaveScoreNeonatus(
          person: event.person, noReg: event.noReg, neoNatus: state.score);

      emit(state.copyWith(
          status: DownScoreStatus.loaded, saveResult: optionOf(save)));

      emit(state.copyWith(status: DownScoreStatus.loaded, saveResult: none()));
    } catch (e) {
      emit(state.copyWith(
        saveResult: none(),
        status: DownScoreStatus.loaded,
      ));
    }
  }

  Future<void> _onChangedFrekwensiEvent(
    OnChangeFrekwesiEvent event,
    Emitter<DownScoreNeonatusState> emit,
  ) async {
    emit(
        state.copyWith(status: DownScoreStatus.onSelected, saveResult: none()));

    emit(state.copyWith(score: state.score.copyWith(nifas: event.value)));

    _toTotal(emit);
  }

  Future<void> _onChangedSianosisEvent(
    OnChangedSianosisEvent event,
    Emitter<DownScoreNeonatusState> emit,
  ) async {
    emit(
        state.copyWith(status: DownScoreStatus.onSelected, saveResult: none()));

    emit(state.copyWith(score: state.score.copyWith(sianosis: event.value)));

    _toTotal(emit);
  }

  Future<void> _onChangedRetraksiEvent(
    OnChangedRetraksiEvent event,
    Emitter<DownScoreNeonatusState> emit,
  ) async {
    emit(
        state.copyWith(status: DownScoreStatus.onSelected, saveResult: none()));

    emit(state.copyWith(score: state.score.copyWith(retraksi: event.value)));

    _toTotal(emit);
  }

  Future<void> _onChangedAirEntryEvent(
    OnChangedAirEntryEvent event,
    Emitter<DownScoreNeonatusState> emit,
  ) async {
    emit(
        state.copyWith(status: DownScoreStatus.onSelected, saveResult: none()));

    emit(state.copyWith(score: state.score.copyWith(airEntry: event.value)));

    _toTotal(emit);
  }

  Future<void> _onChangedMerintiEvent(
    OnChangeMerintihEvent event,
    Emitter<DownScoreNeonatusState> emit,
  ) async {
    emit(
        state.copyWith(status: DownScoreStatus.onSelected, saveResult: none()));

    emit(state.copyWith(score: state.score.copyWith(merintih: event.value)));

    _toTotal(emit);
  }
}
