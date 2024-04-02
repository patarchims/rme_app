import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/kebidanan/repository/early_warning_system_repository_widget.dart';
import 'package:hms_app/presentation/kebidanan/services/kebidanan_service.dart';

part 'early_warning_system_event.dart';
part 'early_warning_system_state.dart';

class EarlyWarningSystemBloc
    extends Bloc<EarlyWarningSystemEvent, EarlyWarningSystemState> {
  EarlyWarningSystemBloc() : super(EarlyWarningSystemState.initial()) {
    on<EarlyWarningSystemEvent>((event, emit) {});
    on<OnSaveData>(_onSaveData);
    on<OnDeleteData>(_onDeleteData);
    on<OnGetDataEarlyWarningSystem>(_onGetWarningSystem);
  }

  Future<void> _onSaveData(
    OnSaveData event,
    Emitter<EarlyWarningSystemState> emit,
  ) async {
    emit(state.copyWith(status: EarlyWarningSystemStatus.loading));
    try {
      final save = await kebidananService.onSaveDataEWS(
          noreg: event.noreg,
          kesadaran: event.kesadaran,
          td: event.td,
          nadi: event.nadi,
          pernapasan: event.pernapasan,
          reaksiOtot: event.reaksiOtot,
          suhu: event.suhu,
          spo2: event.spo2,
          crt: event.crt,
          skalaNyeri: event.skalaNyeri);

      emit(state.copyWith(
          status: EarlyWarningSystemStatus.loaded, saveResult: optionOf(save)));
      emit(state.copyWith(
          status: EarlyWarningSystemStatus.loaded, saveResult: none()));
    } catch (e) {
      emit(state.copyWith());
    }
  }

  Future<void> _onDeleteData(
    OnDeleteData event,
    Emitter<EarlyWarningSystemState> emit,
  ) async {
    emit(state.copyWith(status: EarlyWarningSystemStatus.loading));
    try {
      final delete = await kebidananService.onDelete(id: event.id);

      emit(state.copyWith(
          status: EarlyWarningSystemStatus.loaded,
          onDeleteResult: optionOf(delete)));
      emit(state.copyWith(
          status: EarlyWarningSystemStatus.loaded, onDeleteResult: none()));
    } catch (e) {
      emit(state.copyWith());
    }
  }

  Future<void> _onGetWarningSystem(
    OnGetDataEarlyWarningSystem event,
    Emitter<EarlyWarningSystemState> emit,
  ) async {
    emit(state.copyWith(
        status: EarlyWarningSystemStatus.isLoadingGetData,
        onDeleteResult: none(),
        saveResult: none()));
    try {
      final delete = await kebidananService.getEwsSystem(noReg: event.noReg);

      List<EarlyWarningSystem> data = (delete["response"] as Iterable)
          .map((e) => EarlyWarningSystem.fromJson(e))
          .toList();

      log(data.toString());

      emit(state.copyWith(
          status: EarlyWarningSystemStatus.loaded, earlyWarningSystem: data));
    } catch (e) {
      emit(state.copyWith());
    }
  }
}
