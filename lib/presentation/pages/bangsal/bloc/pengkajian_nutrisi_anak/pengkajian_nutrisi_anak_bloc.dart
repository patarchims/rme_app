import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/pages/bangsal/repository/pengkajian_nutrisi_anak_repositor.dart';
import 'package:hms_app/presentation/pages/bangsal/services/bangsal_services.dart';

part 'pengkajian_nutrisi_anak_event.dart';
part 'pengkajian_nutrisi_anak_state.dart';

class PengkajianNutrisiAnakBloc
    extends Bloc<PengkajianNutrisiAnakEvent, PengkajianNutrisiAnakState> {
  PengkajianNutrisiAnakBloc() : super(PengkajianNutrisiAnakState.initial()) {
    on<PengkajianNutrisiAnakEvent>((event, emit) {});
    on<OnGetPengkajianNutrisiAnakEvent>(_onGetPengkajianNutrisiAnak);
    on<OnSavePengkajianNutrisiAnakEvent>(_onSavePengkajianNutrisiAnak);
    on<OnChangedNilai1Event>(_onChangedNilai1Event);
    on<OnChangedNilai2Event>(_onChangedNilai2Event);
    on<OnChangedNilai3Event>(_onChangedNilai3Event);
    on<OnChangedNilai4Event>(_onChangedNilai4Event);
  }

  Future<void> _onChangedNilai1Event(
    OnChangedNilai1Event event,
    Emitter<PengkajianNutrisiAnakState> emit,
  ) async {
    emit(state.copyWith(status: PengkajianNutrisiStatus.isChanged));

    emit(state.copyWith(
        pengkajianNutrisiAnak: state.pengkajianNutrisiAnak.copyWith(
      n1: event.value,
    )));
  }

  Future<void> _onChangedNilai2Event(
    OnChangedNilai2Event event,
    Emitter<PengkajianNutrisiAnakState> emit,
  ) async {
    emit(state.copyWith(status: PengkajianNutrisiStatus.isChanged));
    emit(state.copyWith(
        pengkajianNutrisiAnak:
            state.pengkajianNutrisiAnak.copyWith(n2: event.value)));
  }

  Future<void> _onChangedNilai3Event(
    OnChangedNilai3Event event,
    Emitter<PengkajianNutrisiAnakState> emit,
  ) async {
    emit(state.copyWith(status: PengkajianNutrisiStatus.isChanged));
    emit(state.copyWith(
        pengkajianNutrisiAnak:
            state.pengkajianNutrisiAnak.copyWith(n3: event.value)));
  }

  Future<void> _onChangedNilai4Event(
    OnChangedNilai4Event event,
    Emitter<PengkajianNutrisiAnakState> emit,
  ) async {
    emit(state.copyWith(status: PengkajianNutrisiStatus.isChanged));
    emit(state.copyWith(
        pengkajianNutrisiAnak:
            state.pengkajianNutrisiAnak.copyWith(n4: event.value)));
  }

  Future<void> _onGetPengkajianNutrisiAnak(
    OnGetPengkajianNutrisiAnakEvent event,
    Emitter<PengkajianNutrisiAnakState> emit,
  ) async {
    emit(state.copyWith(status: PengkajianNutrisiStatus.isLoadingGet));

    try {
      final getData = await keperawatanBangsalService
          .onGetPengkajianNutrisiAnak(noreg: event.noReg);

      PengkajianNutrisiAnak data =
          PengkajianNutrisiAnak.fromJson(getData["response"]);

      emit(state.copyWith(
          status: PengkajianNutrisiStatus.loaded, pengkajianNutrisiAnak: data));
    } catch (e) {
      emit(state.copyWith(
        status: PengkajianNutrisiStatus.loaded,
        pengkajianNutrisiAnak: PengkajianNutrisiAnak(
            n1: "",
            n2: "",
            n3: "",
            n4: "",
            nilai: 0,
            nilaiN1: 0,
            nilaiN2: 0,
            nilaiN3: 0,
            nilaiN4: 0,
            noreg: ""),
      ));
    }

    emit(state.copyWith(status: PengkajianNutrisiStatus.loaded));
  }

  Future<void> _onSavePengkajianNutrisiAnak(
    OnSavePengkajianNutrisiAnakEvent event,
    Emitter<PengkajianNutrisiAnakState> emit,
  ) async {
    emit(state.copyWith(
        status: PengkajianNutrisiStatus.isLoadingSave,
        saveResultFailure: none()));

    try {
      // ON SAVE DATA
      final data = await keperawatanBangsalService.onSavePengkajianNutrisiAnak(
          noReg: event.noReg,
          devicesID: event.deviceID,
          nilai1: event.nilai1,
          nilai2: event.nilai2,
          nilai3: event.nilai3,
          nilai4: event.nilai4,
          nilai: event.nilai);
      //====//
      emit(state.copyWith(
          status: PengkajianNutrisiStatus.loaded,
          saveResultFailure: optionOf(data)));
      emit(state.copyWith(
          status: PengkajianNutrisiStatus.loaded, saveResultFailure: none()));
    } catch (e) {
      // ON SAVE DATA
      emit(state.copyWith(
          status: PengkajianNutrisiStatus.loaded, saveResultFailure: none()));
    }

    emit(state.copyWith(
        status: PengkajianNutrisiStatus.loaded, saveResultFailure: none()));
  }
}
