import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/perina/repository/apgar_score_response_model.dart';
import 'package:hms_app/presentation/perina/services/perina_services.dart';

part 'apgar_score_event.dart';
part 'apgar_score_state.dart';

class ApgarScoreBloc extends Bloc<ApgarScoreEvent, ApgarScoreState> {
  ApgarScoreBloc() : super(ApgarScoreState.initial()) {
    on<ApgarScoreEvent>((event, emit) {});
    on<OnGetApgarScoreEvent>(_onGetApgarScore);
    on<OnChangedJantungEvent>(_onChangedJantungEvent);
    on<OnChangedUsahaNafasEvent>(_onChangedNafasEvent);
    on<OnChangedTonusOtotEvent>(_onChangedTonusEvent);
    on<OnChangedReflesiEvent>(_onChangedRelfeksi);
    on<OnChangedKulitEvent>(_onChangedWarnaKulit);
    on<OnChangedWaktuEvent>(_onChangedWaktuEvent);
    on<OnSaveApgarScoreEvent>(_onSaveApgarScore);
  }

  _toTotal(
    Emitter<ApgarScoreState> emit,
  ) {
    emit(state.copyWith(
        socreModel: state.socreModel.copyWith(
            total: state.socreModel.jantung +
                state.socreModel.nafas +
                state.socreModel.otot +
                state.socreModel.refleksi +
                state.socreModel.warnaKulit)));
  }

  Future<void> _onSaveApgarScore(
    OnSaveApgarScoreEvent event,
    Emitter<ApgarScoreState> emit,
  ) async {
    emit(state.copyWith(status: ApgarScoreStatus.isLoadingSave));

    try {
      final saveData = await perinaServices.onSaveApgarScore(
          noReg: event.noReg, score: event.apgarScore);

      final getData = await perinaServices.onGetApgarScore(noreg: event.noReg);

      List<ApgarScoreModel> data = (getData['response'] as Iterable)
          .map((e) => ApgarScoreModel.fromJson(e))
          .toList();

      emit(state.copyWith(
          status: ApgarScoreStatus.loaded,
          dataScoreModel: data,
          saveResult: optionOf(saveData),
          socreModel: ApgarScoreModel(
              id: 0,
              waktu: "1 Menit",
              jantung: 0,
              otot: 0,
              nafas: 0,
              refleksi: 0,
              warnaKulit: 0,
              total: 0)));

      // NONE SAVE DATA
      emit(state.copyWith(
          status: ApgarScoreStatus.loaded,
          dataScoreModel: data,
          saveResult: none(),
          socreModel: ApgarScoreModel(
              id: 0,
              waktu: "1 Menit",
              jantung: 0,
              otot: 0,
              nafas: 0,
              refleksi: 0,
              warnaKulit: 0,
              total: 0)));
    } catch (e) {
      emit(state.copyWith(
          status: ApgarScoreStatus.loaded,
          dataScoreModel: [],
          saveResult: none()));
    }
  }

  Future<void> _onGetApgarScore(
    OnGetApgarScoreEvent event,
    Emitter<ApgarScoreState> emit,
  ) async {
    emit(state.copyWith(status: ApgarScoreStatus.isLoadingGet));

    try {
      // LAKUKAN GET DATA SETELAH SIMPAN DATA
      final getData = await perinaServices.onGetApgarScore(noreg: event.noReg);

      List<ApgarScoreModel> data = (getData['response'] as Iterable)
          .map((e) => ApgarScoreModel.fromJson(e))
          .toList();

      emit(state.copyWith(
          status: ApgarScoreStatus.loaded,
          dataScoreModel: data,
          socreModel: ApgarScoreModel(
              id: 0,
              waktu: "1 Menit",
              jantung: 0,
              otot: 0,
              nafas: 0,
              refleksi: 0,
              warnaKulit: 0,
              total: 0)));
    } catch (e) {
      emit(state.copyWith(status: ApgarScoreStatus.loaded, dataScoreModel: []));
    }
  }

  Future<void> _onChangedWaktuEvent(
    OnChangedWaktuEvent event,
    Emitter<ApgarScoreState> emit,
  ) async {
    emit(state.copyWith(status: ApgarScoreStatus.isLoadingGet));

    emit(state.copyWith(status: ApgarScoreStatus.onSelected));
    emit(state.copyWith(
        socreModel: state.socreModel.copyWith(waktu: event.value)));
    _toTotal(emit);
  }

  Future<void> _onChangedJantungEvent(
    OnChangedJantungEvent event,
    Emitter<ApgarScoreState> emit,
  ) async {
    emit(state.copyWith(status: ApgarScoreStatus.onSelected));
    emit(state.copyWith(
        socreModel: state.socreModel.copyWith(jantung: event.value)));
    _toTotal(emit);
  }

  Future<void> _onChangedNafasEvent(
    OnChangedUsahaNafasEvent event,
    Emitter<ApgarScoreState> emit,
  ) async {
    emit(state.copyWith(status: ApgarScoreStatus.onSelected));
    emit(state.copyWith(
        socreModel: state.socreModel.copyWith(nafas: event.value)));
    _toTotal(emit);
  }

  Future<void> _onChangedTonusEvent(
    OnChangedTonusOtotEvent event,
    Emitter<ApgarScoreState> emit,
  ) async {
    emit(state.copyWith(status: ApgarScoreStatus.onSelected));
    emit(state.copyWith(
        socreModel: state.socreModel.copyWith(otot: event.value)));
    _toTotal(emit);
  }

  Future<void> _onChangedRelfeksi(
    OnChangedReflesiEvent event,
    Emitter<ApgarScoreState> emit,
  ) async {
    emit(state.copyWith(status: ApgarScoreStatus.onSelected));
    emit(state.copyWith(
        socreModel: state.socreModel.copyWith(refleksi: event.value)));
    _toTotal(emit);
  }

  Future<void> _onChangedWarnaKulit(
    OnChangedKulitEvent event,
    Emitter<ApgarScoreState> emit,
  ) async {
    emit(state.copyWith(status: ApgarScoreStatus.onSelected));
    emit(state.copyWith(
        socreModel: state.socreModel.copyWith(warnaKulit: event.value)));
    _toTotal(emit);
  }
}
