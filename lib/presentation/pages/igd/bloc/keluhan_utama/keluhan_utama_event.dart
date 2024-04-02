// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'keluhan_utama_bloc.dart';

@immutable
sealed class KeluhanUtamaEvent {}

class OnSaveKeluhanUtamaEvent extends KeluhanUtamaEvent {
  final String noRM;
  final String noReg;
  final String tanggal;
  final String person;
  final String keluhanUtama;
  final String riwayatSekarang;
  final String deviceID;
  final String pelayanan;
  OnSaveKeluhanUtamaEvent({
    required this.noRM,
    required this.deviceID,
    required this.noReg,
    required this.tanggal,
    required this.person,
    required this.keluhanUtama,
    required this.riwayatSekarang,
    required this.pelayanan,
  });
}

class OnGetKeluhanUtamaEvent extends KeluhanUtamaEvent {
  final String noRM;
  final String noReg;
  final String tanggal;
  final String person;
  final String pelayanan;
  OnGetKeluhanUtamaEvent({
    required this.noRM,
    required this.noReg,
    required this.tanggal,
    required this.person,
    required this.pelayanan,
  });
}

class OnSaveRiwayatKeluargaEvent extends KeluhanUtamaEvent {
  final String noRM;
  final String noReg;
  final String tanggal;
  final String person;
  final String pelayanan;
  final String value;
  OnSaveRiwayatKeluargaEvent({
    required this.value,
    required this.noRM,
    required this.noReg,
    required this.tanggal,
    required this.person,
    required this.pelayanan,
  });
}

class OnChangedKeluhanUtama extends KeluhanUtamaEvent {
  final String valu;
  OnChangedKeluhanUtama({
    required this.valu,
  });
}

class OnChangedRiwayatSekarang extends KeluhanUtamaEvent {
  final String value;
  OnChangedRiwayatSekarang({
    required this.value,
  });
}
