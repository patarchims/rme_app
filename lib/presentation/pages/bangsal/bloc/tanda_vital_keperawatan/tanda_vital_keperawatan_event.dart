// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tanda_vital_keperawatan_bloc.dart';

@immutable
sealed class TandaVitalKeperawatanEvent {}

class OnGetTandaVitalKeperawatanBangsal extends TandaVitalKeperawatanEvent {
  final String noReg;
  final String person;
  OnGetTandaVitalKeperawatanBangsal({
    required this.noReg,
    required this.person,
  });
}

class OnSaveTandaVitalKeperawatanBangsal extends TandaVitalKeperawatanEvent {
  final String pelayanan;
  final String noReg;
  final String person;
  final String deviceId;
  final VitalSignKeperawatanModel tandaVital;
  OnSaveTandaVitalKeperawatanBangsal({
    required this.deviceId,
    required this.pelayanan,
    required this.noReg,
    required this.person,
    required this.tandaVital,
  });
}

class OnChangedE extends TandaVitalKeperawatanEvent {
  final String value;
  OnChangedE({
    required this.value,
  });
}

class OnChangedV extends TandaVitalKeperawatanEvent {
  final String value;
  OnChangedV({
    required this.value,
  });
}

class OnChangedM extends TandaVitalKeperawatanEvent {
  final String value;
  OnChangedM({
    required this.value,
  });
}

class OnChangedTekananDarahEvent extends TandaVitalKeperawatanEvent {
  final String value;
  OnChangedTekananDarahEvent({
    required this.value,
  });
}

class OnChangedNadiEvent extends TandaVitalKeperawatanEvent {
  final String value;
  OnChangedNadiEvent({
    required this.value,
  });
}

class OnChangedSuhuEvent extends TandaVitalKeperawatanEvent {
  final String value;
  OnChangedSuhuEvent({
    required this.value,
  });
}

class OnChangedKesadaranEvent extends TandaVitalKeperawatanEvent {
  final String value;
  OnChangedKesadaranEvent({
    required this.value,
  });
}

class OnChangedPernapasanEvent extends TandaVitalKeperawatanEvent {
  final String value;
  OnChangedPernapasanEvent({
    required this.value,
  });
}

class OnChangedPupilEvent extends TandaVitalKeperawatanEvent {
  final String value;
  OnChangedPupilEvent({
    required this.value,
  });
}

class OnChangedAkralEvent extends TandaVitalKeperawatanEvent {
  final String value;
  OnChangedAkralEvent({
    required this.value,
  });
}

class OnChangedSPO2Event extends TandaVitalKeperawatanEvent {
  final String value;
  OnChangedSPO2Event({
    required this.value,
  });
}

class OnChangedBeratBadanEvent extends TandaVitalKeperawatanEvent {
  final String value;
  OnChangedBeratBadanEvent({
    required this.value,
  });
}

class OnChangedTinggiBadan extends TandaVitalKeperawatanEvent {
  final String value;
  OnChangedTinggiBadan({
    required this.value,
  });
}

class OnChangedSpoEvent extends TandaVitalKeperawatanEvent {
  final String value;
  OnChangedSpoEvent({
    required this.value,
  });
}
