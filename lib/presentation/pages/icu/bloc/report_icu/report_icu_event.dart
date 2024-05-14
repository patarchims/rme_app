part of 'report_icu_bloc.dart';

@immutable
sealed class ReportIcuEvent {}

class OnGetReportICU extends ReportIcuEvent {
  final String noReg;

  OnGetReportICU({
    required this.noReg,
  });
}

class OnGetReportAsesmenUlangIntensive extends ReportIcuEvent {
  final String noReg;
  final String noRM;
  final String person;
  final String tanggal;
  OnGetReportAsesmenUlangIntensive({
    required this.noReg,
    required this.noRM,
    required this.tanggal,
    required this.person,
  });
}
