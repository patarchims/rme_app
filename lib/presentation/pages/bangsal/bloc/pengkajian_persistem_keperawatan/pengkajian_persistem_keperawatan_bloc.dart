import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/pages/bangsal/repository/pengkajian_keperawatan_persistem_repository.dart';
import 'package:hms_app/presentation/pages/bangsal/services/bangsal_services.dart';

part 'pengkajian_persistem_keperawatan_event.dart';
part 'pengkajian_persistem_keperawatan_state.dart';

class PengkajianPersistemKeperawatanBloc extends Bloc<
    PengkajianPersistemKeperawatanEvent, PengkajianPersistemKeperawatanState> {
  PengkajianPersistemKeperawatanBloc()
      : super(PengkajianPersistemKeperawatanState.initial()) {
    on<PengkajianPersistemKeperawatanEvent>((event, emit) {});
    on<OnGetPengkajianPersistem>(_onGetPengkajianPersistem);
    on<OnSavePengkajianPersistemKeperawatan>(
        _onSavePenkajianPersistemKeperawatan);
  }

  Future<void> _onGetPengkajianPersistem(
    OnGetPengkajianPersistem event,
    Emitter<PengkajianPersistemKeperawatanState> emit,
  ) async {
    emit(state.copyWith(
        status: PengkajianPersistemKeperawatanStatus.isLoadingGet));

    try {
      final getData =
          await keperawatanBangsalService.onGetPengkajianPersistemKeperawatan(
              noReg: event.noReg, noRM: event.noRM, person: event.person);

      PengkajianKeperawatanPesistemModel data =
          PengkajianKeperawatanPesistemModel.fromJson(getData["response"]);

      emit(state.copyWith(
          status: PengkajianPersistemKeperawatanStatus.loaded,
          pengkajianKeperawatanPesistemModel: data,
          saveResultFailure: none()));

      //====//
    } catch (e) {
      emit(
        state.copyWith(
            saveResultFailure: none(),
            status: PengkajianPersistemKeperawatanStatus.loaded),
      );
    }
  }

  Future<void> _onSavePenkajianPersistemKeperawatan(
    OnSavePengkajianPersistemKeperawatan event,
    Emitter<PengkajianPersistemKeperawatanState> emit,
  ) async {
    emit(state.copyWith(
        status: PengkajianPersistemKeperawatanStatus.isLoadingSave,
        saveResultFailure: none()));

    try {
      final saveData =
          await keperawatanBangsalService.onSavePengkajianPersistemKeperawatan(
              devicesID: event.devicesID,
              noReg: event.noReg,
              pelayanan: event.pelayanan,
              pengkajianKeperawatanPesistemModel:
                  event.pengkajianKeperawatanPesistemModel,
              person: event.person);

      emit(state.copyWith(
          status: PengkajianPersistemKeperawatanStatus.loaded,
          saveResultFailure: optionOf(saveData)));

      emit(state.copyWith(
          status: PengkajianPersistemKeperawatanStatus.loaded,
          saveResultFailure: none()));
    } catch (e) {
      emit(
        state.copyWith(
            saveResultFailure: none(),
            status: PengkajianPersistemKeperawatanStatus.loaded),
      );
    }
  }
}
