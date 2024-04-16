// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pemeriksaan_fisik_igd_bloc.dart';

@immutable
sealed class PemeriksaanFisikIgdEvent {}

class OnGetPemeriksaanFisik extends PemeriksaanFisikIgdEvent {
  final String noReg;
  final String person;
  OnGetPemeriksaanFisik({
    required this.noReg,
    required this.person,
  });
}

class OnGetPemeriksaanFisikMethodist extends PemeriksaanFisikIgdEvent {
  final String noReg;
  final String person;
  OnGetPemeriksaanFisikMethodist({
    required this.noReg,
    required this.person,
  });
}

class OnGetPemeriksaanFisikPerawatIGD extends PemeriksaanFisikIgdEvent {
  final String noReg;
  final String person;
  OnGetPemeriksaanFisikPerawatIGD({
    required this.noReg,
    required this.person,
  });
}

class OnGetPemeriksaanFisikBangsalEvent extends PemeriksaanFisikIgdEvent {
  final String noReg;
  final String person;
  OnGetPemeriksaanFisikBangsalEvent({
    required this.noReg,
    required this.person,
  });
}

class OnSavePemeriksaanFisikIGDDokter extends PemeriksaanFisikIgdEvent {
  final PemeriksaanFisikIgdDokter pemeriksaanFisik;
  final String deviceID;
  final String pelayanan;
  final String noReg;
  final String person;
  OnSavePemeriksaanFisikIGDDokter({
    required this.pemeriksaanFisik,
    required this.deviceID,
    required this.pelayanan,
    required this.noReg,
    required this.person,
  });
}

class OnSavePemeriksaanFisikIGDDokterMethodist
    extends PemeriksaanFisikIgdEvent {
  final PemeriksaanFisikMethodistDokter pemeriksaanFisik;
  final String deviceID;
  final String pelayanan;
  final String noReg;
  final String person;
  OnSavePemeriksaanFisikIGDDokterMethodist({
    required this.pemeriksaanFisik,
    required this.deviceID,
    required this.pelayanan,
    required this.noReg,
    required this.person,
  });
}

class OnSavePemeriksaanFisikBangsal extends PemeriksaanFisikIgdEvent {
  final PemeriksaanFisikIgdDokter pemeriksaanFisik;
  final String deviceID;
  final String pelayanan;
  final String noReg;
  final String person;
  OnSavePemeriksaanFisikBangsal({
    required this.pemeriksaanFisik,
    required this.deviceID,
    required this.pelayanan,
    required this.noReg,
    required this.person,
  });
}

class KepalaOnChanged extends PemeriksaanFisikIgdEvent {
  final String value;
  KepalaOnChanged({
    required this.value,
  });
}

class MataOnChanged extends PemeriksaanFisikIgdEvent {
  final String value;
  MataOnChanged({
    required this.value,
  });
}

class ThtOnChanged extends PemeriksaanFisikIgdEvent {
  final String value;
  ThtOnChanged({
    required this.value,
  });
}

class GigiOnchanged extends PemeriksaanFisikIgdEvent {
  final String value;
  GigiOnchanged({
    required this.value,
  });
}

class AbdomenOnchanged extends PemeriksaanFisikIgdEvent {
  final String value;
  AbdomenOnchanged({
    required this.value,
  });
}

class MulutOnChanged extends PemeriksaanFisikIgdEvent {
  final String value;
  MulutOnChanged({
    required this.value,
  });
}

class LeherOnchanged extends PemeriksaanFisikIgdEvent {
  final String value;
  LeherOnchanged({
    required this.value,
  });
}

class DadaOnChanged extends PemeriksaanFisikIgdEvent {
  final String value;
  DadaOnChanged({
    required this.value,
  });
}

class JantungOnChanged extends PemeriksaanFisikIgdEvent {
  final String value;
  JantungOnChanged({
    required this.value,
  });
}

class ParuOnChanged extends PemeriksaanFisikIgdEvent {
  final String value;
  ParuOnChanged({
    required this.value,
  });
}

class PerutOnChanged extends PemeriksaanFisikIgdEvent {
  final String value;
  PerutOnChanged({
    required this.value,
  });
}

class HatiOnChanged extends PemeriksaanFisikIgdEvent {
  final String value;
  HatiOnChanged({
    required this.value,
  });
}

class LimpaOnChanged extends PemeriksaanFisikIgdEvent {
  final String value;
  LimpaOnChanged({
    required this.value,
  });
}

class GinjalOnChanged extends PemeriksaanFisikIgdEvent {
  final String value;
  GinjalOnChanged({
    required this.value,
  });
}

class AlatKelaminOnChanged extends PemeriksaanFisikIgdEvent {
  final String value;
  AlatKelaminOnChanged({
    required this.value,
  });
}

class AnggotaGerakOnChanged extends PemeriksaanFisikIgdEvent {
  final String value;
  AnggotaGerakOnChanged({
    required this.value,
  });
}

class RefleksOnChanged extends PemeriksaanFisikIgdEvent {
  final String value;
  RefleksOnChanged({
    required this.value,
  });
}

class KekuatanOtotOnChanged extends PemeriksaanFisikIgdEvent {
  final String value;
  KekuatanOtotOnChanged({
    required this.value,
  });
}

class KulitOnChanged extends PemeriksaanFisikIgdEvent {
  final String value;
  KulitOnChanged({
    required this.value,
  });
}

class GetahBeningOnChanged extends PemeriksaanFisikIgdEvent {
  final String value;
  GetahBeningOnChanged({
    required this.value,
  });
}

class RtRVOnChanged extends PemeriksaanFisikIgdEvent {
  final String value;
  RtRVOnChanged({
    required this.value,
  });
}
