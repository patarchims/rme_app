import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/pages/igd/repository/asesment_repository.dart';
import 'package:hms_app/presentation/pages/igd/services/igd_services.dart';

import '../../../../../domain/network/api_failure_handler.dart';

part 'keluhan_utama_event.dart';
part 'keluhan_utama_state.dart';

class KeluhanUtamaBloc extends Bloc<KeluhanUtamaEvent, KeluhanUtamaState> {
  KeluhanUtamaBloc() : super(KeluhanUtamaState.initial()) {
    on<KeluhanUtamaEvent>((event, emit) {});
    on<OnSaveKeluhanUtamaEvent>(_onSaveKeluhanUtamaIGD);
    on<OnChangedKeluhanUtama>(_onChangeKeluhanUtama);
    on<OnChangedRiwayatSekarang>(_onChangeRiwayatSekarang);
    on<OnGetKeluhanUtamaEvent>(_onGetKeluhanUtama);
    on<OnSaveRiwayatKeluargaEvent>(_onSaveRiwayatPenyakitKeluarga);
  }

  Future<void> _onGetKeluhanUtama(
    OnGetKeluhanUtamaEvent event,
    Emitter<KeluhanUtamaState> emit,
  ) async {
    emit(state.copyWith(
        status: KeluhanUtamaStatus.loading,
        saveResultFailure: none(),
        keluhanUtamaDokterIgd: state.keluhanUtamaDokterIgd));

    try {
      final saveData = await igdServices.onGetKeluhanUtama(
          noRM: event.noRM,
          noReg: event.noReg,
          person: event.person,
          tanggal: event.tanggal);

      KeluhanUtamaDokterIgd keluhan =
          KeluhanUtamaDokterIgd.fromJson(saveData["response"]);

      log(keluhan.toString());

      emit(state.copyWith(
          saveResultFailure: none(),
          keluhanUtamaDokterIgd: keluhan,
          status: KeluhanUtamaStatus.loaded));
    } catch (e) {
      emit(state.copyWith(
        saveResultFailure: none(),
        keluhanUtamaDokterIgd: state.keluhanUtamaDokterIgd,
        status: KeluhanUtamaStatus.error,
      ));
    }
  }

  Future<void> _onSaveRiwayatPenyakitKeluarga(
    OnSaveRiwayatKeluargaEvent event,
    Emitter<KeluhanUtamaState> emit,
  ) async {
    emit(state.copyWith(
        status: KeluhanUtamaStatus.isLoadingSaveKeluarga,
        saveResultFailure: none(),
        keluhanUtamaDokterIgd: state.keluhanUtamaDokterIgd));

    // try {
    final saveData = await igdServices.onSaveRiwayatPenyakitKeluarga(
        noRM: event.noRM,
        noReg: event.noReg,
        person: event.person,
        namaKeluarga: event.value,
        tanggal: event.tanggal);

    KeluhanUtamaDokterIgd keluhan =
        KeluhanUtamaDokterIgd.fromJson(saveData["response"]);

    log(keluhan.toString());

    emit(state.copyWith(
        saveResultFailure: none(),
        keluhanUtamaDokterIgd: keluhan,
        status: KeluhanUtamaStatus.isLoadedSave));
    // } catch (e) {
    //   emit(state.copyWith(
    //     saveResultFailure: none(),
    //     keluhanUtamaDokterIgd: state.keluhanUtamaDokterIgd,
    //     status: KeluhanUtamaStatus.error,
    //   ));
    // }
  }

  Future<void> _onSaveKeluhanUtamaIGD(
    OnSaveKeluhanUtamaEvent event,
    Emitter<KeluhanUtamaState> emit,
  ) async {
    emit(state.copyWith(
        status: KeluhanUtamaStatus.isLoadingSave,
        saveResultFailure: none(),
        keluhanUtamaDokterIgd: state.keluhanUtamaDokterIgd));

    final saveData = await igdServices.saveAsesmenIGD(
        keluhanUtama: event.keluhanUtama,
        deviceID: event.deviceID,
        riwayatSekarang: event.riwayatSekarang,
        noRM: event.noRM,
        noReg: event.noReg,
        pelayanan: event.pelayanan,
        person: event.person,
        tanggal: event.tanggal);

    emit(state.copyWith(
        saveResultFailure: optionOf(saveData),
        status: KeluhanUtamaStatus.isLoadedSave,
        keluhanUtamaDokterIgd: state.keluhanUtamaDokterIgd));

    emit(state.copyWith(
        saveResultFailure: none(),
        status: KeluhanUtamaStatus.isLoadedSave,
        keluhanUtamaDokterIgd: state.keluhanUtamaDokterIgd));
  }

  Future<void> _onChangeKeluhanUtama(
    OnChangedKeluhanUtama event,
    Emitter<KeluhanUtamaState> emit,
  ) async {
    emit(state.copyWith(
        status: KeluhanUtamaStatus.loaded,
        saveResultFailure: none(),
        keluhanUtamaDokterIgd: state.keluhanUtamaDokterIgd.copyWith(
            asesmen: state.keluhanUtamaDokterIgd.asesmen
                .copyWith(keluhUtama: event.valu))));
  }

  Future<void> _onChangeRiwayatSekarang(
    OnChangedRiwayatSekarang event,
    Emitter<KeluhanUtamaState> emit,
  ) async {
    emit(state.copyWith(
        status: KeluhanUtamaStatus.loaded,
        saveResultFailure: none(),
        keluhanUtamaDokterIgd: state.keluhanUtamaDokterIgd.copyWith(
            asesmen: state.keluhanUtamaDokterIgd.asesmen
                .copyWith(rwtSekarang: event.value))));
  }
}
