import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/pages/bangsal/repository/nyeri_icu_repository.dart';
import 'package:hms_app/presentation/pages/icu/services/icu_services.dart';

part 'asesmen_nyeri_icu_event.dart';
part 'asesmen_nyeri_icu_state.dart';

class AsesmenNyeriIcuBloc
    extends Bloc<AsesmenNyeriIcuEvent, AsesmenNyeriIcuState> {
  AsesmenNyeriIcuBloc() : super(AsesmenNyeriIcuState.initial()) {
    on<AsesmenNyeriIcuEvent>((event, emit) {});
    on<OnChangedAsesmenNyeriEvent>(_onChangedSkalaNyeri);
    on<OnGetAsesmenNyeriIcuEvent>(_onGetNyeriICU);
    on<OnSaveAsesmenNyeriIcuEvent>(_onSaveAsesmenNyeriICU);
  }

  Future<void> _onChangedSkalaNyeri(OnChangedAsesmenNyeriEvent event,
      Emitter<AsesmenNyeriIcuState> emit) async {
    emit(state.copyWith(status: AsesmenNyeriICUStatus.isChanged));

    emit(state.copyWith(
        nyeriIcuModel: state.nyeriIcuModel.copyWith(nyeri: event.value)));
  }

  Future<void> _onSaveAsesmenNyeriICU(OnSaveAsesmenNyeriIcuEvent event,
      Emitter<AsesmenNyeriIcuState> emit) async {
    emit(state.copyWith(
      status: AsesmenNyeriICUStatus.isLoadingSave,
      saveResult: none(),
    ));

    try {
      //
      final saveData = await icuServices.onSaveAsesmenNyeriICU(
          devicesID: event.devicesID,
          frekuensiNyeri: event.frekuensiNyeri,
          kategori: event.kategori,
          kdDokter: event.kdDokter,
          kualitasNyeri: event.kualitasNyeri,
          lokasiNyeri: event.lokasiNyeri,
          noReg: event.noReg,
          nyeri: event.nyeri,
          nyeriMenjalar: event.nyeriMenjalar,
          pelayanan: event.pelayanan,
          person: event.person);

      emit(state.copyWith(
        saveResult: optionOf(saveData),
        nyeriIcuModel: state.nyeriIcuModel,
        status: AsesmenNyeriICUStatus.loaded,
      ));

      emit(state.copyWith(
        saveResult: none(),
        nyeriIcuModel: state.nyeriIcuModel,
        status: AsesmenNyeriICUStatus.loaded,
      ));

      // get data disini
      final getData =
          await icuServices.onGetAsesmenNyeriICU(noReg: event.noReg);

      NyeriIcuModel datas = NyeriIcuModel.fromJson(getData["response"]);

      log("GET DATA DISINI");
      log(getData.toString());

      emit(state.copyWith(saveResult: none(), nyeriIcuModel: datas));
    } catch (e) {
      emit(state.copyWith(
          saveResult: none(),
          status: AsesmenNyeriICUStatus.loaded,
          nyeriIcuModel: NyeriIcuModel(
              nyeri: 0,
              lokasiNyeri: "",
              frekuensiNyeri: "",
              nyeriMenjalar: "",
              kualitasNyeri: "")));
    }
  }

  Future<void> _onGetNyeriICU(OnGetAsesmenNyeriIcuEvent event,
      Emitter<AsesmenNyeriIcuState> emit) async {
    // GET ASESMEN NYERI ICU
    emit(state.copyWith(
      status: AsesmenNyeriICUStatus.isLoadingGet,
      saveResult: none(),
    ));
    // LOADED
    try {
      final getData =
          await icuServices.onGetAsesmenNyeriICU(noReg: event.noReg);

      log("GET DATA DISINI");
      log(getData.toString());

      NyeriIcuModel datas = NyeriIcuModel.fromJson(getData["response"]);

      emit(state.copyWith(saveResult: none(), nyeriIcuModel: datas));
    } catch (e) {
      emit(state.copyWith(
          saveResult: none(),
          nyeriIcuModel: NyeriIcuModel(
              nyeri: 0,
              lokasiNyeri: "",
              frekuensiNyeri: "",
              nyeriMenjalar: "",
              kualitasNyeri: "")));
    }

    emit(state.copyWith(
        status: AsesmenNyeriICUStatus.loaded, saveResult: none()));
  }
}
