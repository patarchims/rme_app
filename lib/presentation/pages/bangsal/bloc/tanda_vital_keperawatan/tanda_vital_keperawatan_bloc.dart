import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/pages/bangsal/repository/vital_sign_keperawatan_repository.dart';
import 'package:hms_app/presentation/pages/bangsal/services/bangsal_services.dart';

part 'tanda_vital_keperawatan_event.dart';
part 'tanda_vital_keperawatan_state.dart';

class TandaVitalKeperawatanBloc
    extends Bloc<TandaVitalKeperawatanEvent, TandaVitalKeperawatanState> {
  TandaVitalKeperawatanBloc() : super(TandaVitalKeperawatanState.initial()) {
    on<TandaVitalKeperawatanEvent>((event, emit) {});
    on<OnGetTandaVitalKeperawatanBangsal>(_onGetTandaVitalIGDDokter);
    on<OnChangedE>(_onChangedE);
    on<OnChangedV>(_onChangedV);
    on<OnChangedM>(_onChangedM);
    on<OnChangedTekananDarahEvent>(_onChangedTD);
    on<OnChangedPernapasanEvent>(_onChangedPernapasan);
    on<OnChangedSpoEvent>(_onChangedSpo2);
    on<OnSaveTandaVitalKeperawatanBangsal>(_onSaveTandaVital);
    on<OnChangedSuhuEvent>(_onChangeSuhu);
    on<OnChangedNadiEvent>(_onChangeNadi);
    on<OnChangedBeratBadanEvent>(_onChangedBeratBadan);
    on<OnChangedTinggiBadan>(_onChangedTinggiBadan);
    on<OnChangedSPO2Event>(_onChangedSPO2Event);
    on<OnChangedKesadaranEvent>(_onChangedKesadaranEvent);
    on<OnChangedPupilEvent>(_onChangedPupilEvent);
    on<OnChangedAkralEvent>(_onChangeAkralEvent);
  }

  Future<void> _onGetTandaVitalIGDDokter(
    OnGetTandaVitalKeperawatanBangsal event,
    Emitter<TandaVitalKeperawatanState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: TandaVitalKeperawatanStatus.isLoadingGet,
        vitalSignKeperawatanModel: state.vitalSignKeperawatanModel));

    try {
      final getData = await keperawatanBangsalService.onGetTandaVitalIGDDokter(
          noReg: event.noReg, person: event.person);

      VitalSignKeperawatanModel data =
          VitalSignKeperawatanModel.fromJson(getData["response"]);

      emit(state.copyWith(
        status: TandaVitalKeperawatanStatus.loaded,
        vitalSignKeperawatanModel: data,
      ));
    } catch (e) {
      emit(state.copyWith(
          status: TandaVitalKeperawatanStatus.loaded,
          vitalSignKeperawatanModel: VitalSignKeperawatanModel(
              akral: "",
              pupil: "",
              kesadaran: "",
              gcsE: "",
              gcsV: "",
              gcsM: "",
              td: "",
              beratBadan: "",
              pernafasan: "",
              spo2: "",
              nadi: "",
              suhu: "",
              tinggiBadan: "")));
    }
  }

  Future<void> _onChangedKesadaranEvent(
    OnChangedKesadaranEvent event,
    Emitter<TandaVitalKeperawatanState> emit,
  ) async {
    emit(state.copyWith(status: TandaVitalKeperawatanStatus.isChanged));
    emit(state.copyWith(
        status: TandaVitalKeperawatanStatus.loaded,
        vitalSignKeperawatanModel:
            state.vitalSignKeperawatanModel.copyWith(kesadaran: event.value)));
  }

  Future<void> _onChangedPupilEvent(
    OnChangedPupilEvent event,
    Emitter<TandaVitalKeperawatanState> emit,
  ) async {
    emit(state.copyWith(status: TandaVitalKeperawatanStatus.isChanged));
    emit(state.copyWith(
        status: TandaVitalKeperawatanStatus.loaded,
        vitalSignKeperawatanModel:
            state.vitalSignKeperawatanModel.copyWith(pupil: event.value)));
  }

  Future<void> _onChangeAkralEvent(
    OnChangedAkralEvent event,
    Emitter<TandaVitalKeperawatanState> emit,
  ) async {
    emit(state.copyWith(status: TandaVitalKeperawatanStatus.isChanged));
    emit(state.copyWith(
        status: TandaVitalKeperawatanStatus.loaded,
        vitalSignKeperawatanModel:
            state.vitalSignKeperawatanModel.copyWith(akral: event.value)));
  }

  Future<void> _onChangedSPO2Event(
    OnChangedSPO2Event event,
    Emitter<TandaVitalKeperawatanState> emit,
  ) async {
    //=====//
    emit(state.copyWith(status: TandaVitalKeperawatanStatus.isChanged));
    emit(state.copyWith(
        status: TandaVitalKeperawatanStatus.loaded,
        vitalSignKeperawatanModel:
            state.vitalSignKeperawatanModel.copyWith(spo2: event.value)));
  }

  Future<void> _onSaveTandaVital(
    OnSaveTandaVitalKeperawatanBangsal event,
    Emitter<TandaVitalKeperawatanState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: TandaVitalKeperawatanStatus.isLoadingSave,
        vitalSignKeperawatanModel: state.vitalSignKeperawatanModel));

    try {
      final saveData =
          await keperawatanBangsalService.onSaveTandaVitalKeperawatanBangsal(
              pelayanan: event.pelayanan,
              devicesID: event.deviceId,
              noReg: event.noReg,
              person: event.person,
              tandaVitalIgdDokter: event.tandaVital);

      emit(state.copyWith(
        status: TandaVitalKeperawatanStatus.loadedSave,
        saveResultFailure: optionOf(saveData),
        vitalSignKeperawatanModel: state.vitalSignKeperawatanModel,
      ));

      emit(state.copyWith(
        status: TandaVitalKeperawatanStatus.loadedSave,
        saveResultFailure: none(),
        vitalSignKeperawatanModel: state.vitalSignKeperawatanModel,
      ));
    } catch (e) {
      emit(state.copyWith(
          status: TandaVitalKeperawatanStatus.loaded,
          vitalSignKeperawatanModel: state.vitalSignKeperawatanModel));
    }
  }

  Future<void> _onChangedE(
    OnChangedE event,
    Emitter<TandaVitalKeperawatanState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(status: TandaVitalKeperawatanStatus.isChanged));
    log(event.value);
    emit(state.copyWith(
        status: TandaVitalKeperawatanStatus.loaded,
        vitalSignKeperawatanModel:
            state.vitalSignKeperawatanModel.copyWith(gcsE: event.value)));
  }

  Future<void> _onChangedTinggiBadan(
    OnChangedTinggiBadan event,
    Emitter<TandaVitalKeperawatanState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(status: TandaVitalKeperawatanStatus.isChanged));
    emit(state.copyWith(
        status: TandaVitalKeperawatanStatus.loaded,
        vitalSignKeperawatanModel: state.vitalSignKeperawatanModel
            .copyWith(tinggiBadan: event.value)));
  }

  Future<void> _onChangedBeratBadan(
    OnChangedBeratBadanEvent event,
    Emitter<TandaVitalKeperawatanState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(status: TandaVitalKeperawatanStatus.isChanged));
    log(event.value);
    emit(state.copyWith(
        status: TandaVitalKeperawatanStatus.loaded,
        vitalSignKeperawatanModel:
            state.vitalSignKeperawatanModel.copyWith(beratBadan: event.value)));
  }

  Future<void> _onChangedV(
    OnChangedV event,
    Emitter<TandaVitalKeperawatanState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(status: TandaVitalKeperawatanStatus.isChanged));
    log(event.value);
    emit(state.copyWith(
        status: TandaVitalKeperawatanStatus.loaded,
        vitalSignKeperawatanModel:
            state.vitalSignKeperawatanModel.copyWith(gcsV: event.value)));
  }

  Future<void> _onChangedM(
    OnChangedM event,
    Emitter<TandaVitalKeperawatanState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(status: TandaVitalKeperawatanStatus.isChanged));
    log(event.value);
    emit(state.copyWith(
        status: TandaVitalKeperawatanStatus.loaded,
        vitalSignKeperawatanModel:
            state.vitalSignKeperawatanModel.copyWith(gcsM: event.value)));
  }

  Future<void> _onChangeNadi(
    OnChangedNadiEvent event,
    Emitter<TandaVitalKeperawatanState> emit,
  ) async {
    // REPLACE LIST ON LIST
    log(event.value);
    emit(state.copyWith(status: TandaVitalKeperawatanStatus.isChanged));
    emit(state.copyWith(
        status: TandaVitalKeperawatanStatus.loaded,
        vitalSignKeperawatanModel:
            state.vitalSignKeperawatanModel.copyWith(nadi: event.value)));
  }

  Future<void> _onChangeSuhu(
    OnChangedSuhuEvent event,
    Emitter<TandaVitalKeperawatanState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(status: TandaVitalKeperawatanStatus.isChanged));
    log(event.value);
    emit(state.copyWith(
        status: TandaVitalKeperawatanStatus.loaded,
        vitalSignKeperawatanModel:
            state.vitalSignKeperawatanModel.copyWith(suhu: event.value)));
  }

  Future<void> _onChangedTD(
    OnChangedTekananDarahEvent event,
    Emitter<TandaVitalKeperawatanState> emit,
  ) async {
    // REPLACE LIST ON LIST

    emit(state.copyWith(status: TandaVitalKeperawatanStatus.isChanged));
    log(event.value);
    emit(state.copyWith(
        status: TandaVitalKeperawatanStatus.loaded,
        vitalSignKeperawatanModel:
            state.vitalSignKeperawatanModel.copyWith(td: event.value)));
  }

  Future<void> _onChangedPernapasan(
    OnChangedPernapasanEvent event,
    Emitter<TandaVitalKeperawatanState> emit,
  ) async {
    // REPLACE LIST ON LIST
    log(event.value);
    emit(state.copyWith(status: TandaVitalKeperawatanStatus.isChanged));

    emit(state.copyWith(
        status: TandaVitalKeperawatanStatus.loaded,
        vitalSignKeperawatanModel:
            state.vitalSignKeperawatanModel.copyWith(pernafasan: event.value)));
  }

  Future<void> _onChangedSpo2(
    OnChangedSpoEvent event,
    Emitter<TandaVitalKeperawatanState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(status: TandaVitalKeperawatanStatus.isChanged));
    log(event.value);
    emit(state.copyWith(
        status: TandaVitalKeperawatanStatus.loaded,
        vitalSignKeperawatanModel:
            state.vitalSignKeperawatanModel.copyWith(spo2: event.value)));
  }
}
