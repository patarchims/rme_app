// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'keluhan_utama_kebidanan_bloc.dart';

@immutable
sealed class KeluhanUtamaKebidananEvent {}

class OnGetAsesmenKebidananEvent extends KeluhanUtamaKebidananEvent {
  final String noReg;
  final String person;
  OnGetAsesmenKebidananEvent({
    required this.noReg,
    required this.person,
  });
}

class OnSavePengkajianRiwayatPenyakitKeluarga
    extends KeluhanUtamaKebidananEvent {
  final String tanggal;
  final String noRM;
  final String noReg;
  final String person;
  final String riwayatPenyakitKelurga;

  OnSavePengkajianRiwayatPenyakitKeluarga({
    required this.riwayatPenyakitKelurga,
    required this.tanggal,
    required this.noRM,
    required this.noReg,
    required this.person,
  });
}

class OnSaveAsesmenKebidananEvent extends KeluhanUtamaKebidananEvent {
  final String noReg;
  final String deviceID;
  final String keluhanUtama;
  final String penyakitSekarang;
  final String keluhanMenyertai;
  final String riwayatMenstruasi;
  final String siklusHaid;
  final String riwayatPernikahan;
  final String person;
  final String pelayanan;
  final String riwayatDahulu;
  OnSaveAsesmenKebidananEvent({
    required this.noReg,
    required this.deviceID,
    required this.keluhanUtama,
    required this.penyakitSekarang,
    required this.keluhanMenyertai,
    required this.riwayatMenstruasi,
    required this.siklusHaid,
    required this.riwayatPernikahan,
    required this.person,
    required this.pelayanan,
    required this.riwayatDahulu,
  });
}

class OnChangedKeluhanUtamaEvent extends KeluhanUtamaKebidananEvent {
  final String value;
  OnChangedKeluhanUtamaEvent({
    required this.value,
  });
}

class OnChangedRiwayatPenyakitSekarang extends KeluhanUtamaKebidananEvent {
  final String value;
  OnChangedRiwayatPenyakitSekarang({
    required this.value,
  });
}

class OnChangedKeluhanUtama extends KeluhanUtamaKebidananEvent {
  final String value;
  OnChangedKeluhanUtama({
    required this.value,
  });
}

class OnChangedRiwayatPenyakit extends KeluhanUtamaKebidananEvent {
  final String value;
  OnChangedRiwayatPenyakit({
    required this.value,
  });
}

class OnChangedRiwayatPenyakitDahulu extends KeluhanUtamaKebidananEvent {
  final String value;
  OnChangedRiwayatPenyakitDahulu({
    required this.value,
  });
}

class OnChangedRiwayatMenstruasi extends KeluhanUtamaKebidananEvent {
  final String value;
  OnChangedRiwayatMenstruasi({
    required this.value,
  });
}

class OnChangedKeluhanMenyertai extends KeluhanUtamaKebidananEvent {
  final String value;
  OnChangedKeluhanMenyertai({
    required this.value,
  });
}

class OnChangedSiklusHaid extends KeluhanUtamaKebidananEvent {
  final String value;
  OnChangedSiklusHaid({
    required this.value,
  });
}

class OnChangedRiwayatPernikahan extends KeluhanUtamaKebidananEvent {
  final String value;
  OnChangedRiwayatPernikahan({
    required this.value,
  });
}
