// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'resiko_jatuh_getup_bloc.dart';

@immutable
sealed class ResikoJatuhGetupEvent {}

// GET DATA
class OnGetResikoJatuhGetUpGoTestEvent extends ResikoJatuhGetupEvent {
  final String noReg;
  final String noRM;
  OnGetResikoJatuhGetUpGoTestEvent({
    required this.noReg,
    required this.noRM,
  });
}

// SAVE DATA
class OnSaveResikoJatuhGetUpGoTestEvent extends ResikoJatuhGetupEvent {
  final String deviceID;
  final String pelayanan;
  final String person;
  final String noReg;
  final String resikoJatuh1;
  final String resikoJatuh2;
  final String tindakan;
  OnSaveResikoJatuhGetUpGoTestEvent({
    required this.deviceID,
    required this.pelayanan,
    required this.person,
    required this.noReg,
    required this.resikoJatuh1,
    required this.resikoJatuh2,
    required this.tindakan,
  });
}

// ON CHANGE RESIKO JATUH 1
class OnChangeResikoJatuh1Event extends ResikoJatuhGetupEvent {
  final String value;
  OnChangeResikoJatuh1Event({
    required this.value,
  });
}

// ON CHANGE RESIKO JATUH 2
class OnChangeResikoJatuh2Event extends ResikoJatuhGetupEvent {
  final String value;
  OnChangeResikoJatuh2Event({
    required this.value,
  });
}
