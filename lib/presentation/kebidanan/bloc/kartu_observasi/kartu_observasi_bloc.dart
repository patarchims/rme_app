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
    on<OnDeleteKartuObservasiEvent>(_onDeleteKartuObservasiEvent);
    on<OnUpdateKartuObservasiEvent>(_onUpdateKartuObservasiEvent);
    on<OnDeleteKartuCairanEvent>(_onDeleteKartuCairanEvent);
    on<OnUpdateKartuCairanEvent>(_onUpdateKartuCairanEvent);
  }

  Future<void> _onSaveKartuObservasiEvent(
    OnSaveKartuObservasiEvent event,
    Emitter<KartuObservasiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
      status: KartuObservasiStaus.loading,
      saveVitalSignResult: none(),
      onDeleteKartuObservasiResult: none(),
      onDeleteKartuCairanResult: none(),
    ));

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
          onDeleteKartuObservasiResult: none(),
          status: KartuObservasiStaus.loaded));

      final data = await kebidananService.onGetObservasi(noReg: event.noReg);

      List<KartuObservasiModelRepository> value = (data["response"] as Iterable)
          .map((e) => KartuObservasiModelRepository.fromMap(e))
          .toList();

      emit(state.copyWith(
          saveVitalSignResult: none(),
          kartuObservasi: value,
          onDeleteKartuObservasiResult: none(),
          status: KartuObservasiStaus.loaded));

      // ------ //
    } catch (e) {
      emit(state.copyWith(
          onDeleteKartuObservasiResult: none(),
          saveVitalSignResult: none(),
          status: KartuObservasiStaus.loaded));
    }
  }

  Future<void> _onSaveKartuCairanEvent(
    OnSaveKartuCarianEvent event,
    Emitter<KartuObservasiState> emit,
  ) async {
    emit(state.copyWith(
      status: KartuObservasiStaus.isLoadingSave,
      saveKartuCairan: none(),
      onDeleteKartuObservasiResult: none(),
      onDeleteKartuCairanResult: none(),
    ));

    try {
      // try simpan data
      final getData = await kebidananService.onSaveKartuCairan(
        cairanKeluarNgt: event.cairanKeluarNgt,
        drainDll: event.drainDll,
        keterangan: event.keterangan,
        cairanMasuk1: event.cairanMasuk1,
        cairanMasuk2: event.cairanMasuk2,
        cairanMasuk3: event.cairanMasuk3,
        cairanMasuk: event.cairanMasuk,
        cairanMasukNgt: event.cairanMasukNgt,
        cairanKeluarUrine: event.cairanKeluarUrine,
        namaCairan: event.namaCairan,
        noReg: event.noReg,
      );

      // get data

      emit(state.copyWith(
          status: KartuObservasiStaus.loaded,
          saveVitalSignResult: none(),
          saveKartuCairan: optionOf(getData),
          onDeleteKartuObservasiResult: none(),
          kartuObservasi: state.kartuObservasi));

      // GET KARTU CAIRAN
      final dat = await kebidananService.onGetKartuCairan(noReg: event.noReg);

      List<KartuCairanRepository> value = (dat["response"] as Iterable)
          .map((e) => KartuCairanRepository.fromMap(e))
          .toList();

      emit(state.copyWith(
          status: KartuObservasiStaus.loaded,
          saveVitalSignResult: none(),
          kartuCairan: value,
          saveKartuCairan: none(),
          kartuObservasi: state.kartuObservasi));

      //==
    } catch (e) {
      // TRY
      emit(state.copyWith(
          status: KartuObservasiStaus.loaded,
          saveVitalSignResult: none(),
          onDeleteKartuObservasiResult: none(),
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
      onDeleteKartuObservasiResult: none(),
      onDeleteKartuCairanResult: none(),
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
        status: KartuObservasiStaus.isLoadingGet,
        saveVitalSignResult: none(),
        onDeleteKartuObservasiResult: none(),
        onDeleteKartuCairanResult: none()));

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

  Future<void> _onDeleteKartuObservasiEvent(
    OnDeleteKartuObservasiEvent event,
    Emitter<KartuObservasiState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: KartuObservasiStaus.loading,
        onDeleteKartuCairanResult: none(),
        onDeleteKartuObservasiResult: none(),
        onUpdatekartuCairan: none(),
        saveKartuCairan: none(),
        saveVitalSignResult: none(),
      ));

      final delete = await kebidananService.onDeleteKartuObservasi(
        idKartu: event.idKartu,
      );

      emit(state.copyWith(
        onDeleteKartuObservasiResult: optionOf(delete),
        status: KartuObservasiStaus.loaded,
      ));

      final data = await kebidananService.onGetObservasi(noReg: event.noReg);

      List<KartuObservasiModelRepository> value = (data["response"] as Iterable)
          .map((e) => KartuObservasiModelRepository.fromMap(e))
          .toList();

      emit(state.copyWith(
          kartuObservasi: value,
          status: KartuObservasiStaus.loaded,
          onUpdatekartuCairan: none(),
          saveVitalSignResult: none(),
          saveKartuCairan: none(),
          onDeleteKartuCairanResult: none(),
          onDeleteKartuObservasiResult: none()));

      // GET DATA HERE
    } catch (e) {
      emit(state.copyWith(
        status: KartuObservasiStaus.loaded,
        onDeleteKartuObservasiResult: none(),
      ));
    }
  }

  Future<void> _onUpdateKartuObservasiEvent(
    OnUpdateKartuObservasiEvent event,
    Emitter<KartuObservasiState> emit,
  ) async {
    emit(state.copyWith(
        status: KartuObservasiStaus.isLoadingUpdate,
        saveVitalSignResult: none(),
        onDeleteKartuCairanResult: none(),
        saveKartuCairan: none()));

    try {
      emit(state.copyWith(
          status: KartuObservasiStaus.isLoadingUpdate,
          saveVitalSignResult: none(),
          onDeleteKartuCairanResult: none(),
          saveKartuCairan: none()));

      //lakukan update kartu observasi
      final update = await kebidananService.onUpdateKartuObservasiEvent(
          noReg: event.noReg,
          idObservasi: event.idObservasi,
          t: event.t,
          n: event.n,
          p: event.p,
          s: event.s,
          cvp: event.cvp,
          ekg: event.ekg,
          pupilKiri: event.pupilKiri,
          pupilKanan: event.pupilKanan,
          redaksiKiri: event.redaksiKiri,
          redaksiKanan: event.redaksiKanan,
          anggoataBadan: event.anggoataBadan,
          kesadaran: event.kesadaran,
          sputumWarna: event.sputumWarna,
          isiCup: event.isiCup,
          keterangan: event.keterangan);

      emit(state.copyWith(
          status: KartuObservasiStaus.isLoadingUpdate,
          onUpdatekartuCairan: optionOf(update)));

      final data = await kebidananService.onGetObservasi(noReg: event.noReg);

      List<KartuObservasiModelRepository> value = (data["response"] as Iterable)
          .map((e) => KartuObservasiModelRepository.fromMap(e))
          .toList();

      emit(state.copyWith(
          saveVitalSignResult: none(),
          kartuObservasi: value,
          onUpdatekartuCairan: none(),
          onDeleteKartuObservasiResult: none(),
          status: KartuObservasiStaus.loaded));

      //===//
    } catch (e) {
      emit(state.copyWith(
          status: KartuObservasiStaus.isLoadingUpdate,
          saveVitalSignResult: none(),
          onDeleteKartuCairanResult: none(),
          saveKartuCairan: none()));
    }
  }

  Future<void> _onUpdateKartuCairanEvent(
    OnUpdateKartuCairanEvent event,
    Emitter<KartuObservasiState> emit,
  ) async {
    // ON UPDATE KARTU CAIRAN EVENT
    emit(state.copyWith(
      status: KartuObservasiStaus.isLoadingUpdate,
      onUpdatekartuCairan: none(),
    ));

    try {
      // ON FAILURE
      final update = await kebidananService.onUpdateKartuCairanEvent(
        idKartu: event.idKartu,
        cairanMasuk1: event.cairamMasuk1,
        cairanMasuk2: event.cairamMasuk2,
        cairanMasuk3: event.cairamMasuk3,
        cairanMasukNgt: event.cairamMasukNgt,
        namaCairan: event.namaCairan,
        cairanKeluarUrine: event.cairanKeluarUrine,
        cairanKeluarNgt: event.cairanKeluarNgt,
        drainDll: event.drain,
        keterangan: event.keterangan,
      );

      // ON UPDATE
      emit(state.copyWith(
        status: KartuObservasiStaus.loaded,
        onUpdatekartuCairan: optionOf(update),
      ));
    } catch (e) {
      // ON
      emit(state.copyWith(
        status: KartuObservasiStaus.loaded,
        onUpdatekartuCairan: none(),
      ));
    }
  }

  Future<void> _onDeleteKartuCairanEvent(
    OnDeleteKartuCairanEvent event,
    Emitter<KartuObservasiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: KartuObservasiStaus.isLoadingGet,
        saveVitalSignResult: none(),
        onDeleteKartuCairanResult: none()));

    try {
      final data =
          await kebidananService.onDeleteKartuCairan(idKartu: event.idKartu);

      emit(state.copyWith(
          status: KartuObservasiStaus.loaded,
          onDeleteKartuCairanResult: optionOf(data)));

      final datas = await kebidananService.onGetObservasi(noReg: event.noReg);

      // GET DATA KARTU CAIRAN
      List<KartuCairanRepository> value = (datas["response"] as Iterable)
          .map((e) => KartuCairanRepository.fromMap(e))
          .toList();

      emit(state.copyWith(
          kartuObservasi: state.kartuObservasi,
          status: KartuObservasiStaus.loaded,
          onDeleteKartuCairanResult: none(),
          kartuCairan: value));
    } catch (e) {
      emit(state.copyWith(
          saveVitalSignResult: none(), status: KartuObservasiStaus.loaded));
    }
  }
}
