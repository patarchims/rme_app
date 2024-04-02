// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'report_igd_bloc.dart';

@immutable
sealed class ReportIgdEvent {}

class OnGetRingkasanPulang extends ReportIgdEvent {
  final String noReg;
  final String noRM;
  OnGetRingkasanPulang({
    required this.noReg,
    required this.noRM,
  });
}
