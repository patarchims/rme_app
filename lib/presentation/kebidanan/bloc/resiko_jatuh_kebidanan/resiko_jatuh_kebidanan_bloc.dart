import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/kebidanan/repository/resiko_jatuh_kebidanan_response_model.dart';
import 'package:hms_app/presentation/kebidanan/services/kebidanan_service.dart';

part 'resiko_jatuh_kebidanan_event.dart';
part 'resiko_jatuh_kebidanan_state.dart';

class ResikoJatuhKebidananBloc
    extends Bloc<ResikoJatuhKebidananEvent, ResikoJatuhKebidananState> {
  ResikoJatuhKebidananBloc() : super(ResikoJatuhKebidananState.initial()) {
    on<ResikoJatuhKebidananEvent>((event, emit) {});
    on<OnChangedRiwayatJatuh>(_onChangeRiwayatJatuh);
    on<OnChangedDiagnosa>(_onChangedDianosa);
    on<OnChangedAlatBantu1>(_onChangedAlatBantu1);
    on<OnChangedAlatBantu2>(_onChangedAlatBantu2);
    on<OnChangedAlatBantu3>(_onChangedAlatBantu3);
    on<OnChangedInfuse>(_onChangedMenggunakanInfuse);
    on<OnSaveResikoJatuhKebidanan>(_onSaveResikoJatuh);
    on<OnGetResikoJatuhKebidanan>(_onGetResikoJatuhEvent);
  }

  void updateTotal({required Emitter<ResikoJatuhKebidananState> emit}) {
    int no = (state.resikoJatuhKebidananModel.rJatuh == "Ya") ? 25 : 0;
    int n1 = (state.resikoJatuhKebidananModel.diagnosis == "Ya") ? 15 : 0;
    int n2 = (state.resikoJatuhKebidananModel.alatBantu1 == "Ya") ? 0 : 0;
    int n3 = (state.resikoJatuhKebidananModel.alatBantu2 == "Ya") ? 15 : 0;
    int n4 = (state.resikoJatuhKebidananModel.alatBantu3 == "Ya") ? 30 : 0;
    int n5 = (state.resikoJatuhKebidananModel.terpasangInfuse == "Ya") ? 20 : 0;
    emit(state.copyWith(
        resikoJatuhKebidananModel: state.resikoJatuhKebidananModel
            .copyWith(total: no + n1 + n2 + n3 + n4 + n5)));
  }

  void setKetearngan({required Emitter<ResikoJatuhKebidananState> emit}) {
    emit(state.copyWith(
        resikoJatuhKebidananModel: state.resikoJatuhKebidananModel.copyWith(
            keterangan: (state.resikoJatuhKebidananModel.total) < 25
                ? "Tidak beresiko/resiko rendah"
                : (state.resikoJatuhKebidananModel.total) <= 44
                    ? "Resiko Sedang - Dipasang gelang kuning"
                    : "Resiko Tinggi - Dipasang gelang kuning")));
  }

  Future<void> _onSaveResikoJatuh(
    OnSaveResikoJatuhKebidanan event,
    Emitter<ResikoJatuhKebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(
        state.copyWith(status: ResikoStatus.isLoadingSave, saveResult: none()));

    final saveData = await kebidananService.onSaveResikoJatuhKebidanan(
        noReg: event.noReg,
        inserPC: event.device,
        pelayanan: event.pelayanan,
        resikoJatuh: event.resikoJatuhKebidananModel);

    emit(state.copyWith(
        status: ResikoStatus.loadedSave, saveResult: optionOf(saveData)));

    emit(state.copyWith(status: ResikoStatus.loadedSave, saveResult: none()));
  }

  Future<void> _onGetResikoJatuhEvent(
    OnGetResikoJatuhKebidanan event,
    Emitter<ResikoJatuhKebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: ResikoStatus.isLoadingGetResikoJatuh, saveResult: none()));

    try {
      final data = await kebidananService.getResikoJatuhKebidanan(
        noReg: event.noReg,
      );

      ResikoJatuhKebidananModel datas =
          ResikoJatuhKebidananModel.fromJson(data["response"]);

      emit(state.copyWith(
          resikoJatuhKebidananModel: datas,
          status: ResikoStatus.loaded,
          saveResult: none()));

      emit(state.copyWith(status: ResikoStatus.loaded, saveResult: none()));
      setKetearngan(emit: emit);
    } catch (e) {
      emit(state.copyWith(status: ResikoStatus.loaded, saveResult: none()));
    }
  }

  Future<void> _onChangeRiwayatJatuh(
    OnChangedRiwayatJatuh event,
    Emitter<ResikoJatuhKebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        resikoJatuhKebidananModel:
            state.resikoJatuhKebidananModel.copyWith(rJatuh: event.value)));

    updateTotal(emit: emit);
    setKetearngan(emit: emit);
  }

  Future<void> _onChangedDianosa(
    OnChangedDiagnosa event,
    Emitter<ResikoJatuhKebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        resikoJatuhKebidananModel:
            state.resikoJatuhKebidananModel.copyWith(diagnosis: event.value)));
    updateTotal(emit: emit);
    setKetearngan(emit: emit);
  }

  Future<void> _onChangedAlatBantu1(
    OnChangedAlatBantu1 event,
    Emitter<ResikoJatuhKebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        resikoJatuhKebidananModel: state.resikoJatuhKebidananModel.copyWith(
      alatBantu1: event.value,
    )));
    updateTotal(emit: emit);
    setKetearngan(emit: emit);
  }

  Future<void> _onChangedAlatBantu2(
    OnChangedAlatBantu2 event,
    Emitter<ResikoJatuhKebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        resikoJatuhKebidananModel: state.resikoJatuhKebidananModel.copyWith(
      alatBantu2: event.value,
    )));
    updateTotal(emit: emit);
    setKetearngan(emit: emit);
  }

  Future<void> _onChangedAlatBantu3(
    OnChangedAlatBantu3 event,
    Emitter<ResikoJatuhKebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        resikoJatuhKebidananModel: state.resikoJatuhKebidananModel.copyWith(
      alatBantu3: event.value,
    )));
    updateTotal(emit: emit);
    setKetearngan(emit: emit);
  }

  Future<void> _onChangedMenggunakanInfuse(
    OnChangedInfuse event,
    Emitter<ResikoJatuhKebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST

    emit(state.copyWith(
        resikoJatuhKebidananModel: state.resikoJatuhKebidananModel.copyWith(
      terpasangInfuse: event.value,
    )));
    updateTotal(emit: emit);
    setKetearngan(emit: emit);
  }
}
