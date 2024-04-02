import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/presentation/perina/repository/identitas_bayi_repository_model.dart';
import 'package:hms_app/presentation/perina/repository/report_analisa_data_reponse_model.dart';
import 'package:hms_app/presentation/perina/services/perina_services.dart';

part 'report_asesmen_bayi_event.dart';
part 'report_asesmen_bayi_state.dart';

class ReportAsesmenBayiBloc
    extends Bloc<ReportAsesmenBayiEvent, ReportAsesmenBayiState> {
  ReportAsesmenBayiBloc() : super(ReportAsesmenBayiState.initial()) {
    on<ReportAsesmenBayiEvent>((event, emit) {});
    on<OnGetReportAnalisaData>(_onGetReportAnalisaData);
    on<OnGetReportResumeMedisPerinatologi>(_onGetReportResumeMedisPerina);
  }

  Future<void> _onGetReportAnalisaData(
    OnGetReportAnalisaData event,
    Emitter<ReportAsesmenBayiState> emit,
  ) async {
    emit(state.copyWith(status: ReportAsesmenBayiStatus.isLoadingGet));

    try {
      final getData =
          await perinaServices.onGetReportAnalisaData(noreg: event.noReg);

      List<ReportAnalisaDataResponse> data = (getData['response'] as Iterable)
          .map((e) => ReportAnalisaDataResponse.fromJson(e))
          .toList();

      emit(state.copyWith(
          status: ReportAsesmenBayiStatus.loaded, analisaData: data));
    } catch (e) {
      emit(state.copyWith(status: ReportAsesmenBayiStatus.loaded));
    }
  }

  Future<void> _onGetReportResumeMedisPerina(
    OnGetReportResumeMedisPerinatologi event,
    Emitter<ReportAsesmenBayiState> emit,
  ) async {
    emit(state.copyWith(status: ReportAsesmenBayiStatus.isLoadingGet));

    try {
      final getData = await perinaServices.onGetResumeMedisPerina(
          noreg: event.noReg, noRM: event.noRM);

      ReponseResumeMedisPerinatologi data =
          ReponseResumeMedisPerinatologi.fromMap(getData["response"]);

      emit(state.copyWith(
          status: ReportAsesmenBayiStatus.loaded,
          responseResumeMedisPerinatologi: data));
    } catch (e) {
      emit(state.copyWith(status: ReportAsesmenBayiStatus.loaded));
    }
  }
}
