// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'report_icu_bloc.dart';

@immutable
sealed class ReportIcuEvent {}

class OnGetReportICU extends ReportIcuEvent {
  final String noReg;

  OnGetReportICU({
    required this.noReg,
  });
}
