// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tanda_vital_igd_dokter_bloc.dart';

@immutable
sealed class TandaVitalIgdDokterEvent {}

class OnGetTandaVitalIGDDokter extends TandaVitalIgdDokterEvent {
  final String noReg;
  final String person;
  final String pelayanan;
  OnGetTandaVitalIGDDokter({
    required this.noReg,
    required this.person,
    required this.pelayanan,
  });
}

class OnChangedTinggiBadanEvent extends TandaVitalIgdDokterEvent {
  final String value;
  OnChangedTinggiBadanEvent({
    required this.value,
  });
}

class OnChangedAkralEvent extends TandaVitalIgdDokterEvent {
  final String value;
  OnChangedAkralEvent({
    required this.value,
  });
}

class OnChangedPupilEvent extends TandaVitalIgdDokterEvent {
  final String value;
  OnChangedPupilEvent({
    required this.value,
  });
}

class OnChangedBeratBadan extends TandaVitalIgdDokterEvent {
  final String value;
  OnChangedBeratBadan({
    required this.value,
  });
}

class OnSaveTandaVitalIGDDokter extends TandaVitalIgdDokterEvent {
  final String noReg;
  final String person;
  final String deviceId;
  final String pelayanan;
  final TandaVitalIgdDokter tandaVital;
  OnSaveTandaVitalIGDDokter({
    required this.deviceId,
    required this.noReg,
    required this.person,
    required this.tandaVital,
    required this.pelayanan,
  });
}

class OnChangedE extends TandaVitalIgdDokterEvent {
  final String value;
  OnChangedE({
    required this.value,
  });
}

class OnChangedV extends TandaVitalIgdDokterEvent {
  final String value;
  OnChangedV({
    required this.value,
  });
}

class OnChangedM extends TandaVitalIgdDokterEvent {
  final String value;
  OnChangedM({
    required this.value,
  });
}

class OnChangedTekananDarahEvent extends TandaVitalIgdDokterEvent {
  final String value;
  OnChangedTekananDarahEvent({
    required this.value,
  });
}

class OnChangedNadiEvent extends TandaVitalIgdDokterEvent {
  final String value;
  OnChangedNadiEvent({
    required this.value,
  });
}

class OnChangedSuhuEvent extends TandaVitalIgdDokterEvent {
  final String value;
  OnChangedSuhuEvent({
    required this.value,
  });
}

class OnChangedKesadaranEvent extends TandaVitalIgdDokterEvent {
  final String value;
  OnChangedKesadaranEvent({
    required this.value,
  });
}

class OnChangedPernapasanEvent extends TandaVitalIgdDokterEvent {
  final String value;
  OnChangedPernapasanEvent({
    required this.value,
  });
}

class OnChangedSpoEvent extends TandaVitalIgdDokterEvent {
  final String value;
  OnChangedSpoEvent({
    required this.value,
  });
}

class OnChangedAlasanDatangEvent extends TandaVitalIgdDokterEvent {
  final String value;
  OnChangedAlasanDatangEvent({
    required this.value,
  });
}
