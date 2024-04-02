// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'diagnosa_banding_bloc.dart';

@immutable
sealed class DiagnosaBandingEvent {}

class OnGetDiagnosaBandingDokter extends DiagnosaBandingEvent {
  final String noReg;
  final String person;
  OnGetDiagnosaBandingDokter({
    required this.noReg,
    required this.person,
  });
}

class OnChangedDiagnosaBanding extends DiagnosaBandingEvent {
  final String value;
  OnChangedDiagnosaBanding({
    required this.value,
  });
}

class OnGetDiagnosaBanding extends DiagnosaBandingEvent {
  final String noReg;
  final String person;
  OnGetDiagnosaBanding({
    required this.noReg,
    required this.person,
  });
}

class OnSaveDiagnosaBandingIGD extends DiagnosaBandingEvent {
  final String noReg;
  final String devicesID;
  final String pelayanan;
  final String person;
  final String diagnosa;
  OnSaveDiagnosaBandingIGD({
    required this.noReg,
    required this.devicesID,
    required this.pelayanan,
    required this.person,
    required this.diagnosa,
  });
}
