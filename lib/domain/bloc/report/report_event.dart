// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'report_bloc.dart';

@immutable
sealed class ReportEvent {}

class OnGetReportTriaseEvent extends ReportEvent {
  final String noRM;
  final String noReg;
  OnGetReportTriaseEvent({
    required this.noRM,
    required this.noReg,
  });
}

class OnGetReportPengkajianAwalRawatInapDokter extends ReportEvent {
  final String noRM;
  final String noReg;
  final String tanggal;
  OnGetReportPengkajianAwalRawatInapDokter({
    required this.noRM,
    required this.noReg,
    required this.tanggal,
  });
}

class OnGetReportPengkajianAwalRawatInapPerawat extends ReportEvent {
  final String noRM;
  final String noReg;
  final String tanggal;

  OnGetReportPengkajianAwalRawatInapPerawat({
    required this.noRM,
    required this.noReg,
    required this.tanggal,
  });
}

class OnGetReportRingkasanPulangEvent extends ReportEvent {
  final String noRM;
  final String noReg;
  OnGetReportRingkasanPulangEvent({
    required this.noRM,
    required this.noReg,
  });
}

class OnGetReportCPPTPasienEvent extends ReportEvent {
  final String noRM;
  OnGetReportCPPTPasienEvent({
    required this.noRM,
  });
}

class OnGetReportPengkajianPasienRawatInapAnak extends ReportEvent {
  final String noRM;
  final String noReg;
  OnGetReportPengkajianPasienRawatInapAnak({
    required this.noRM,
    required this.noReg,
  });
}

class OnGetReportPerkembanganPerkembanganPasien extends ReportEvent {
  final String noRM;
  OnGetReportPerkembanganPerkembanganPasien({
    required this.noRM,
  });
}
