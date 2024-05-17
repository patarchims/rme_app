// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'asesmen_nyeri_anak_bloc.dart';

@immutable
sealed class AsesmenNyeriAnakEvent {}

class OnGetAsesmenNyeriAnakEvent extends AsesmenNyeriAnakEvent {
  final String noReg;
  OnGetAsesmenNyeriAnakEvent({
    required this.noReg,
  });
}

class OnSaveAssesmenNyeriAnakEvent extends AsesmenNyeriAnakEvent {
  final String noReg;
  final String pelayanan;
  final String person;
  final String deviceID;

  final String ekspresiWajah;
  final String kdDokter;
  final String tangisan;
  final String polaNapas;
  final String tangan;
  final String kaki;
  final String kesadaran;
  final int total;
  final int nyeri;
  final String lokasiNyeri;
  final String frekuensiNyeri;
  final String nyeriMenjalar;
  final String kualitasNyeri;
  OnSaveAssesmenNyeriAnakEvent({
    required this.noReg,
    required this.pelayanan,
    required this.person,
    required this.deviceID,
    required this.ekspresiWajah,
    required this.kdDokter,
    required this.tangisan,
    required this.polaNapas,
    required this.tangan,
    required this.kaki,
    required this.kesadaran,
    required this.total,
    required this.nyeri,
    required this.lokasiNyeri,
    required this.frekuensiNyeri,
    required this.nyeriMenjalar,
    required this.kualitasNyeri,
  });
}

class OnChangeEkspresiWajahEvent extends AsesmenNyeriAnakEvent {
  final String value;
  OnChangeEkspresiWajahEvent({
    required this.value,
  });
}

class OnChangedTangisanEvent extends AsesmenNyeriAnakEvent {
  final String value;
  OnChangedTangisanEvent({
    required this.value,
  });
}

class OnChangedPolaNapasEvent extends AsesmenNyeriAnakEvent {
  final String value;
  OnChangedPolaNapasEvent({
    required this.value,
  });
}

class OnchangedTanganEvent extends AsesmenNyeriAnakEvent {
  final String value;
  OnchangedTanganEvent({
    required this.value,
  });
}

class OnChangedKakiEvent extends AsesmenNyeriAnakEvent {
  final String value;
  OnChangedKakiEvent({
    required this.value,
  });
}

class OnChangedKesadaraEvent extends AsesmenNyeriAnakEvent {
  final String value;
  OnChangedKesadaraEvent({
    required this.value,
  });
}

class OnChangedSkalaNyeriEvent extends AsesmenNyeriAnakEvent {
  final int skalaNyeri;
  OnChangedSkalaNyeriEvent({
    required this.skalaNyeri,
  });
}
