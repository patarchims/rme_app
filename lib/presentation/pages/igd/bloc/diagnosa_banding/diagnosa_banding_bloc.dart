import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/pages/igd/services/igd_services.dart';
import 'package:hms_app/presentation/report/repository/diagnosa_banding_response_model.dart';
import 'package:hms_app/presentation/report/services/report_service.dart';

part 'diagnosa_banding_event.dart';
part 'diagnosa_banding_state.dart';

class DiagnosaBandingBloc
    extends Bloc<DiagnosaBandingEvent, DiagnosaBandingState> {
  DiagnosaBandingBloc() : super(DiagnosaBandingState.initial()) {
    on<DiagnosaBandingEvent>((event, emit) {});
    on<OnChangedDiagnosaBanding>(_onChangedDiagnosaBanding);
    on<OnGetDiagnosaBandingDokter>(_onGetDiagnosaBandingDokter);
    on<OnSaveDiagnosaBandingIGD>(_onSaveDiagnosaBandingEvent);
    on<OnGetDiagnosaBanding>(_onGetDiagnosaBanding);
  }

  Future<void> _onChangedDiagnosaBanding(
    OnChangedDiagnosaBanding event,
    Emitter<DiagnosaBandingState> emit,
  ) async {
    emit(state.copyWith(status: DiagnosaBandingStatus.isChanged));
    emit(state.copyWith(
        diagnosaBandingResponseModel: state.diagnosaBandingResponseModel
            .copyWith(diagnosaBanding: event.value)));
  }

  Future<void> _onGetDiagnosaBandingDokter(
    OnGetDiagnosaBandingDokter event,
    Emitter<DiagnosaBandingState> emit,
  ) async {
    emit(state.copyWith(status: DiagnosaBandingStatus.isLodingGetData));

    try {
      // GET DATA
      final getData = await reportServices.onGetDiagnosaBanding(
          noReg: event.noReg, person: event.person);

      DiagnosaBandingResponseModel datas =
          DiagnosaBandingResponseModel.fromJson(getData["response"]);

      emit(state.copyWith(
          status: DiagnosaBandingStatus.loaded,
          diagnosaBandingResponseModel: datas));
    } catch (e) {
      emit(state.copyWith(
          status: DiagnosaBandingStatus.loaded,
          diagnosaBandingResponseModel:
              DiagnosaBandingResponseModel(diagnosaBanding: "", noreg: "")));
    }
  }

  Future<void> _onGetDiagnosaBanding(
    OnGetDiagnosaBanding event,
    Emitter<DiagnosaBandingState> emit,
  ) async {
    emit(state.copyWith(
        status: DiagnosaBandingStatus.isLodingGetDiagnosaBanding));

    try {
      // GET DATA
      final getData = await reportServices.onGetDiagnosaBandingICD10(
          noReg: event.noReg, person: event.person);

      DiagnosaBandingResponse datas =
          DiagnosaBandingResponse.fromJson(getData["response"]);

      emit(state.copyWith(
          status: DiagnosaBandingStatus.loaded,
          diagnosaBandingResponse: datas));
    } catch (e) {
      emit(state.copyWith(
          status: DiagnosaBandingStatus.loaded,
          diagnosaBandingResponse:
              DiagnosaBandingResponse(description: "", diagnosa: "")));
    }
  }

  Future<void> _onSaveDiagnosaBandingEvent(
    OnSaveDiagnosaBandingIGD event,
    Emitter<DiagnosaBandingState> emit,
  ) async {
    emit(state.copyWith(
        status: DiagnosaBandingStatus.isLoadingSave,
        saveResultFailure: none()));
    // SAVE DATA
    try {
      final saveData = await igdServices.onSaveDiagnosaBanding(
          diagnosaBanding: event.diagnosa,
          devicesID: event.devicesID,
          pelayanan: event.pelayanan,
          noReg: event.noReg,
          person: event.person);

      emit(state.copyWith(
          status: DiagnosaBandingStatus.loaded,
          saveResultFailure: optionOf(saveData)));

      emit(state.copyWith(
          status: DiagnosaBandingStatus.loaded, saveResultFailure: none()));

      // GET DIAGNOSA BANDING
      final getData = await reportServices.onGetDiagnosaBandingICD10(
          noReg: event.noReg, person: event.person);

      DiagnosaBandingResponse datas =
          DiagnosaBandingResponse.fromJson(getData["response"]);

      emit(state.copyWith(
          status: DiagnosaBandingStatus.loaded,
          diagnosaBandingResponse: datas));
    } catch (e) {
      emit(state.copyWith(
        status: DiagnosaBandingStatus.loaded,
        diagnosaBandingResponseModel:
            DiagnosaBandingResponseModel(diagnosaBanding: "", noreg: ""),
      ));
    }
    emit(state.copyWith(status: DiagnosaBandingStatus.loaded));
  }
}
