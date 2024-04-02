import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/services/library_services.dart';
import 'package:hms_app/presentation/report/repository/intervensi_resiko_jatuh_response_model.dart';
import 'package:hms_app/presentation/report/repository/report_resiko_jatuh_morse_response_model.dart';
import 'package:hms_app/presentation/report/repository/resiko_jatuh_anak_reponse_model.dart';
import 'package:hms_app/presentation/report/repository/risiko_jatuh_dewasa_response_model.dart';

part 'resiko_jatuh_event.dart';
part 'resiko_jatuh_state.dart';

class ResikoJatuhReportBloc
    extends Bloc<ResikoJatuhEvent, ResikoReportJatuhState> {
  ResikoJatuhReportBloc() : super(ResikoReportJatuhState.initial()) {
    on<ResikoJatuhEvent>((event, emit) {});
    on<OnGetIntervensiResikoJatuhEvent>(_onGetIntervensiReport);
    on<OnGetResikoJatuhAnakEvent>(_onGetResikoJatuhAnakReport);
    on<OnGetReportResikoJatuhMorseEvent>(_onGetResikoJatuhMorseReport);
    on<OnGetRisikoJatuhDewasaEvent>(_onGetResikoJatuhDewasaEvent);
  }

  Future<void> _onGetIntervensiReport(
    OnGetIntervensiResikoJatuhEvent event,
    Emitter<ResikoReportJatuhState> emit,
  ) async {
    emit(state.copyWith(
        status: ReportResikoJatuhStatus.loadedIntervensi,
        reportIntervensiResikoModel: null));

    final data = await libraryService.intervensiResikoJatuhReport(
        noRM: event.noRM, noReg: event.noReg);

    log("GET DATA REPORT");
    log(data.toString());

    data.fold(
        (l) => l.maybeMap(
            orElse: () {},
            failure: (e) {
              emit(state.copyWith(
                  status: ReportResikoJatuhStatus.error,
                  reportIntervensiResikoModel: null));
            }),
        (r) => r.maybeMap(
            orElse: () {},
            loaded: (data) {
              log("PARSING DATA");
              try {
                ReportIntervensiResikoModel datas =
                    ReportIntervensiResikoModel.fromJson(
                        data.value["response"]);

                log(datas.toString());

                emit(state.copyWith(
                    status: ReportResikoJatuhStatus.loadedIntervensi,
                    reportIntervensiResikoModel: datas));
              } catch (e) {
                log("Error data ${e.toString()}");
                log(e.toString());

                //===//
                emit(state.copyWith(
                    status: ReportResikoJatuhStatus.error,
                    reportIntervensiResikoModel: null));
              }
            }));
  }

  Future<void> _onGetResikoJatuhMorseReport(
    OnGetReportResikoJatuhMorseEvent event,
    Emitter<ResikoReportJatuhState> emit,
  ) async {
    emit(state.copyWith(
        status: ReportResikoJatuhStatus.isLoadingResikoJatuhMorse,
        resikoJatuhMorseResponse: null));

    try {
      final data =
          await libraryService.onGetResikoJatuhMorse(noReg: event.noreg);

      log("GET DATA RESIKO JATUH MORSE ");

      ResikoJatuhMorseResponse datas =
          ResikoJatuhMorseResponse.fromJson(data["response"]);

      log("BERHASIL GET DATA RESIKO JATUH MORSE ");
      log(datas.toString());

      emit(state.copyWith(
          status: ReportResikoJatuhStatus.isLoadedResikojatuhMorse,
          resikoJatuhMorseResponse: datas));

      //==//
    } catch (e) {
      emit(state.copyWith(
          status: ReportResikoJatuhStatus.isLoadedResikojatuhMorse,
          resikoJatuhMorseResponse: null));
    }
  }

  Future<void> _onGetResikoJatuhDewasaEvent(
    OnGetRisikoJatuhDewasaEvent event,
    Emitter<ResikoReportJatuhState> emit,
  ) async {
    emit(state.copyWith(
        status: ReportResikoJatuhStatus.isLoadingResikoJatuhPasienDewasa,
        resikoJatuhMorseResponse: null));

    try {
      final data =
          await libraryService.onGetRisikoJatuhDewasa(noReg: event.noReg);

      log("GET DATA RESIKO JATUH DEWASA ");

      ResikoJatuhDewasaResponse datas =
          ResikoJatuhDewasaResponse.fromJson(data["response"]);

      log("BERHASIL GET DATA RESIKO JATUH DEWASA ");
      log(datas.toJson().toString());

      emit(state.copyWith(
          status: ReportResikoJatuhStatus.isLoadedResikoJatuhPasienDewasa,
          resikoJatuhMorseResponse: state.resikoJatuhMorseResponse,
          resikoJatuhDewasaResponse: datas));

      //==//
    } catch (e) {
      emit(state.copyWith(
          status: ReportResikoJatuhStatus.isLoadedResikoJatuhPasienDewasa,
          resikoJatuhMorseResponse: null));
    }
  }

  Future<void> _onGetResikoJatuhAnakReport(
    OnGetResikoJatuhAnakEvent event,
    Emitter<ResikoReportJatuhState> emit,
  ) async {
    emit(state.copyWith(
        status: ReportResikoJatuhStatus.isLoadingResikoAnak,
        reportIntervensiResikoModel: null));

    final data = await libraryService.resikoJatuhAnak(noReg: event.noReg);

    log("GET DATA REPORT");
    log(data.toString());

    data.fold(
        (l) => l.maybeMap(
            orElse: () {},
            failure: (e) {
              emit(state.copyWith(
                  status: ReportResikoJatuhStatus.error,
                  reportIntervensiResikoModel: null));
            }),
        (r) => r.maybeMap(
            orElse: () {},
            loaded: (data) {
              log("PARSING DATA");
              try {
                ReportResikoJatuhAnak datas =
                    ReportResikoJatuhAnak.fromJson(data.value["response"]);

                log(datas.toJson().toString());

                emit(state.copyWith(
                  status: ReportResikoJatuhStatus.loadedResikoAnak,
                  reportIntervensiResikoModel:
                      state.reportIntervensiResikoModel,
                  reportResikoJatuhAnak: datas,
                ));
              } catch (e) {
                emit(state.copyWith(
                    status: ReportResikoJatuhStatus.error,
                    reportResikoJatuhAnak: null,
                    reportIntervensiResikoModel:
                        state.reportIntervensiResikoModel));
              }
            }));
  }
}
