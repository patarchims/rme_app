import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/pages/bangsal/repository/pemeriksaan_fisik_anak_model_repository.dart';
import 'package:hms_app/presentation/pages/bangsal/services/bangsal_services.dart';

part 'pengkajian_fisik_anak_event.dart';
part 'pengkajian_fisik_anak_state.dart';

class PengkajianFisikAnakBloc
    extends Bloc<PengkajianFisikAnakEvent, PengkajianFisikAnakState> {
  PengkajianFisikAnakBloc() : super(PengkajianFisikAnakState.initial()) {
    on<PengkajianFisikAnakEvent>((event, emit) {});
    on<OnGetPengkajianFisikAnakEvent>(_onGetPengkajianFisikAnakEvent);
    on<OnSavePengkajianFisikAnakEvent>(_onSavePengkajianFisikAnak);
  }

  Future<void> _onGetPengkajianFisikAnakEvent(
    OnGetPengkajianFisikAnakEvent event,
    Emitter<PengkajianFisikAnakState> emit,
  ) async {
    emit(state.copyWith(status: PengkajianFisikAnakStatus.isLoadingGet));

    try {
      // GET PEMERIKSAAN FISIK PENERIKSAAN ANAK
      final getData = await keperawatanBangsalService
          .getPengkajianFisikAnakRepo(noReg: event.noReg, person: event.person);

      PemeriksaanFisikAnakModelRepository data =
          PemeriksaanFisikAnakModelRepository.fromJson(getData["response"]);

      emit(state.copyWith(
          status: PengkajianFisikAnakStatus.loaded,
          pemeriksaanFisikAnakModel: data));

      //==//
    } catch (e) {
      emit(state.copyWith(
        status: PengkajianFisikAnakStatus.loaded,
        pemeriksaanFisikAnakModel: PemeriksaanFisikAnakModelRepository(
            peristaltik: "",
            gcsE: "",
            gcsM: "",
            gcsV: "",
            mata: "",
            telinga: "",
            hidung: "",
            mulut: "",
            leherDanBahu: "",
            dada: "",
            abdomen: "",
            punggung: "",
            nutrisiDanHidrasi: ""),
      ));
    }
  }

  Future<void> _onSavePengkajianFisikAnak(
    OnSavePengkajianFisikAnakEvent event,
    Emitter<PengkajianFisikAnakState> emit,
  ) async {
    emit(state.copyWith(status: PengkajianFisikAnakStatus.isLoadingSave));
    try {
      final saveData =
          await keperawatanBangsalService.onSavePemeriksaanFisikAnak(
              deviceID: event.devicesID,
              pelayanan: event.pelayanan,
              person: event.person,
              noReg: event.noReg,
              mata: event.pemeriksaanFisik.mata,
              telinga: event.pemeriksaanFisik.telinga,
              hidung: event.pemeriksaanFisik.hidung,
              mulut: event.pemeriksaanFisik.mulut,
              leherDanBahu: event.pemeriksaanFisik.leherDanBahu,
              dada: event.pemeriksaanFisik.dada,
              abdomen: event.pemeriksaanFisik.abdomen,
              punggung: event.pemeriksaanFisik.punggung,
              nutrisiDanHidrasi: event.pemeriksaanFisik.nutrisiDanHidrasi);

      emit(state.copyWith(
          status: PengkajianFisikAnakStatus.loaded,
          saveResultFailure: optionOf(saveData)));

      final getData = await keperawatanBangsalService
          .getPengkajianFisikAnakRepo(noReg: event.noReg, person: event.person);

      PemeriksaanFisikAnakModelRepository data =
          PemeriksaanFisikAnakModelRepository.fromJson(getData["response"]);

      emit(state.copyWith(
          status: PengkajianFisikAnakStatus.loaded,
          pemeriksaanFisikAnakModel: data,
          saveResultFailure: none()));
    } catch (e) {
      emit(state.copyWith(
          status: PengkajianFisikAnakStatus.loaded, saveResultFailure: none()));
    }
  }
}
