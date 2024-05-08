// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'vital_sign_icu_bloc.dart';

@immutable
sealed class VitalSignIcuEvent {}

class OnGetVitalSignEvent extends VitalSignIcuEvent {
  final String noReg;
  final String person;
  final String pelayanan;
  OnGetVitalSignEvent({
    required this.noReg,
    required this.person,
    required this.pelayanan,
  });
}

class OnSaveVitalSignEvent extends VitalSignIcuEvent {
  final String noReg;
  final String devicesID;
  final String person;
  final String kategori;
  final String pelayanan;
  final VitalSignIcuModel vitalSign;

  OnSaveVitalSignEvent({
    required this.noReg,
    required this.kategori,
    required this.devicesID,
    required this.person,
    required this.pelayanan,
    required this.vitalSign,
  });
}

class OnChangedTekananDarahEvent extends VitalSignIcuEvent {
  final String value;
  OnChangedTekananDarahEvent({
    required this.value,
  });
}

class OnChangedNadiEvent extends VitalSignIcuEvent {
  final String value;
  OnChangedNadiEvent({
    required this.value,
  });
}

class OnChangedBeratBadanEvent extends VitalSignIcuEvent {
  final String value;
  OnChangedBeratBadanEvent({
    required this.value,
  });
}

class OnChangedSuhuEvent extends VitalSignIcuEvent {
  final String value;
  OnChangedSuhuEvent({
    required this.value,
  });
}

class OnChangedPernapasanICUEvent extends VitalSignIcuEvent {
  final String value;
  OnChangedPernapasanICUEvent({
    required this.value,
  });
}

class OnChangedTinggiBadanEvent extends VitalSignIcuEvent {
  final String value;
  OnChangedTinggiBadanEvent({
    required this.value,
  });
}
