import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/kebidanan/repository/asesmen_reponse_kebidanan_model.dart';
import 'package:hms_app/presentation/kebidanan/services/kebidanan_service.dart';
import 'package:hms_app/presentation/pages/bangsal/services/bangsal_services.dart';

part 'keluhan_utama_kebidanan_event.dart';
part 'keluhan_utama_kebidanan_state.dart';

class KeluhanUtamaKebidananBloc
    extends Bloc<KeluhanUtamaKebidananEvent, KeluhanUtamaKebidananState> {
  KeluhanUtamaKebidananBloc() : super(KeluhanUtamaKebidananState.initial()) {
    on<KeluhanUtamaKebidananEvent>((event, emit) {});
    on<OnChangedKeluhanUtamaEvent>(_onChangedKeluhanUtamaEvent);
    on<OnChangedRiwayatPenyakit>(_onChangedRiwayatPenyakit);
    on<OnChangedRiwayatMenstruasi>(_onChangedRiwayatMenstruasiEvent);
    on<OnChangedKeluhanMenyertai>(_onChangedKeluhanMenyertaiEvent);
    on<OnChangedSiklusHaid>(_onChangedSiklusHaidEvent);
    on<OnChangedRiwayatPernikahan>(_onChangedRiwaytPenikahan);
    on<OnGetAsesmenKebidananEvent>(_onGetAsesmenAwalKebidanan);
    on<OnSaveAsesmenKebidananEvent>(_onSaveAsesmenKebidananEvent);
    on<OnChangedRiwayatPenyakitDahulu>(_onChangedRiwayatPenyakitDahulu);
    on<OnSavePengkajianRiwayatPenyakitKeluarga>(_onSaveRiwayatPenyakitKeluarga);
  }

  Future<void> _onChangedKeluhanUtamaEvent(
    OnChangedKeluhanUtamaEvent event,
    Emitter<KeluhanUtamaKebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: KeluhanUtamaKebidananStatus.onChanged, saveResult: none()));

    emit(state.copyWith(
        saveResult: none(),
        asesmenKebidananResponseModel: state.asesmenKebidananResponseModel
            .copyWith(
                asesmen: state.asesmenKebidananResponseModel.asesmen
                    .copyWith(keluhanUtama: event.value))));
  }

  Future<void> _onSaveRiwayatPenyakitKeluarga(
    OnSavePengkajianRiwayatPenyakitKeluarga event,
    Emitter<KeluhanUtamaKebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: KeluhanUtamaKebidananStatus.isSavePenyakitKeluarga,
        saveResult: none()));

    try {
      await keperawatanBangsalService.savePenyakitKeluargaEvent(
          noRM: event.noRM, penyakit: event.riwayatPenyakitKelurga);

      final getData = await kebidananService.getAsesmenKebidanan(
          noReg: event.noReg, person: event.person);

      AsesmenKebidananResponseModel data =
          AsesmenKebidananResponseModel.fromJson(getData["response"]);

      emit(state.copyWith(
          asesmenKebidananResponseModel: data,
          saveResult: none(),
          status: KeluhanUtamaKebidananStatus.loaded));
    } catch (e) {
      emit(state.copyWith(
          asesmenKebidananResponseModel: AsesmenKebidananResponseModel(
              riwayatPenyakitKeluarga: [],
              riwayatTerdahulu: [],
              asesmen: Asesmen(
                  noreg: "",
                  keluhanUtama: "",
                  rwytPenyakit: "",
                  rwytMenstruasi: "",
                  keluhanMenyertai: "",
                  siklusHaid: "",
                  rwytPenikahan: "",
                  rwytDahulu: "")),
          status: KeluhanUtamaKebidananStatus.loaded,
          saveResult: none()));
    }
  }

  Future<void> _onSaveAsesmenKebidananEvent(
    OnSaveAsesmenKebidananEvent event,
    Emitter<KeluhanUtamaKebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: KeluhanUtamaKebidananStatus.isloadingSaveData,
        saveResult: none()));

    try {
      final saveData = await kebidananService.saveAsesmenKebidanan(
          riwayatDahulu: event.riwayatDahulu,
          noReg: event.noReg,
          person: event.person,
          deviceID: event.deviceID,
          keluhanMenyertai: event.keluhanMenyertai,
          keluhanUtama: event.keluhanUtama,
          pelayanan: event.pelayanan,
          penyakitSekarang: event.penyakitSekarang,
          riwayatMenstruasi: event.riwayatMenstruasi,
          riwayataPernikahan: event.riwayatPernikahan,
          siklusHaid: event.siklusHaid);

      emit(state.copyWith(
          asesmenKebidananResponseModel: state.asesmenKebidananResponseModel,
          saveResult: optionOf(saveData),
          status: KeluhanUtamaKebidananStatus.loaded));

      // ==== //
      emit(state.copyWith(
          asesmenKebidananResponseModel: state.asesmenKebidananResponseModel,
          saveResult: none(),
          status: KeluhanUtamaKebidananStatus.loaded));

      // LOADED
    } catch (e) {
      emit(state.copyWith(
          asesmenKebidananResponseModel: state.asesmenKebidananResponseModel,
          saveResult: none(),
          status: KeluhanUtamaKebidananStatus.loaded));
    }
  }

  Future<void> _onGetAsesmenAwalKebidanan(
    OnGetAsesmenKebidananEvent event,
    Emitter<KeluhanUtamaKebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: KeluhanUtamaKebidananStatus.isLoadingGetData,
        saveResult: none()));

    try {
      // GET DATA
      final getData = await kebidananService.getAsesmenKebidanan(
          noReg: event.noReg, person: event.person);

      AsesmenKebidananResponseModel data =
          AsesmenKebidananResponseModel.fromJson(getData["response"]);

      emit(state.copyWith(
          asesmenKebidananResponseModel: data,
          saveResult: none(),
          status: KeluhanUtamaKebidananStatus.loaded));

      //==//
    } catch (e) {
      emit(state.copyWith(
          asesmenKebidananResponseModel: AsesmenKebidananResponseModel(
              riwayatPenyakitKeluarga: [],
              riwayatTerdahulu: [],
              asesmen: Asesmen(
                  noreg: "",
                  keluhanUtama: "",
                  rwytPenyakit: "",
                  rwytMenstruasi: "",
                  keluhanMenyertai: "",
                  siklusHaid: "",
                  rwytPenikahan: "",
                  rwytDahulu: "")),
          status: KeluhanUtamaKebidananStatus.loaded,
          saveResult: none()));
    }
  }

  Future<void> _onChangedRiwayatPenyakitDahulu(
    OnChangedRiwayatPenyakitDahulu event,
    Emitter<KeluhanUtamaKebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
      status: KeluhanUtamaKebidananStatus.onChanged,
      saveResult: none(),
    ));

    emit(state.copyWith(
        saveResult: none(),
        asesmenKebidananResponseModel: state.asesmenKebidananResponseModel
            .copyWith(
                asesmen: state.asesmenKebidananResponseModel.asesmen
                    .copyWith(rwytDahulu: event.value))));
  }

  Future<void> _onChangedRiwayatPenyakit(
    OnChangedRiwayatPenyakit event,
    Emitter<KeluhanUtamaKebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
      status: KeluhanUtamaKebidananStatus.onChanged,
      saveResult: none(),
    ));

    emit(state.copyWith(
        saveResult: none(),
        asesmenKebidananResponseModel: state.asesmenKebidananResponseModel
            .copyWith(
                asesmen: state.asesmenKebidananResponseModel.asesmen
                    .copyWith(rwytPenyakit: event.value))));
  }

  Future<void> _onChangedRiwayatMenstruasiEvent(
    OnChangedRiwayatMenstruasi event,
    Emitter<KeluhanUtamaKebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
      status: KeluhanUtamaKebidananStatus.onChanged,
      saveResult: none(),
    ));

    emit(state.copyWith(
        saveResult: none(),
        asesmenKebidananResponseModel: state.asesmenKebidananResponseModel
            .copyWith(
                asesmen: state.asesmenKebidananResponseModel.asesmen
                    .copyWith(rwytMenstruasi: event.value))));
  }

  Future<void> _onChangedKeluhanMenyertaiEvent(
    OnChangedKeluhanMenyertai event,
    Emitter<KeluhanUtamaKebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: KeluhanUtamaKebidananStatus.onChanged, saveResult: none()));

    emit(state.copyWith(
        saveResult: none(),
        asesmenKebidananResponseModel: state.asesmenKebidananResponseModel
            .copyWith(
                asesmen: state.asesmenKebidananResponseModel.asesmen
                    .copyWith(keluhanMenyertai: event.value))));
  }

  Future<void> _onChangedSiklusHaidEvent(
    OnChangedSiklusHaid event,
    Emitter<KeluhanUtamaKebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
      status: KeluhanUtamaKebidananStatus.onChanged,
      saveResult: none(),
    ));

    emit(state.copyWith(
        saveResult: none(),
        asesmenKebidananResponseModel: state.asesmenKebidananResponseModel
            .copyWith(
                asesmen: state.asesmenKebidananResponseModel.asesmen
                    .copyWith(siklusHaid: event.value))));
  }

  Future<void> _onChangedRiwaytPenikahan(
    OnChangedRiwayatPernikahan event,
    Emitter<KeluhanUtamaKebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(
      state.copyWith(
        status: KeluhanUtamaKebidananStatus.onChanged,
        saveResult: none(),
      ),
    );

    emit(state.copyWith(
        saveResult: none(),
        asesmenKebidananResponseModel: state.asesmenKebidananResponseModel
            .copyWith(
                asesmen: state.asesmenKebidananResponseModel.asesmen
                    .copyWith(rwytPenikahan: event.value))));
  }
}
