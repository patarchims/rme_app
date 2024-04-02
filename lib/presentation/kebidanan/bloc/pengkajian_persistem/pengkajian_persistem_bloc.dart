import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/kebidanan/repository/pengkajian_response_persistem_kebidanan_model.dart';
import 'package:hms_app/presentation/kebidanan/services/kebidanan_service.dart';

part 'pengkajian_persistem_event.dart';
part 'pengkajian_persistem_state.dart';

class PengkajianPersistemBloc
    extends Bloc<PengkajianPersistemEvent, PengkajianPersistemState> {
  PengkajianPersistemBloc() : super(PengkajianPersistemState.initial()) {
    on<PengkajianPersistemEvent>((event, emit) {});
    on<OnChangedEliminasiBAK>(_onChangedEliminasiBAK);
    on<OnChangedEliminasiBAB>(_onChangedEliminasiBAB);
    on<OnChangedIstirahat>(_onChangedIstirahat);
    on<OnChangedAktivitas>(_onChangedAktivitas);
    on<OnChangedMandi>(_onChangedMandi);
    on<OnChangedBerpakaian>(_onChangedBerpakaian);
    on<OnChangedMakan>(_onChangedMakan);
    on<OnChangedEliminasi>(_onChangedEliminasi);
    on<OnChangedMobilisasi>(_onChangedMobilisasi);
    on<OnChangedKardiovaskuler>(_onChangedKardiovaskuler);
    on<OnChangedRespiratori>(_onChangedRespiratori);
    on<OnChangedPerusiSecebral>(_onChangedPerusiSecebral);
    on<OnChangedSistemPencernaan>(_onChangedSistemPencernaan);
    on<OnChangedPerfusiPefifer>(_onChangedPerfusiPerifer);
    on<OnChangedKenyamanan>(_onChangedKenyamanan);
    on<OnChangedIntegumen>(_onChangedIntegumen);
    on<OnChangedProteksi>(_onChangedProteksi);
    on<OnChangedPapsSmer>(_onChangedPapsSmer);
    on<OnChangedHamil>(_onChangedHamil);
    on<OnChangedPendaharan>(_onChangedPendarahan);
    on<OnChangedHambatanBahasa>(_onChangedHambatanBahasa);
    on<OnChangedCaraBelajar>(_onChangedCaraBelajar);
    on<OnChangedBahasaSehari>(_onChangedBahasaSehari);
    on<OnChangedSpikologis>(_onChangedSpikologis);
    on<OnChangedHambatanSosial>(_onChangedHambatanSosial);
    on<OnChangedHambatanEkomoni>(_onChangedHambatanEkonomi);
    on<OnChangedPresepsiSakit>(_onChangePresepsiSakit);
    on<OnChangedHambatanSpiritual>(_onChangedSpiritual);
    on<OnChangedNilaiKepercayaaan>(_onChangedNilaiKepercayaan);
    on<OnChangedResponseEmosi>(_onChangedResponseEmosi);
    on<OnChangedKhususKepercayaan>(_onChangeKhususKepercayaanEvent);
    on<OnGetPengkajianPersistemEvent>(_onGetPengkajianPersistemEvent);
    on<OnChangedThermoregulasi>(_onChangeThermoregulasi);
    on<OnSavePengkajianPersistemEvent>(
        _onSavePengkajianPersistemKebidananEvent);
  }

  Future<void> _onChangedEliminasiBAK(
    OnChangedEliminasiBAK event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(eliminasiBak: event.value)));
  }

  Future<void> _onGetPengkajianPersistemEvent(
    OnGetPengkajianPersistemEvent event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.isLoadingGet,
      saveResult: none(),
    ));

    // GET DATA PENGKAJIAN PESRSISTE
    try {
      final getData = await kebidananService.onGetPengkajianPersistem(
          noReg: event.noReg, person: event.person);

      PengkajianPersistemKebidananResponse data =
          PengkajianPersistemKebidananResponse.fromJson(getData["response"]);

      // PengkajianPersistemKebidananResponse
      emit(state.copyWith(
          saveResult: none(),
          status: PengkajianPersistemStatus.loaded,
          penkajianKebidanan: data));
    } catch (e) {
      emit(state.copyWith(
          saveResult: none(),
          status: PengkajianPersistemStatus.loaded,
          penkajianKebidanan: PengkajianPersistemKebidananResponse(
              thermoregulasi: "",
              eliminasiBak: "",
              eliminasiBab: "",
              istirahat: "",
              aktivitas: "",
              mandi: "",
              berpakaian: "",
              makan: "",
              eliminasi: "",
              mobilisasi: "",
              kardiovaskuler: "",
              respiratori: "",
              secebral: "",
              perfusiPerifer: "",
              pencernaan: "",
              integumen: "",
              kenyamanan: "",
              proteksi: "",
              papsSmer: "",
              hamil: "",
              pendarahan: "",
              hambatanBahasa: "",
              caraBelajar: "",
              bahasaSehari: "",
              spikologis: "",
              hambatanSosial: "",
              hambatanEkonomi: "",
              spiritual: "",
              responseEmosi: "",
              nilaiKepercayaan: "",
              presepsiSakit: "",
              khususKepercayaan: "")));
    }
  }

  Future<void> _onSavePengkajianPersistemKebidananEvent(
    OnSavePengkajianPersistemEvent event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
        status: PengkajianPersistemStatus.isLoadingSavePengkajian,
        saveResult: none()));

    try {
      final saveData = await kebidananService.savePengkajianPersistemKebisanan(
          deviceID: event.deviceID,
          noReg: event.noReg,
          pelayanan: event.pelayanan,
          pengkajianKebidanan: event.pengkajian,
          person: event.person);

      emit(state.copyWith(
        saveResult: optionOf(saveData),
        status: PengkajianPersistemStatus.loaded,
      ));
      emit(state.copyWith(
        saveResult: none(),
        status: PengkajianPersistemStatus.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(
          saveResult: none(),
          status: PengkajianPersistemStatus.loaded,
          penkajianKebidanan: PengkajianPersistemKebidananResponse(
              thermoregulasi: "",
              eliminasiBak: "",
              eliminasiBab: "",
              istirahat: "",
              aktivitas: "",
              mandi: "",
              berpakaian: "",
              makan: "",
              eliminasi: "",
              mobilisasi: "",
              kardiovaskuler: "",
              respiratori: "",
              secebral: "",
              perfusiPerifer: "",
              pencernaan: "",
              integumen: "",
              kenyamanan: "",
              proteksi: "",
              papsSmer: "",
              hamil: "",
              pendarahan: "",
              hambatanBahasa: "",
              caraBelajar: "",
              bahasaSehari: "",
              spikologis: "",
              hambatanSosial: "",
              hambatanEkonomi: "",
              spiritual: "",
              responseEmosi: "",
              nilaiKepercayaan: "",
              presepsiSakit: "",
              khususKepercayaan: "")));
    }
  }

  Future<void> _onChangedEliminasiBAB(
    OnChangedEliminasiBAB event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(eliminasiBab: event.value)));
  }

  Future<void> _onChangeThermoregulasi(
    OnChangedThermoregulasi event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(thermoregulasi: event.value)));
  }

  Future<void> _onChangedIstirahat(
    OnChangedIstirahat event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(istirahat: event.value)));
  }

  Future<void> _onChangedAktivitas(
    OnChangedAktivitas event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(aktivitas: event.value)));
  }

  Future<void> _onChangedMandi(
    OnChangedMandi event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(mandi: event.value)));
  }

  Future<void> _onChangedBerpakaian(
    OnChangedBerpakaian event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(berpakaian: event.value)));
  }

  Future<void> _onChangedMakan(
    OnChangedMakan event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(makan: event.value)));
  }

  Future<void> _onChangedEliminasi(
    OnChangedEliminasi event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(eliminasi: event.value)));
  }

  Future<void> _onChangedMobilisasi(
    OnChangedMobilisasi event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(mobilisasi: event.value)));
  }

  Future<void> _onChangedKardiovaskuler(
    OnChangedKardiovaskuler event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(kardiovaskuler: event.value)));
  }

  Future<void> _onChangedRespiratori(
    OnChangedRespiratori event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(respiratori: event.value)));
  }

  Future<void> _onChangedPerusiSecebral(
    OnChangedPerusiSecebral event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(secebral: event.value)));
  }

  Future<void> _onChangedPerfusiPerifer(
    OnChangedPerfusiPefifer event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(perfusiPerifer: event.value)));
  }

  Future<void> _onChangedSistemPencernaan(
    OnChangedSistemPencernaan event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(pencernaan: event.value)));
  }

  Future<void> _onChangedIntegumen(
    OnChangedIntegumen event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(integumen: event.value)));
  }

  Future<void> _onChangedKenyamanan(
    OnChangedKenyamanan event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(kenyamanan: event.value)));
  }

  Future<void> _onChangedProteksi(
    OnChangedProteksi event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(proteksi: event.value)));
  }

  Future<void> _onChangedPapsSmer(
    OnChangedPapsSmer event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(papsSmer: event.value)));
  }

  Future<void> _onChangedHamil(
    OnChangedHamil event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(hamil: event.value)));
  }

  Future<void> _onChangedPendarahan(
    OnChangedPendaharan event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(pendarahan: event.value)));
  }

  Future<void> _onChangedHambatanBahasa(
    OnChangedHambatanBahasa event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(hambatanBahasa: event.value)));
  }

  Future<void> _onChangedCaraBelajar(
    OnChangedCaraBelajar event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(caraBelajar: event.value)));
  }

  Future<void> _onChangedBahasaSehari(
    OnChangedBahasaSehari event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(bahasaSehari: event.value)));
  }

  Future<void> _onChangedSpikologis(
    OnChangedSpikologis event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(spikologis: event.value)));
  }

  Future<void> _onChangedHambatanSosial(
    OnChangedHambatanSosial event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(hambatanSosial: event.value)));
  }

  Future<void> _onChangedHambatanEkonomi(
    OnChangedHambatanEkomoni event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(hambatanEkonomi: event.value)));
  }

  Future<void> _onChangePresepsiSakit(
    OnChangedPresepsiSakit event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(presepsiSakit: event.value)));
  }

  Future<void> _onChangedSpiritual(
    OnChangedHambatanSpiritual event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(spiritual: event.value)));
  }

  Future<void> _onChangedNilaiKepercayaan(
    OnChangedNilaiKepercayaaan event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(nilaiKepercayaan: event.value)));
  }

  Future<void> _onChangedResponseEmosi(
    OnChangedResponseEmosi event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(responseEmosi: event.value)));
  }

  Future<void> _onChangeKhususKepercayaanEvent(
    OnChangedKhususKepercayaan event,
    Emitter<PengkajianPersistemState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianPersistemStatus.selected,
      saveResult: none(),
    ));
    emit(state.copyWith(
        saveResult: none(),
        penkajianKebidanan:
            state.penkajianKebidanan.copyWith(khususKepercayaan: event.value)));
  }
}
