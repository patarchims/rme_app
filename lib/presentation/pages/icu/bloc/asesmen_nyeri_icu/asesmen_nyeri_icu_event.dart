// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'asesmen_nyeri_icu_bloc.dart';

@immutable
sealed class AsesmenNyeriIcuEvent {}

class OnGetAsesmenNyeriIcuEvent extends AsesmenNyeriIcuEvent {
  final String noReg;
  OnGetAsesmenNyeriIcuEvent({
    required this.noReg,
  });
}

class OnSaveAsesmenNyeriIcuEvent extends AsesmenNyeriIcuEvent {
  final String kdDokter;
  final String devicesID;
  final String pelayanan;
  final String person;
  final String noReg;
  final String kategori;
  final int nyeri;
  final String lokasiNyeri;
  final String frekuensiNyeri;
  final String nyeriMenjalar;
  final String kualitasNyeri;
  OnSaveAsesmenNyeriIcuEvent({
    required this.kdDokter,
    required this.devicesID,
    required this.pelayanan,
    required this.person,
    required this.noReg,
    required this.kategori,
    required this.nyeri,
    required this.lokasiNyeri,
    required this.frekuensiNyeri,
    required this.nyeriMenjalar,
    required this.kualitasNyeri,
  });
}

class OnChangedAsesmenNyeriEvent extends AsesmenNyeriIcuEvent {
  final int value;
  OnChangedAsesmenNyeriEvent({
    required this.value,
  });
}
