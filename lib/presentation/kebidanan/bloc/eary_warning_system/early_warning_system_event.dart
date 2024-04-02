part of 'early_warning_system_bloc.dart';

@immutable
sealed class EarlyWarningSystemEvent {}

class OnSaveData extends EarlyWarningSystemEvent {
  final String kesadaran;
  final String noreg;
  final int td;
  final int pernapasan;
  final String reaksiOtot;
  final int suhu;
  final int nadi;
  final int spo2;
  final int crt;
  final int skalaNyeri;
  OnSaveData({
    required this.kesadaran,
    required this.noreg,
    required this.td,
    required this.nadi,
    required this.pernapasan,
    required this.reaksiOtot,
    required this.suhu,
    required this.spo2,
    required this.crt,
    required this.skalaNyeri,
  });
}

class OnDeleteData extends EarlyWarningSystemEvent {
  final int id;
  OnDeleteData({
    required this.id,
  });
}

class OnGetDataEarlyWarningSystem extends EarlyWarningSystemEvent {
  final String noReg;
  OnGetDataEarlyWarningSystem({
    required this.noReg,
  });
}
