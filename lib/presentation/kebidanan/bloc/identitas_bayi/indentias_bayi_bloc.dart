import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/kebidanan/repository/response_identitas_bayi_repository.dart';
import 'package:hms_app/presentation/kebidanan/services/kebidanan_service.dart';

part 'indentias_bayi_event.dart';
part 'indentias_bayi_state.dart';

class IndentiasBayiBloc extends Bloc<IndentiasBayiEvent, IndentiasBayiState> {
  IndentiasBayiBloc() : super(IndentiasBayiState.initial()) {
    on<IndentiasBayiEvent>((event, emit) {});
    on<OnUploadCapSidikKakikananBayi>(_onDeletePengobatanDirumah);
    on<OnDisableButton1>(_isDisableButton1);
    on<OnGetIdentitasBayi>(_onGetIdentitasBayi);
    on<OnDisableButton2>(_isDisableButton2);
    on<OnDisableButton3>(_isDisableButton3);
    on<OnSaveIdentitasBayi>(_onSaveIdentitasBayi);
  }

  Future<void> _onDeletePengobatanDirumah(
    OnUploadCapSidikKakikananBayi event,
    Emitter<IndentiasBayiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(isActive1: false, saveResult: none()));
    // GET DATA

    try {
      final data = await kebidananService.onSaveIdentitasBayiPerina(
          noReg: event.noReg,
          deviceID: event.deviceID,
          dpjp: event.dpjp,
          imageURL: event.file,
          kategori: event.kategori);

      emit(state.copyWith(isActive1: true, saveResult: optionOf(data)));
      emit(state.copyWith(isActive1: true, saveResult: none()));

      final dat = await kebidananService.onGetIdentitasBayi(
          noReg: event.noReg, noRM: event.noRM);

      ResponseIdentitasBayi datas =
          ResponseIdentitasBayi.fromMap(dat["response"]);

      emit(state.copyWith(
          saveResult: none(),
          status: IndentiasBayiStatus.loaded,
          isActive1: true,
          isActive2: true,
          isActive3: true,
          identitasBayi: datas));
    } catch (e) {
      emit(state.copyWith(isActive1: true, isActive2: true, isActive3: true));
    }
  }

  Future<void> _onSaveIdentitasBayi(
    OnSaveIdentitasBayi event,
    Emitter<IndentiasBayiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        saveResult: none(),
        saveResultIdentitas: none(),
        status: IndentiasBayiStatus.isLoadingSaveIdentitas));
    // GET DATA
    try {
      final data = await kebidananService.onSaveDataIdentitasBayi(
          noReg: event.noReg,
          picturePath1: event.ttd1,
          picturePath2: event.ttd2,
          person: event.person,
          jamKelahiranBayi: event.jamKelahiranBayi,
          deviceID: event.deviceID,
          pelayanan: event.pelayanan,
          kategori: event.kategori,
          dpjp: event.dpjp,
          pemberiGelang: event.pemberiGelang,
          namaPenentuJK: event.namaPenentuJK,
          namaWali: event.namaWali);

      emit(state.copyWith(
          isActive1: true,
          isActive2: true,
          status: IndentiasBayiStatus.loaded,
          isActive3: true,
          saveResult: none(),
          saveResultIdentitas: optionOf(data)));

      emit(state.copyWith(
          isActive1: true,
          isActive2: true,
          isActive3: true,
          status: IndentiasBayiStatus.loaded,
          saveResult: none(),
          saveResultIdentitas: none()));
    } catch (e) {
      emit(state.copyWith(
          isActive1: true,
          status: IndentiasBayiStatus.loaded,
          isActive2: true,
          isActive3: true,
          saveResult: none(),
          saveResultIdentitas: none()));
    }
  }

  Future<void> _isDisableButton1(
    OnDisableButton1 event,
    Emitter<IndentiasBayiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(isActive1: event.isActive, saveResult: none()));
    // GET DATA
  }

  Future<void> _isDisableButton2(
    OnDisableButton2 event,
    Emitter<IndentiasBayiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(isActive2: event.isActive, saveResult: none()));
    // GET DATA
  }

  Future<void> _isDisableButton3(
    OnDisableButton3 event,
    Emitter<IndentiasBayiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(isActive3: event.isActive, saveResult: none()));
    // GET DATA
  }

  // GET DATA IDENTITAS
  Future<void> _onGetIdentitasBayi(
    OnGetIdentitasBayi event,
    Emitter<IndentiasBayiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        saveResult: none(), status: IndentiasBayiStatus.loading));
    // GET DATA
    try {
      final dat = await kebidananService.onGetIdentitasBayi(
          noReg: event.noReg, noRM: event.noRM);

      ResponseIdentitasBayi data =
          ResponseIdentitasBayi.fromMap(dat["response"]);

      emit(state.copyWith(
          saveResult: none(),
          status: IndentiasBayiStatus.loaded,
          identitasBayi: data));
    } catch (e) {
      emit(state.copyWith(
          isActive1: true,
          status: IndentiasBayiStatus.loaded,
          isActive2: true,
          isActive3: true));
    }
  }
}
