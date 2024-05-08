import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/pages/icu/repository/vital_sign_icu_repository.dart';
import 'package:hms_app/presentation/pages/icu/services/icu_services.dart';

part 'vital_sign_icu_event.dart';
part 'vital_sign_icu_state.dart';

class VitalSignIcuBloc extends Bloc<VitalSignIcuEvent, VitalSignIcuState> {
  VitalSignIcuBloc() : super(VitalSignIcuState.initial()) {
    on<VitalSignIcuEvent>((event, emit) {});
    on<OnGetVitalSignEvent>(_onGetVitalSignICUEvent);
    on<OnChangedTekananDarahEvent>(_onChangedTekananDarah);
    on<OnChangedNadiEvent>(_onChangedNadi);
    on<OnChangedBeratBadanEvent>(_onChangedBeratBadan);
    on<OnChangedSuhuEvent>(_onChangedSuhu);
    on<OnChangedPernapasanICUEvent>(_onChangedPernapasan);
    on<OnChangedTinggiBadanEvent>(_onChangedTinggiBadan);
    on<OnSaveVitalSignEvent>(_onSaveVitalSign);
  }

  Future<void> _onGetVitalSignICUEvent(
    OnGetVitalSignEvent event,
    Emitter<VitalSignIcuState> emit,
  ) async {
    emit(
        state.copyWith(status: VitalSignIcuStatus.initial, saveResult: none()));

    try {
      emit(state.copyWith(
          status: VitalSignIcuStatus.isLoadingGet, saveResult: none()));

      final getData = await icuServices.onGetVitalSignICU(
          noReg: event.noReg, person: event.person, pelayanan: event.pelayanan);

      VitalSignIcuModel datas = VitalSignIcuModel.fromJson(getData["response"]);

      emit(state.copyWith(
          status: VitalSignIcuStatus.loaded,
          vitalSignIcu: datas,
          saveResult: none()));
    } catch (e) {
      emit(state.copyWith(
        vitalSignIcu: VitalSignIcuModel(
            tekananDarah: "",
            nadi: "",
            beratBadan: "",
            suhu: "",
            pernapasan: "",
            tinggiBadan: ""),
        status: VitalSignIcuStatus.loaded,
      ));
    }
  }

  // ======================= ONCHANGED TEKANAN DARAH
  Future<void> _onChangedTekananDarah(
    OnChangedTekananDarahEvent event,
    Emitter<VitalSignIcuState> emit,
  ) async {
    emit(state.copyWith(
        status: VitalSignIcuStatus.isChanged, saveResult: none()));

    emit(state.copyWith(
        vitalSignIcu: state.vitalSignIcu.copyWith(tekananDarah: event.value)));
  }

  Future<void> _onChangedNadi(
    OnChangedNadiEvent event,
    Emitter<VitalSignIcuState> emit,
  ) async {
    emit(state.copyWith(
        status: VitalSignIcuStatus.isChanged, saveResult: none()));

    emit(state.copyWith(
        vitalSignIcu: state.vitalSignIcu.copyWith(nadi: event.value)));
  }

  Future<void> _onChangedBeratBadan(
    OnChangedBeratBadanEvent event,
    Emitter<VitalSignIcuState> emit,
  ) async {
    emit(state.copyWith(
        status: VitalSignIcuStatus.isChanged, saveResult: none()));

    emit(state.copyWith(
        vitalSignIcu: state.vitalSignIcu.copyWith(beratBadan: event.value)));
  }

  Future<void> _onChangedSuhu(
    OnChangedSuhuEvent event,
    Emitter<VitalSignIcuState> emit,
  ) async {
    emit(state.copyWith(
        status: VitalSignIcuStatus.isChanged, saveResult: none()));

    emit(state.copyWith(
        vitalSignIcu: state.vitalSignIcu.copyWith(suhu: event.value)));
  }

  Future<void> _onChangedPernapasan(
    OnChangedPernapasanICUEvent event,
    Emitter<VitalSignIcuState> emit,
  ) async {
    emit(state.copyWith(
        status: VitalSignIcuStatus.isChanged, saveResult: none()));

    emit(state.copyWith(
        vitalSignIcu: state.vitalSignIcu.copyWith(pernapasan: event.value)));
  }

  Future<void> _onChangedTinggiBadan(
    OnChangedTinggiBadanEvent event,
    Emitter<VitalSignIcuState> emit,
  ) async {
    emit(state.copyWith(
        status: VitalSignIcuStatus.isChanged, saveResult: none()));

    emit(state.copyWith(
        vitalSignIcu: state.vitalSignIcu.copyWith(tinggiBadan: event.value)));
  }

  Future<void> _onSaveVitalSign(
    OnSaveVitalSignEvent event,
    Emitter<VitalSignIcuState> emit,
  ) async {
    emit(state.copyWith(
        status: VitalSignIcuStatus.isLoadingSave, saveResult: none()));

    // ============== //
    final onSaveData = await icuServices.onSaveVitalSignICU(
        kategori: event.kategori,
        vitalSignICU: event.vitalSign,
        deviceID: event.devicesID,
        pelayanan: event.pelayanan,
        person: event.person,
        noreg: event.noReg);

    emit(state.copyWith(
        status: VitalSignIcuStatus.loaded, saveResult: optionOf(onSaveData)));

    emit(state.copyWith(status: VitalSignIcuStatus.loaded, saveResult: none()));
  }
}
