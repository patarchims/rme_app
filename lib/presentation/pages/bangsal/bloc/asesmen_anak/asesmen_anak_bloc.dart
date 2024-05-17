import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/pages/bangsal/repository/asesmen_anak_repository.dart';
import 'package:hms_app/presentation/pages/bangsal/services/bangsal_services.dart';

part 'asesmen_anak_event.dart';
part 'asesmen_anak_state.dart';

class AsesmenAnakBloc extends Bloc<AsesmenAnakEvent, AsesmenAnakState> {
  AsesmenAnakBloc() : super(AsesmenAnakState.initial()) {
    on<AsesmenAnakEvent>((event, emit) {});
    on<OnGetAsessmenAnakEvent>(_onGetAsesmenAnak);
    on<OnChangeJenisAsesmenEvent>(_onChangedJenisAnamnesa);
  }

  Future<void> _onGetAsesmenAnak(
    OnGetAsessmenAnakEvent event,
    Emitter<AsesmenAnakState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenAnakStatus.isLoadingGet));
    try {
      final getData = await keperawatanBangsalService.onGetAsesmenAnak(
          noreg: event.noReg,
          noRM: event.noRM,
          person: event.person,
          tanggal: event.tanggal);

      PenkajianAnakRepository data =
          PenkajianAnakRepository.fromMap(getData["response"]);

      emit(state.copyWith(
          pengkajianAnak: data, status: AsesmenAnakStatus.loaded));
    } catch (e) {
      emit(state.copyWith(status: AsesmenAnakStatus.loaded));
    }
  }

  // ON SAVE DATA
  Future<void> _onChangedJenisAnamnesa(
    OnChangeJenisAsesmenEvent event,
    Emitter<AsesmenAnakState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenAnakStatus.isChanged));

    emit(state.copyWith(
        saveResultFailure: none(),
        pengkajianAnak: state.pengkajianAnak
          ..copyWith(
              pengkajianAnak: state.pengkajianAnak.pengkajianAnak
                  .copyWith(jenpel: event.value))));
  }
}
