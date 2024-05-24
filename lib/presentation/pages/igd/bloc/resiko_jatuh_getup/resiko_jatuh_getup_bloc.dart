import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/igd/repository/resiko_jatuh_getup_and_gotest_igd_model.dart';
import 'package:hms_app/presentation/pages/igd/services/igd_services.dart';

part 'resiko_jatuh_getup_event.dart';
part 'resiko_jatuh_getup_state.dart';

class ResikoJatuhGetupBloc
    extends Bloc<ResikoJatuhGetupEvent, ResikoJatuhGetupState> {
  ResikoJatuhGetupBloc() : super(ResikoJatuhGetupState.initial()) {
    on<ResikoJatuhGetupEvent>((event, emit) {});
    on<OnChangeResikoJatuh1Event>(_onChangedResikoJatuh1Event);
    on<OnChangeResikoJatuh2Event>(_onChangedResikoJatuh2Event);
    on<OnGetResikoJatuhGetUpGoTestEvent>(_onGetGetUpAndGoTest);
    on<OnSaveResikoJatuhGetUpGoTestEvent>(_onSaveResikoJatuhG);
  }

  Future<void> _onChangedResikoJatuh1Event(
    OnChangeResikoJatuh1Event event,
    Emitter<ResikoJatuhGetupState> emit,
  ) async {
    emit(state.copyWith(status: ResikoJatuhGetupStatus.onSelected));
    emit(state.copyWith(
      resikoJatuh: state.resikoJatuh.copyWith(
          resikoJatuh1: event.value,
          tindakan: (event.value == "Ya" &&
                  state.resikoJatuh.resikoJatuh1 == "Ya")
              ? "RISIKO TINGGI - Pasang Pin Kuning, Edukasi"
              : (event.value == "Tidak" &&
                      state.resikoJatuh.resikoJatuh1 == "Tidak")
                  ? "TIDAK BERISIKO - Tidak Ada Tindakan"
                  : (event.value == "" && state.resikoJatuh.resikoJatuh1 == "")
                      ? ""
                      : "RISIKO RENDAH - Edukasi"),
    ));
  }

  Future<void> _onChangedResikoJatuh2Event(
    OnChangeResikoJatuh2Event event,
    Emitter<ResikoJatuhGetupState> emit,
  ) async {
    emit(state.copyWith(status: ResikoJatuhGetupStatus.onSelected));
    emit(state.copyWith(
      resikoJatuh: state.resikoJatuh.copyWith(
          resikoJatuh2: event.value,
          tindakan: (event.value == "Ya" &&
                  state.resikoJatuh.resikoJatuh1 == "Ya")
              ? "RISIKO TINGGI - Pasang Pin Kuning, Edukasi"
              : (event.value == "Tidak" &&
                      state.resikoJatuh.resikoJatuh1 == "Tidak")
                  ? "TIDAK BERISIKO - Tidak Ada Tindakan"
                  : (event.value == "" && state.resikoJatuh.resikoJatuh1 == "")
                      ? ""
                      : "RISIKO RENDAH - Edukasi"),
    ));
  }

  Future<void> _onSaveResikoJatuhG(
    OnSaveResikoJatuhGetUpGoTestEvent event,
    Emitter<ResikoJatuhGetupState> emit,
  ) async {
    emit(state.copyWith(
      status: ResikoJatuhGetupStatus.isLoadingSave,
      saveResult: none(),
    ));

    try {
      final saveData = await igdServices.onSaveResikoJatuhGoUpAndGoTest(
          deviceID: event.deviceID,
          pelayanan: event.pelayanan,
          person: event.person,
          noreg: event.noReg,
          resikoJatuh1: event.resikoJatuh1,
          resikoJatuh2: event.resikoJatuh2,
          tindakan: event.tindakan);

      emit(state.copyWith(
        status: ResikoJatuhGetupStatus.loaded,
        saveResult: optionOf(saveData),
        resikoJatuh: state.resikoJatuh,
      ));
      emit(state.copyWith(
        status: ResikoJatuhGetupStatus.loaded,
        saveResult: none(),
        resikoJatuh: state.resikoJatuh,
      ));
    } catch (e) {
      //
      emit(state.copyWith(
        status: ResikoJatuhGetupStatus.loaded,
        saveResult: none(),
        resikoJatuh: state.resikoJatuh,
      ));
    }
  }

  // TOD
  Future<void> _onGetGetUpAndGoTest(
    OnGetResikoJatuhGetUpGoTestEvent event,
    Emitter<ResikoJatuhGetupState> emit,
  ) async {
    emit(state.copyWith(status: ResikoJatuhGetupStatus.isLoadingGet));

    try {
      //===//
      final getData = await igdServices.onGetResikoJatuhGoUpAndGoTest(
        noRM: event.noRM,
        noReg: event.noReg,
      );

      ResikoJatuhGetUpAndGoTestRepository getDatas =
          ResikoJatuhGetUpAndGoTestRepository.fromMap(getData["response"]);

      emit(state.copyWith(
          status: ResikoJatuhGetupStatus.loaded,
          saveResult: none(),
          resikoJatuh: getDatas));
    } catch (e) {
      emit(state.copyWith(
          status: ResikoJatuhGetupStatus.loaded,
          saveResult: none(),
          resikoJatuh: ResikoJatuhGetUpAndGoTestRepository(
              resikoJatuh1: "", resikoJatuh2: "", tindakan: "")));
    }
  }
}
