import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/kebidanan/repository/diagnosa_kebidanan_model.dart';
import 'package:hms_app/presentation/kebidanan/repository/diagnosa_response_kebidanan_mode.dart';
import 'package:hms_app/presentation/kebidanan/services/kebidanan_service.dart';

part 'diagnosa_kebidanan_event.dart';
part 'diagnosa_kebidanan_state.dart';

class DiagnosaKebidananBloc
    extends Bloc<DiagnosaKebidananEvent, DiagnosaKebidananState> {
  DiagnosaKebidananBloc() : super(DiagnosaKebidananState.initial()) {
    on<DiagnosaKebidananEvent>((event, emit) {});
    on<OnGetDiagnosaKebidanan>(_onGetDiagnosaKebidanan);
    on<OnSelectedDiagnosaKebidanan>(_onSelectedionDiagnosaKebidanan);
    on<OnSaveDiagnosaSelectedEvent>(_onSaveDiagnosaSelected);
    on<OnGetDiagnosaKebidananEvent>(_onGetDiagnosaKebidananEvent);
    on<OnDeleteDiagnosaKebidananEvent>(_onDeleteDiagnosaKebidanan);
  }

  Future<void> _onGetDiagnosaKebidanan(
    OnGetDiagnosaKebidanan event,
    Emitter<DiagnosaKebidananState> emit,
  ) async {
    emit(state.copyWith(
      status: DiagnosaKebidananStatus.loading,
      diagnosaKebidanan: [],
    ));

    try {
      final getData = await kebidananService.getDiagnosaKebidanan();

      List<DiagnosaKebidananModel> data = (getData["response"] as Iterable)
          .map((e) => DiagnosaKebidananModel.fromJson(e))
          .toList();

      emit(state.copyWith(
          diagnosaKebidanan: data, status: DiagnosaKebidananStatus.loaded));
    } catch (e) {
      emit(state.copyWith(
          diagnosaKebidanan: [], status: DiagnosaKebidananStatus.loaded));
    }
  }

  Future<void> _onGetDiagnosaKebidananEvent(
    OnGetDiagnosaKebidananEvent event,
    Emitter<DiagnosaKebidananState> emit,
  ) async {
    emit(state.copyWith(
      status: DiagnosaKebidananStatus.isLoadingGetData,
      diagnosaKebidanan: [],
    ));

    try {
      final getData =
          await kebidananService.onGetDataDiagnosaKebidanan(noReg: event.noReg);

      log("GET DATA DIAGNOSA KEBIDANAN");

      List<DiagnosaKebidananResponse> data = (getData["response"] as Iterable)
          .map((e) => DiagnosaKebidananResponse.fromJson(e))
          .toList();

      log(data.toString());

      emit(state.copyWith(
          diagnosaKebidanan: state.diagnosaKebidanan,
          diagnosaKebidananResponse: data,
          status: DiagnosaKebidananStatus.isLoadedGetData));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(
          diagnosaKebidanan: state.diagnosaKebidanan,
          diagnosaKebidananResponse: [],
          status: DiagnosaKebidananStatus.isLoadedGetData));
    }
  }

  Future<void> _onSelectedionDiagnosaKebidanan(
    OnSelectedDiagnosaKebidanan event,
    Emitter<DiagnosaKebidananState> emit,
  ) async {
    emit(state.copyWith(
      status: DiagnosaKebidananStatus.initial,
      diagnosaKebidanan: state.diagnosaKebidanan,
    ));

    List<DiagnosaKebidananModel> newDeskripsi = state.diagnosaKebidanan;

    log("INDEX ${event.indexDiagnosa}");

    newDeskripsi[event.indexDiagnosa] = event.diagnosa;

    emit(state.copyWith(
      status: DiagnosaKebidananStatus.loaded,
      diagnosaKebidanan: state.diagnosaKebidanan,
    ));
  }

  Future<void> _onDeleteDiagnosaKebidanan(
    OnDeleteDiagnosaKebidananEvent event,
    Emitter<DiagnosaKebidananState> emit,
  ) async {
    emit(state.copyWith(deleteData: none()));

    final deleteData = await kebidananService.onDeleteDiagnosaKebidanan(
        noDiganosa: event.noDiagnosa);

    emit(state.copyWith(deleteData: optionOf(deleteData)));
    emit(state.copyWith(deleteData: none()));
  }

  Future<void> _onSaveDiagnosaSelected(
    OnSaveDiagnosaSelectedEvent event,
    Emitter<DiagnosaKebidananState> emit,
  ) async {
    log(event.diagnosaList
        .where((element) => element.isSelected == true)
        .toString());

    emit(state.copyWith(
      saveResult: none(),
      status: DiagnosaKebidananStatus.isloadingSaveData,
    ));

    Iterable<DiagnosaKebidananModel> newDeskripsi;

    newDeskripsi =
        event.diagnosaList.where((element) => element.isSelected == true);

    final save = await kebidananService.saveDiagnosaKebidanan(
        noReg: event.noReg,
        deviceID: event.deviceID,
        userID: event.userID,
        diagnosa: newDeskripsi);

    emit(state.copyWith(
      saveResult: optionOf(save),
      status: DiagnosaKebidananStatus.isLoadedSaveData,
    ));

    emit(state.copyWith(
      saveResult: none(),
      status: DiagnosaKebidananStatus.isLoadedSaveData,
    ));
  }
}
