import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/presentation/pages/icu/repository/report_asesmen_ulang_intensive_repository.dart';
import 'package:hms_app/presentation/pages/icu/services/icu_services.dart';

part 'report_icu_event.dart';
part 'report_icu_state.dart';

class ReportIcuBloc extends Bloc<ReportIcuEvent, ReportIcuState> {
  ReportIcuBloc() : super(ReportIcuState.initial()) {
    on<ReportIcuEvent>((event, emit) {});
    on<OnGetReportAsesmenUlangIntensive>(_onGetReportAsesmenUlangIntensive);
  }

  Future<void> _onGetReportAsesmenUlangIntensive(
    OnGetReportAsesmenUlangIntensive event,
    Emitter<ReportIcuState> emit,
  ) async {
    emit(state.copyWith(status: ReportIcuStatus.isLoadingGet));

    try {
      final onGetData = await icuServices.onGetAsesmenPerawatanIntensiveICU(
        noReg: event.noReg,
        pelayanan: event.person,
        tanggal: event.tanggal,
        person: event.person,
      );

      ReportPerawatanIntensiveIcuModel datas =
          ReportPerawatanIntensiveIcuModel.fromJson(onGetData["response"]);

      emit(state.copyWith(
          reportIntensiveIcuModel: datas, status: ReportIcuStatus.loaded));
    } catch (e) {
      emit(state.copyWith(status: ReportIcuStatus.loaded));
    }
  }
}
