// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'asesmen_medis_igd_dokter_bloc.dart';

@immutable
sealed class AsesmenMedisIgdDokterEvent {}

class OnGetReportAsesmenMedisDokterIgd extends AsesmenMedisIgdDokterEvent {
  final String noRM;
  final String noReg;
  final String tanggal;
  final String person;
  OnGetReportAsesmenMedisDokterIgd({
    required this.noRM,
    required this.noReg,
    required this.tanggal,
    required this.person,
  });
}
