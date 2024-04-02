import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/pages/bangsal/repository/catatan_keperawatan_repository.dart';
import 'package:hms_app/presentation/pages/bangsal/repository/cppt_sbar_bangsal_repository.dart';
import 'package:hms_app/presentation/pages/bangsal/services/bangsal_services.dart';

part 'cppt_sbar_bangsal_event.dart';
part 'cppt_sbar_bangsal_state.dart';

class CpptSbarBangsalBloc
    extends Bloc<CpptSbarBangsalEvent, CpptSbarBangsalState> {
  CpptSbarBangsalBloc() : super(CpptSbarBangsalState.initial()) {
    on<CpptSbarBangsalEvent>((event, emit) {});
    on<OnGetCpptBangsal>(_onGetCPPTBangsal);
    on<OnSaveCPPTSBARBangsal>(_onSaveCPPTBangsal);
    on<OnUpdateCpptSBARBangsalEvent>(_unUpdateCpptSBARBangsal);
    on<OnDeleteCPPTBangsalEvent>(_onDeleteCPPTSBAREvent);
    on<OnSaveCatatanEvent>(_onSaveCatatanEvent);
    on<OnGetCatatanKeperawatanEvent>(_onGetCatatanKeperawatan);
  }

  Future<void> _onGetCPPTBangsal(
    OnGetCpptBangsal event,
    Emitter<CpptSbarBangsalState> emit,
  ) async {
    emit(state.copyWith(
        saveResultFailure: none(), status: CPPTSbarBangsalStatus.isLoadingGet));

    try {
      final getData =
          await keperawatanBangsalService.onGetCPPTSBAR(noreg: event.noReg);

      log(getData.toString());

      List<CpptSbarDokterModel> data = (getData["response"] as Iterable)
          .map((e) => CpptSbarDokterModel.fromJson(e))
          .toList();

      emit(state.copyWith(
          cppt: data,
          status: CPPTSbarBangsalStatus.loaded,
          saveResultFailure: none()));
    } catch (e) {
      emit(state.copyWith(
          cppt: [],
          saveResultFailure: none(),
          status: CPPTSbarBangsalStatus.loaded));
    }
  }

  Future<void> _unUpdateCpptSBARBangsal(
    OnUpdateCpptSBARBangsalEvent event,
    Emitter<CpptSbarBangsalState> emit,
  ) async {
    emit(state.copyWith(
        saveResultFailure: none(),
        status: CPPTSbarBangsalStatus.isLoadingUpdate));

    try {
      await keperawatanBangsalService.onUpdateCPPTSBARBangsal(
          asesmen: event.asesmen,
          background: event.background,
          idCPPT: event.noCppt,
          recomendation: event.recomendation,
          situation: event.situation);

      emit(state.copyWith(
          status: CPPTSbarBangsalStatus.loaded, saveResultFailure: none()));
    } catch (e) {
      emit(state.copyWith(
          cppt: [],
          saveResultFailure: none(),
          status: CPPTSbarBangsalStatus.loaded));
    }
  }

  Future<void> _onGetCatatanKeperawatan(
    OnGetCatatanKeperawatanEvent event,
    Emitter<CpptSbarBangsalState> emit,
  ) async {
    emit(state.copyWith(
        saveResultFailure: none(),
        saveResultCatatan: none(),
        status: CPPTSbarBangsalStatus.isLoadingGet));

    try {
      final getData = await keperawatanBangsalService.onGetCatatanKeperawatan(
          noReg: event.noReg);

      List<CatatanKeperawatanResponse> data = (getData["response"] as Iterable)
          .map((e) => CatatanKeperawatanResponse.fromJson(e))
          .toList();

      emit(state.copyWith(
          status: CPPTSbarBangsalStatus.loaded,
          saveResultFailure: none(),
          catatanKeperawatan: data));
    } catch (e) {
      emit(state.copyWith(
          cppt: [],
          saveResultFailure: none(),
          catatanKeperawatan: [],
          status: CPPTSbarBangsalStatus.loaded));
    }
  }

  Future<void> _onDeleteCPPTSBAREvent(
    OnDeleteCPPTBangsalEvent event,
    Emitter<CpptSbarBangsalState> emit,
  ) async {
    emit(state.copyWith(
        saveResultFailure: none(),
        status: CPPTSbarBangsalStatus.isLoadingUpdate));

    try {
      await keperawatanBangsalService.onDeleteCPTTSBARBangsalEvent(
        idCPPT: event.noCppt,
      );

      emit(state.copyWith(
          status: CPPTSbarBangsalStatus.loaded, saveResultFailure: none()));
    } catch (e) {
      emit(state.copyWith(
          cppt: [],
          saveResultFailure: none(),
          status: CPPTSbarBangsalStatus.loaded));
    }
  }

  Future<void> _onSaveCatatanEvent(
    OnSaveCatatanEvent event,
    Emitter<CpptSbarBangsalState> emit,
  ) async {
    emit(state.copyWith(
        saveResultCatatan: none(),
        status: CPPTSbarBangsalStatus.isLoadingSave));

    try {
      final save = await keperawatanBangsalService.onSaveCatatanKeperawatan(
          noReg: event.noReg, catatan: event.catatan);

      final getData = await keperawatanBangsalService.onGetCatatanKeperawatan(
          noReg: event.noReg);

      List<CatatanKeperawatanResponse> data = (getData["response"] as Iterable)
          .map((e) => CatatanKeperawatanResponse.fromJson(e))
          .toList();

      emit(state.copyWith(
          status: CPPTSbarBangsalStatus.loaded,
          saveResultCatatan: optionOf(save)));

      emit(state.copyWith(
          status: CPPTSbarBangsalStatus.loaded,
          saveResultCatatan: none(),
          catatanKeperawatan: data));
    } catch (e) {
      emit(state.copyWith(
          cppt: [],
          saveResultCatatan: none(),
          status: CPPTSbarBangsalStatus.loaded));
    }
  }

  Future<void> _onSaveCPPTBangsal(
    OnSaveCPPTSBARBangsal event,
    Emitter<CpptSbarBangsalState> emit,
  ) async {
    emit(state.copyWith(
        saveResultFailure: none(),
        status: CPPTSbarBangsalStatus.isLoadingSave));

    try {
      final saveData = await keperawatanBangsalService.onSaveCPPTSBARBangsal(
          deviceID: event.deviceID,
          noReg: event.noReg,
          dpjp: event.dpjp,
          pelayanan: event.pelayanan,
          kelompok: event.kelompok,
          ppa: event.ppa,
          situation: event.situation,
          background: event.background,
          asesmen: event.asesmen,
          recomendation: event.recomendation);

      emit(state.copyWith(
          status: CPPTSbarBangsalStatus.loaded,
          saveResultFailure: optionOf(saveData)));

      emit(state.copyWith(
          status: CPPTSbarBangsalStatus.loaded, saveResultFailure: none()));
    } catch (e) {
      emit(state.copyWith(
          cppt: [],
          saveResultFailure: none(),
          status: CPPTSbarBangsalStatus.loaded));
    }
  }
}
