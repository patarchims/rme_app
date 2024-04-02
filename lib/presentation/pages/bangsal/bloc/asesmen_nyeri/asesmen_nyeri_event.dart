// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'asesmen_nyeri_bloc.dart';

@immutable
sealed class AsesmenNyeriEvent {}

class OnCHangedAsesmenNyeri extends AsesmenNyeriEvent {
  final int skalaNyeri;
  OnCHangedAsesmenNyeri({
    required this.skalaNyeri,
  });
}

class OnSaveAsesemenNyeri extends AsesmenNyeriEvent {
  final String noReg;
  final String person;
  final String pelayanan;
  final String devicesID;
  final int skalaNyeri;
  OnSaveAsesemenNyeri({
    required this.noReg,
    required this.skalaNyeri,
    required this.person,
    required this.pelayanan,
    required this.devicesID,
  });
}

class OnGetAsesemenNyeri extends AsesmenNyeriEvent {
  final String noReg;
  OnGetAsesemenNyeri({
    required this.noReg,
  });
}

class OnGetReportAsesmenNyeri extends AsesmenNyeriEvent {
  final String noReg;
  OnGetReportAsesmenNyeri({
    required this.noReg,
  });
}
