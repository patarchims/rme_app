// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'report_asesmen_bayi_bloc.dart';

@immutable
sealed class ReportAsesmenBayiEvent {}

class OnGetReportAnalisaData extends ReportAsesmenBayiEvent {
  final String noReg;
  OnGetReportAnalisaData({
    required this.noReg,
  });
}

class OnGetReportResumeMedisPerinatologi extends ReportAsesmenBayiEvent {
  final String noReg;
  final String noRM;
  OnGetReportResumeMedisPerinatologi({
    required this.noReg,
    required this.noRM,
  });
}
