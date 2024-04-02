// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'triase_igd_dokter_bloc.dart';

@immutable
sealed class TriaseIgdDokterEvent {}

class OnGetTriaseIGDDokterEvent extends TriaseIgdDokterEvent {
  final String noReg;
  final String person;
  final String pelayanan;
  OnGetTriaseIGDDokterEvent({
    required this.noReg,
    required this.person,
    required this.pelayanan,
  });
}

class OnGetReportTriaseIGDDokterEvent extends TriaseIgdDokterEvent {
  final String noReg;
  final String tanggal;
  final String noRM;
  OnGetReportTriaseIGDDokterEvent({
    required this.noReg,
    required this.tanggal,
    required this.noRM,
  });
}

class OnGetReportTriasePonekEvent extends TriaseIgdDokterEvent {
  final String noReg;
  final String tanggal;
  final String noRM;
  OnGetReportTriasePonekEvent({
    required this.noReg,
    required this.tanggal,
    required this.noRM,
  });
}

class OnSaveTriaseIGDDokterEvent extends TriaseIgdDokterEvent {
  final String noReg;
  final String person;
  final String pelayanan;
  final String devicesID;
  final String kategori;
  final TriaseIgdDokterModel triase;
  OnSaveTriaseIGDDokterEvent({
    required this.noReg,
    required this.person,
    required this.pelayanan,
    required this.devicesID,
    required this.kategori,
    required this.triase,
  });
}

class OnChangedAlasanDatang extends TriaseIgdDokterEvent {
  final String value;
  OnChangedAlasanDatang({
    required this.value,
  });
}

class OnChangedGangguanPerilaku extends TriaseIgdDokterEvent {
  final String value;
  OnChangedGangguanPerilaku({
    required this.value,
  });
}

class OnChangedFlaggWajah extends TriaseIgdDokterEvent {
  final int value;
  OnChangedFlaggWajah({
    required this.value,
  });
}

class OnChangedFlaggKaki extends TriaseIgdDokterEvent {
  final int value;
  OnChangedFlaggKaki({
    required this.value,
  });
}

class OnChangedFlaggAktifitas extends TriaseIgdDokterEvent {
  final int value;
  OnChangedFlaggAktifitas({
    required this.value,
  });
}

class OnChangedFlaggMenangis extends TriaseIgdDokterEvent {
  final int value;
  OnChangedFlaggMenangis({
    required this.value,
  });
}

class OnChangedFlaggBersuara extends TriaseIgdDokterEvent {
  final int value;
  OnChangedFlaggBersuara({
    required this.value,
  });
}

class OnChangedPenyebabCendera extends TriaseIgdDokterEvent {
  final String value;
  OnChangedPenyebabCendera({
    required this.value,
  });
}

class OnChangedKehamilan extends TriaseIgdDokterEvent {
  final String value;
  OnChangedKehamilan({
    required this.value,
  });
}

class OnChangedGravida extends TriaseIgdDokterEvent {
  final String value;
  OnChangedGravida({
    required this.value,
  });
}

class OnChangedPara extends TriaseIgdDokterEvent {
  final String value;
  OnChangedPara({
    required this.value,
  });
}

class OnChangedQEvent extends TriaseIgdDokterEvent {
  final String value;
  OnChangedQEvent({
    required this.value,
  });
}

class OnChangedPEvent extends TriaseIgdDokterEvent {
  final String value;
  OnChangedPEvent({
    required this.value,
  });
}

class OnChangedREvent extends TriaseIgdDokterEvent {
  final String value;
  OnChangedREvent({
    required this.value,
  });
}

class OnChangedSEvent extends TriaseIgdDokterEvent {
  final String value;
  OnChangedSEvent({
    required this.value,
  });
}

class OnChangedTEvent extends TriaseIgdDokterEvent {
  final String value;
  OnChangedTEvent({
    required this.value,
  });
}

class OnChangedAbortus extends TriaseIgdDokterEvent {
  final String value;
  OnChangedAbortus({
    required this.value,
  });
}

class OnChangedHPHT extends TriaseIgdDokterEvent {
  final String value;
  OnChangedHPHT({
    required this.value,
  });
}

class OnChangedDDJEvent extends TriaseIgdDokterEvent {
  final String value;
  OnChangedDDJEvent({
    required this.value,
  });
}

class OnChangedSkalaNyeri extends TriaseIgdDokterEvent {
  final double value;
  OnChangedSkalaNyeri({
    required this.value,
  });
}

class OnChangedSkalaNyeriP extends TriaseIgdDokterEvent {
  final String value;
  OnChangedSkalaNyeriP({
    required this.value,
  });
}

class OnChangedSkalaNyeriG extends TriaseIgdDokterEvent {
  final String value;
  OnChangedSkalaNyeriG({
    required this.value,
  });
}

class OnChangedSkalaNyeriQ extends TriaseIgdDokterEvent {
  final String value;
  OnChangedSkalaNyeriQ({
    required this.value,
  });
}

class OnChangedSkalaNyeriR extends TriaseIgdDokterEvent {
  final String value;
  OnChangedSkalaNyeriR({
    required this.value,
  });
}

class OnChangedSkalaNyeriS extends TriaseIgdDokterEvent {
  final String value;
  OnChangedSkalaNyeriS({
    required this.value,
  });
}

class OnChangedSkalaNyeriT extends TriaseIgdDokterEvent {
  final String value;
  OnChangedSkalaNyeriT({
    required this.value,
  });
}

class OnChangedSkalaTriase extends TriaseIgdDokterEvent {
  final String value;
  OnChangedSkalaTriase({
    required this.value,
  });
}
