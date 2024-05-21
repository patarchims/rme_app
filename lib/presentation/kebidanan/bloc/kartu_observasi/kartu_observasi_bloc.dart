import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/kebidanan/repository/kartu_cairan_model_repository.dart';
import 'package:hms_app/presentation/kebidanan/repository/kartu_observasi_model_repository.dart';
import 'package:hms_app/presentation/kebidanan/services/kebidanan_service.dart';

part 'kartu_observasi_event.dart';
part 'kartu_observasi_state.dart';

class KartuObservasiBloc
    extends Bloc<KartuObservasiEvent, KartuObservasiState> {
  KartuObservasiBloc() : super(KartuObservasiState.initial()) {
    on<KartuObservasiEvent>((event, emit) {});
    on<OnSaveKartuObservasiEvent>(_onSaveKartuObservasiEvent);
    on<OnGetKartuObservasiEvent>(_onGetKartuObservasiEvent);
    on<OnSaveKartuCarianEvent>(_onSaveKartuCairanEvent);
    on<OnGetKartuCairanEvent>(_onGetKartuCairanEvent);
  }

  Future<void> _onSaveKartuObservasiEvent(
    OnSaveKartuObservasiEvent event,
    Emitter<KartuObservasiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: KartuObservasiStaus.loading, saveVitalSignResult: none()));

    try {
      final saveData = await kebidananService.onSaveKartuObservasi(
          noReg: event.noReg,
          anggotaGerak: event.anggotaGerak,
          cvp: event.cvp,
          ekg: event.ekg,
          isiCUP: event.isiCUP,
          kesadaran: event.kesadaran,
          keterangan: event.keterangan,
          n: event.n,
          p: event.p,
          redaksiKa: event.redaksiKa,
          redaksiKi: event.redaksiKi,
          s: event.s,
          sputumWarna: event.sputumWarna,
          t: event.t,
          ukuranKa: event.ukuranKa,
          ukuranKi: event.ukuranKi);

      emit(state.copyWith(
          saveVitalSignResult: optionOf(saveData),
          status: KartuObservasiStaus.loaded));

      emit(state.copyWith(
          saveVitalSignResult: optionOf(saveData),
          status: KartuObservasiStaus.loaded));
    } catch (e) {
      emit(state.copyWith(
          saveVitalSignResult: none(), status: KartuObservasiStaus.loaded));
    }
  }

  Future<void> _onSaveKartuCairanEvent(
    OnSaveKartuCarianEvent event,
    Emitter<KartuObservasiState> emit,
  ) async {
    emit(state.copyWith(
        status: KartuObservasiStaus.isLoadingSave, saveKartuCairan: none()));

    try {
      // try simpan data
      final getData = await kebidananService.onSaveKartuCairan(
          cairanKeluar: event.cairanKeluar,
          cairanKeluarNgt: event.cairanNgt,
          drainDll: event.drainDll,
          keterangan: event.keterangan,
          cairanMasuk1: event.cairanMasuk1,
          cairanMasuk2: event.cairanMasuk2,
          cairanMasuk3: event.cairanMasuk3,
          cairanMasuk: event.cairanMasuk,
          cairanMasukNgt: event.cairanMasukNgt,
          namaCairan: event.namaCairan,
          noReg: event.noReg);

      // get data

      emit(state.copyWith(
          status: KartuObservasiStaus.loaded,
          saveVitalSignResult: none(),
          saveKartuCairan: optionOf(getData),
          kartuObservasi: state.kartuObservasi));

      emit(state.copyWith(
          status: KartuObservasiStaus.loaded,
          saveVitalSignResult: none(),
          saveKartuCairan: none(),
          kartuObservasi: state.kartuObservasi));

      //==
    } catch (e) {
      // TRY
      emit(state.copyWith(
          status: KartuObservasiStaus.loaded,
          saveVitalSignResult: none(),
          saveKartuCairan: none(),
          kartuObservasi: state.kartuObservasi));
    }
  }

  Future<void> _onGetKartuCairanEvent(
    OnGetKartuCairanEvent event,
    Emitter<KartuObservasiState> emit,
  ) async {
    emit(state.copyWith(
      status: KartuObservasiStaus.isLoadingGetKartuCairan,
      saveVitalSignResult: none(),
      saveKartuCairan: none(),
    ));

    //====//
    try {
      //===
      final getData =
          await kebidananService.onGetKartuCairan(noReg: event.noReg);

      List<KartuCairanRepository> value = (getData["response"] as Iterable)
          .map((e) => KartuCairanRepository.fromMap(e))
          .toList();

      // == //
      emit(state.copyWith(
          status: KartuObservasiStaus.loaded, kartuCairan: value));
    } catch (e) {
      //===
      emit(state.copyWith(status: KartuObservasiStaus.loaded, kartuCairan: []));
    }
  }

  // ==== ON GET KARTU OBSERVASI
  Future<void> _onGetKartuObservasiEvent(
    OnGetKartuObservasiEvent event,
    Emitter<KartuObservasiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: KartuObservasiStaus.isLoadingGet, saveVitalSignResult: none()));

    try {
      final data = await kebidananService.onGetObservasi(noReg: event.noReg);

      List<KartuObservasiModelRepository> value = (data["response"] as Iterable)
          .map((e) => KartuObservasiModelRepository.fromMap(e))
          .toList();

      emit(state.copyWith(
          kartuObservasi: value, status: KartuObservasiStaus.loaded));
    } catch (e) {
      emit(state.copyWith(
          saveVitalSignResult: none(), status: KartuObservasiStaus.loaded));
    }
  }
}
