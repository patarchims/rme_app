import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/models/response/alergi/riwayat_alergi_pasien_model.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/repository/report/report_triase_response_model.dart';
import 'package:hms_app/domain/services/library_services.dart';
part 'alergi_event.dart';
part 'alergi_state.dart';

class AlergiBloc extends Bloc<AlergiEvent, AlergiState> {
  AlergiBloc() : super(AlergiState.initial()) {
    on<AlergiEvent>((event, emit) {});
    on<OnSaveAlergiObatEvent>(_onSaveAlergiObat);
    on<OnGetRiwayatAlergi>(_onGetRiwayatAlergi);
    on<OnDeleteAlergi>(_onDeleteAlergi);
    on<OnSavePenyakitKeluarga>(_onSavePenyakitKeluarga);
    on<OnRemovePenyakitKeluargaEvent>(_onRemovePenyakitKeluarga);
    on<OnSaveRiwayatPenyakitKeluargaEvent>(_onSaveRiwayatPenyakitKeluarga);
    on<OnGetPenyakitKeluarga>(_onGetAlergiKeluarga);
    on<OnGetAlergiKeluargaEvent>(_onGetAlergiKeluargaEvent);
  }

  Future<void> _onSaveAlergiObat(
    OnSaveAlergiObatEvent event,
    Emitter<AlergiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: AlergiStatus.isLoadingSaveAlergiObat,
        getData: none(),
        saveAlergiObat: none()));

    final saveObat = await libraryService.insertAlergi(
        noRM: event.noRM,
        kelompok: event.kelompok,
        alergi: event.alergi,
        namaUser: event.namaUser);

    emit(state.copyWith(
      status: AlergiStatus.isLoadedAlergiObat,
      saveAlergiObat: optionOf(saveObat),
    ));
  }

  Future<void> _onGetAlergiKeluargaEvent(
    OnGetAlergiKeluargaEvent event,
    Emitter<AlergiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: AlergiStatus.isLoadingSaveAlergiObat,
        getData: none(),
        saveAlergiObat: none()));

    final saveObat = await libraryService.onGetPenyakitKeluarga(
        noRM: event.noRM, noReg: event.noReg);

    emit(state.copyWith(
      status: AlergiStatus.isLoadedAlergiObat,
      saveAlergiObat: optionOf(saveObat),
    ));
  }

  Future<void> _onSaveRiwayatPenyakitKeluarga(
    OnSaveRiwayatPenyakitKeluargaEvent event,
    Emitter<AlergiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: AlergiStatus.isLoadingPenyakitKeluarga,
        getData: none(),
        saveAlergiObat: none()));

    try {
      final saveObat = await libraryService.insertPenyakitKeluargaV2(
          noRM: event.noRM, alergi: event.alergi, namaUser: event.namaUser);

      emit(state.copyWith(
          status: AlergiStatus.loadedPenyakitKeluarga,
          alergiData: state.alergiData,
          onSaveRiwayatAlergi: optionOf(saveObat)));

      emit(state.copyWith(
          status: AlergiStatus.loadedPenyakitKeluarga,
          alergiData: state.alergiData,
          onSaveRiwayatAlergi: none()));
    } catch (e) {
      emit(state.copyWith(
          status: AlergiStatus.error, getData: none(), saveAlergiObat: none()));
    }
  }

  Future<void> _onGetAlergiKeluarga(
    OnGetPenyakitKeluarga event,
    Emitter<AlergiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: AlergiStatus.isLoadingSaveAlergiObat,
        getData: none(),
        saveAlergiObat: none()));

    try {
      final saveObat = await libraryService.onGetRiwayatAlergi(
          noRM: event.noRM, noReg: event.noReg);

      List<AlergiResponse> dokter = (saveObat["response"] as Iterable)
          .map((e) => AlergiResponse.fromJson(e))
          .toList();

      log("GET DATA KELUARGA");
      log(saveObat.toString());

      emit(state.copyWith(
          status: AlergiStatus.loadedPenyakitKeluarga, alergiData: dokter));
    } catch (e) {
      emit(state.copyWith(
          status: AlergiStatus.loadedPenyakitKeluarga, alergiData: []));
    }
  }

  Future<void> _onRemovePenyakitKeluarga(
    OnRemovePenyakitKeluargaEvent event,
    Emitter<AlergiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    log("ON REMOVE PENYAKIT KELUARGA ");

    emit(state.copyWith(
        status: AlergiStatus.isLoadingRemovePenyakitKeluarga,
        getData: none(),
        saveAlergiObat: none()));

    try {
      final saveObat = await libraryService.onDeletePenyakitKeluarga(
          kelompok: event.kelompok, noRM: event.noRm, nomor: event.nomor);

      List<AlergiResponse> dokter = (saveObat["response"] as Iterable)
          .map((e) => AlergiResponse.fromJson(e))
          .toList();

      log(dokter.toString());

      emit(state.copyWith(
          status: AlergiStatus.loadedPenyakitKeluarga, alergiData: dokter));
    } catch (e) {
      emit(state.copyWith(status: AlergiStatus.error));
    }
  }

  Future<void> _onSavePenyakitKeluarga(
    OnSavePenyakitKeluarga event,
    Emitter<AlergiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: AlergiStatus.isLoadingPenyakitKeluarga,
        getData: none(),
        saveAlergiObat: none()));

    try {
      final saveObat = await libraryService.insertPenyakitKeluargaV2(
          noRM: event.noRM, alergi: event.alergi, namaUser: event.namaUser);

      emit(state.copyWith(
          status: AlergiStatus.loadedPenyakitKeluarga,
          alergiData: state.alergiData,
          onSaveRiwayatAlergi: optionOf(saveObat)));

      emit(state.copyWith(
          status: AlergiStatus.loadedPenyakitKeluarga,
          alergiData: state.alergiData,
          onSaveRiwayatAlergi: none()));
    } catch (e) {
      emit(state.copyWith(
          status: AlergiStatus.error, getData: none(), saveAlergiObat: none()));
    }
  }

  Future<void> _onDeleteAlergi(
    OnDeleteAlergi event,
    Emitter<AlergiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: AlergiStatus.isLoadingDeleteAlergi,
        getData: none(),
        onDeleteAlergi: none()));

    try {
      final data = await libraryService.onDeleteALergi(
        noRm: event.noRM,
        no: event.no,
        kelompok: event.kelompok,
      );

      emit(state.copyWith(
          status: AlergiStatus.isLoadingDeleteAlergi,
          getData: none(),
          onDeleteAlergi: optionOf(data)));

      emit(state.copyWith(
          status: AlergiStatus.isLoadedDeleteAlergi,
          getData: none(),
          onDeleteAlergi: none()));
    } catch (e) {
      emit(state.copyWith(
          status: AlergiStatus.isLoadedDeleteAlergi,
          getData: none(),
          onDeleteAlergi: const None()));
    }

    emit(state.copyWith(
      status: AlergiStatus.isLoadedDeleteAlergi,
    ));
  }

  Future<void> _onGetRiwayatAlergi(
    OnGetRiwayatAlergi event,
    Emitter<AlergiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: AlergiStatus.isLoadingGetRiwayatAlergi,
        getData: none(),
        saveAlergiObat: none()));

    final getRiwayat = await libraryService.onGetRiwayatAlergiPasien(
        noRM: event.noRM, noReg: event.noReg);

    getRiwayat.fold(
      (l) => l.maybeMap(
          orElse: () {},
          failure: (e) {
            emit(state.copyWith(
                status: AlergiStatus.error,
                getData: none(),
                riwayatAlergi: RiwayatAlergiPasien(
                    penyakitDahulu:
                        PenyakitDahulu(tglMasuk: "", riwayatPenyakit: ""),
                    alergi: []),
                saveAlergiObat: none()));
          }),
      (r) => r.maybeMap(
          orElse: () {},
          emty: (e) {
            // ===== //
            emit(state.copyWith(
                status: AlergiStatus.error,
                getData: none(),
                riwayatAlergi: RiwayatAlergiPasien(
                    penyakitDahulu:
                        PenyakitDahulu(tglMasuk: "", riwayatPenyakit: ""),
                    alergi: []),
                saveAlergiObat: none()));
          },
          loaded: (e) {
            try {
              RiwayatAlergiPasien alergi =
                  RiwayatAlergiPasien.fromJson(e.value["response"]);

              log(alergi.toString());

              emit(state.copyWith(
                  status: AlergiStatus.error,
                  getData: none(),
                  riwayatAlergi: alergi,
                  saveAlergiObat: none()));

              // == == //
            } catch (e) {
              emit(state.copyWith(
                  status: AlergiStatus.error,
                  getData: none(),
                  riwayatAlergi: RiwayatAlergiPasien(
                      penyakitDahulu:
                          PenyakitDahulu(tglMasuk: "", riwayatPenyakit: ""),
                      alergi: []),
                  saveAlergiObat: none()));
            }
          }),
    );
  }
}
