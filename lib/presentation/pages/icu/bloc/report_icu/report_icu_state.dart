// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'report_icu_bloc.dart';

enum ReportIcuStatus {
  initial,
  loading,
  loaded,
  error,
  isLoadingGet,
  isLoadingSave,
  isLoaded,
}

class ReportIcuState extends Equatable {
  final ReportIcuStatus status;
  const ReportIcuState({
    required this.status,
  });

  @override
  List<Object?> get props => [status];

  static ReportIcuState initial() =>
      const ReportIcuState(status: ReportIcuStatus.initial);
}
