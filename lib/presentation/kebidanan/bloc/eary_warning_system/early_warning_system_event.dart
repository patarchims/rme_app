// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'early_warning_system_bloc.dart';

@immutable
sealed class EarlyWarningSystemEvent {}

class OnSaveData extends EarlyWarningSystemEvent {
  final String kesadaran;
  final String kategori;
  final String noreg;
  final int td;
  final int td2;
  final int pernapasan;
  final String reaksiOtot;
  final String keterangan;
  final String obsigenTambahan;
  final int suhu;
  final int nadi;
  final int spo2;
  final int crt;
  final int skalaNyeri;
  final int totalSkor;
  OnSaveData({
    required this.kesadaran,
    required this.kategori,
    required this.noreg,
    required this.td,
    required this.td2,
    required this.nadi,
    required this.pernapasan,
    required this.keterangan,
    required this.reaksiOtot,
    required this.suhu,
    required this.spo2,
    required this.crt,
    required this.skalaNyeri,
    required this.totalSkor,
    required this.obsigenTambahan,
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

class OnChangedKategori extends EarlyWarningSystemEvent {
  final String kategori;
  OnChangedKategori({
    required this.kategori,
  });
}

class OnChangedTingkatKesadaran extends EarlyWarningSystemEvent {
  final String value;
  OnChangedTingkatKesadaran({
    required this.value,
  });
}

class OnChangedTekananDarah1 extends EarlyWarningSystemEvent {
  final double value;
  OnChangedTekananDarah1({
    required this.value,
  });
}

class OnChangedTekananDarah2 extends EarlyWarningSystemEvent {
  final double value;
  OnChangedTekananDarah2({
    required this.value,
  });
}

class OnChangedNadi extends EarlyWarningSystemEvent {
  final double value;
  OnChangedNadi({
    required this.value,
  });
}

class OnChangedPernapasanEvent extends EarlyWarningSystemEvent {
  final double value;
  OnChangedPernapasanEvent({
    required this.value,
  });
}

class OnChangedReaksiOtot extends EarlyWarningSystemEvent {
  final String value;
  OnChangedReaksiOtot({
    required this.value,
  });
}

class OnChangedSuhu extends EarlyWarningSystemEvent {
  final double value;
  OnChangedSuhu({
    required this.value,
  });
}

class OnChangedSPO2 extends EarlyWarningSystemEvent {
  final double value;
  OnChangedSPO2({
    required this.value,
  });
}

class OnChangedKeterangan extends EarlyWarningSystemEvent {
  final String value;
  OnChangedKeterangan({
    required this.value,
  });
}

class OnChangedCRT extends EarlyWarningSystemEvent {
  final double value;
  OnChangedCRT({
    required this.value,
  });
}

class OnChangedSkalaNyeri extends EarlyWarningSystemEvent {
  final double value;
  OnChangedSkalaNyeri({
    required this.value,
  });
}

class OnChangedObsigenTambahanEvent extends EarlyWarningSystemEvent {
  final String value;
  OnChangedObsigenTambahanEvent({
    required this.value,
  });
}

class OnChangedSkalaNyeriEvent extends EarlyWarningSystemEvent {
  final String value;
  OnChangedSkalaNyeriEvent({
    required this.value,
  });
}
