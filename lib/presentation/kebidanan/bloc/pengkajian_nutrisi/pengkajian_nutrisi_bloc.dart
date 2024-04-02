import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/kebidanan/repository/pengkajian_nutrisi_reponse_model.dart';
import 'package:hms_app/presentation/kebidanan/services/kebidanan_service.dart';

part 'pengkajian_nutrisi_event.dart';
part 'pengkajian_nutrisi_state.dart';

class PengkajianNutrisiBloc
    extends Bloc<PengkajianNutrisiEvent, PengkajianNutrisiState> {
  PengkajianNutrisiBloc() : super(PengkajianNutrisiState.initial()) {
    on<PengkajianNutrisiEvent>((event, emit) {});
    on<OnChangedN1>(_onChangeN1);
    on<OnChangedN2>(_onChangeN2);
    on<OnSavePengkajianNutrisi>(_onSavePengkajianNutrisi);
    on<OnGetPengkajianNutrisi>(_onGetPengkajianNutrisi);
  }

  void _changedNilai(Emitter<PengkajianNutrisiState> emit) {
    if (state.pengkajianNutrisiResponseModel.n2 == "Ya") {
      emit(state.copyWith(
          pengkajianNutrisiResponseModel:
              state.pengkajianNutrisiResponseModel.copyWith(nilaiN2: 1)));
    }
    if (state.pengkajianNutrisiResponseModel.n2 == "Tidak") {
      emit(state.copyWith(
          pengkajianNutrisiResponseModel:
              state.pengkajianNutrisiResponseModel.copyWith(nilaiN2: 0)));
    }
    if (state.pengkajianNutrisiResponseModel.n1 == "Tidak ada penurunan BB") {
      emit(state.copyWith(
          pengkajianNutrisiResponseModel:
              state.pengkajianNutrisiResponseModel.copyWith(nilaiN2: 0)));
    }
    if (state.pengkajianNutrisiResponseModel.n1 ==
        "Tidak yakin / Tidak tahu / Baju terasa Longgar") {
      emit(state.copyWith(
          pengkajianNutrisiResponseModel:
              state.pengkajianNutrisiResponseModel.copyWith(nilaiN2: 2)));
    }
    if (state.pengkajianNutrisiResponseModel.n1 == "1-5 Kg") {
      emit(state.copyWith(
          pengkajianNutrisiResponseModel:
              state.pengkajianNutrisiResponseModel.copyWith(nilaiN2: 1)));
    }
    if (state.pengkajianNutrisiResponseModel.n1 == "6-10 Kg") {
      emit(state.copyWith(
          pengkajianNutrisiResponseModel:
              state.pengkajianNutrisiResponseModel.copyWith(nilaiN2: 2)));
    }
    if (state.pengkajianNutrisiResponseModel.n1 == "11-15 Kg") {
      emit(state.copyWith(
          pengkajianNutrisiResponseModel:
              state.pengkajianNutrisiResponseModel.copyWith(nilaiN2: 3)));
    }
    if (state.pengkajianNutrisiResponseModel.n1 == "> 15 Kg") {
      emit(state.copyWith(
          pengkajianNutrisiResponseModel:
              state.pengkajianNutrisiResponseModel.copyWith(nilaiN2: 4)));
    }
  }

  Future<void> _onChangeN1(
    OnChangedN1 event,
    Emitter<PengkajianNutrisiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: PengkajianNutrisiStatus.loading,
        savePengkajianResult: none(),
        pengkajianNutrisiResponseModel:
            state.pengkajianNutrisiResponseModel.copyWith(
          n1: event.value,
        )));

    emit(state.copyWith(
      status: PengkajianNutrisiStatus.onSelected,
      savePengkajianResult: none(),
      pengkajianNutrisiResponseModel: state.pengkajianNutrisiResponseModel
          .copyWith(
              n1: event.value,
              nilaiN1: (event.value == "Tidak ada penurunan BB")
                  ? 0
                  : (event.value ==
                          "Tidak yakin / Tidak tahu / Baju terasa Longgar")
                      ? 2
                      : (event.value == "1-5 Kg")
                          ? 1
                          : (event.value == "6-10 Kg")
                              ? 2
                              : (event.value == "11-15 Kg")
                                  ? 3
                                  : (event.value == "> 15 Kg")
                                      ? 4
                                      : 0),
    ));
  }

  Future<void> _onChangeN2(
    OnChangedN2 event,
    Emitter<PengkajianNutrisiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(status: PengkajianNutrisiStatus.loading));
    _changedNilai(emit);
    emit(state.copyWith(
        status: PengkajianNutrisiStatus.onSelected,
        savePengkajianResult: none(),
        pengkajianNutrisiResponseModel: state.pengkajianNutrisiResponseModel
            .copyWith(
                n2: event.value, nilaiN2: (event.value == "Ya") ? 1 : 0)));
  }

  Future<void> _onSavePengkajianNutrisi(
    OnSavePengkajianNutrisi event,
    Emitter<PengkajianNutrisiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: PengkajianNutrisiStatus.isLoadingSavePengkajian,
        savePengkajianResult: none()));

    final saveData = await kebidananService.onSavePengkajianNutrisi(
        noReg: event.noReg,
        deviceID: event.deviceID,
        n1: event.n1,
        n2: event.n2,
        nilai: event.nilai);

    emit(state.copyWith(
        status: PengkajianNutrisiStatus.loadedPenkajianNutrisi,
        savePengkajianResult: optionOf(saveData)));

    emit(state.copyWith(
        status: PengkajianNutrisiStatus.loadedPenkajianNutrisi,
        savePengkajianResult: none()));
  }

  Future<void> _onGetPengkajianNutrisi(
    OnGetPengkajianNutrisi event,
    Emitter<PengkajianNutrisiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
      status: PengkajianNutrisiStatus.isLoadingGetPengkajian,
      savePengkajianResult: none(),
    ));

    final data = await kebidananService.onGetPengkajianNutrisiKebidanan(
        noReg: event.noReg);

    PengkajianNutrisiResponseModel datas =
        PengkajianNutrisiResponseModel.fromJson(data["response"]);

    emit(state.copyWith(
        pengkajianNutrisiResponseModel: datas,
        status: PengkajianNutrisiStatus.loadedPenkajianNutrisi,
        savePengkajianResult: none()));

    emit(state.copyWith(
        status: PengkajianNutrisiStatus.loadedPenkajianNutrisi,
        savePengkajianResult: none()));
  }
}
