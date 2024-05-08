import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/pages/icu/repository/asesmen_intensive_icu_repository.dart';
import 'package:hms_app/presentation/pages/icu/services/icu_services.dart';

part 'asesmen_intensive_event.dart';
part 'asesmen_intensive_state.dart';

class AsesmenIntensiveBloc
    extends Bloc<AsesmenIntensiveEvent, AsesmenIntensiveState> {
  AsesmenIntensiveBloc() : super(AsesmenIntensiveState.initial()) {
    on<AsesmenIntensiveEvent>((event, emit) {});
    on<OnGetRiwayatKeperawatanIntensive>(_onGetRiwayatKeperawatanIntensive);
    on<OnSaveAsesmenIntensiveEvent>(_onSaveAsesmenIntensive);
  }

  Future<void> _onGetRiwayatKeperawatanIntensive(
    OnGetRiwayatKeperawatanIntensive event,
    Emitter<AsesmenIntensiveState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenIntensiveStatus.isLoadingGet));

    try {
      final getData = await icuServices.onGetAsesmenUlangIntensive(
          noReg: event.noReg, person: event.person, noRM: event.noRM);

      AsesmenIntensiveIcuModel data =
          AsesmenIntensiveIcuModel.fromJson(getData["response"]);

      //====//
      emit(state.copyWith(
        asesmenIntensiveIcuModel: data,
        status: AsesmenIntensiveStatus.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(status: AsesmenIntensiveStatus.loaded));
    }
  }

  Future<void> _onSaveAsesmenIntensive(
    OnSaveAsesmenIntensiveEvent event,
    Emitter<AsesmenIntensiveState> emit,
  ) async {
    emit(state.copyWith(
        status: AsesmenIntensiveStatus.isLoadingSave,
        saveResultFailure: none()));

    try {
      // ON LAKUKAN SAVE DATA
      final onSave = await icuServices.onSaveAsesmenIntensive(
          noReg: event.noReg,
          person: event.person,
          noRM: event.noRM,
          kdDPJP: event.kdDPJP,
          pelayanan: event.pelayanan,
          deviceID: event.deviceID,
          asesmen: event.asesmen,
          caraMasuk: event.caraMasuk,
          keluhanUtama: event.keluhanUtama,
          dari: event.dari,
          penyakitSekarang: event.penyakitSekarang,
          penyakitDahulu: event.penyakitDahulu,
          yangMuncul: event.reaksiYangMuncul,
          transfusiDarah: event.transfusiDarah,
          riwayatMerokok: event.riwayatMerokok,
          minumanKeras: event.minumKeras,
          alchodolMempegaruhi: event.alcoholMempegaruhil);

      emit(state.copyWith(
          status: AsesmenIntensiveStatus.loaded,
          saveResultFailure: optionOf(onSave)));

      final getData = await icuServices.onGetAsesmenUlangIntensive(
          noReg: event.noReg, person: event.person, noRM: event.noRM);

      AsesmenIntensiveIcuModel data =
          AsesmenIntensiveIcuModel.fromJson(getData["response"]);

      // ON SAVE
      emit(state.copyWith(
        status: AsesmenIntensiveStatus.loaded,
        saveResultFailure: none(),
        asesmenIntensiveIcuModel: data,
      ));
    } catch (e) {
      // ON ERROR DATA
      emit(state.copyWith(
        status: AsesmenIntensiveStatus.loaded,
        saveResultFailure: none(),
      ));
    }
  }
}
