// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'asesmen_igd_bloc.dart';

@immutable
sealed class AsesmenAwalIgdEvent {}

class OnDeletePenyakitKeluargaEvent extends AsesmenAwalIgdEvent {
  final int nomor;
  final String noRm;
  final String kelompok;
  final String noReg;
  final String noRM;
  final String tanggal;
  final String person;
  OnDeletePenyakitKeluargaEvent({
    required this.nomor,
    required this.noRm,
    required this.kelompok,
    required this.noReg,
    required this.noRM,
    required this.tanggal,
    required this.person,
  });
}

// ON GET ASESMEN AWAL IGD EVENT
class OnGetAsesmenAwalIGDEvent extends AsesmenAwalIgdEvent {
  final String noReg;
  final String noRM;
  final String tanggal;
  final String person;
  OnGetAsesmenAwalIGDEvent({
    required this.noReg,
    required this.noRM,
    required this.tanggal,
    required this.person,
  });
}

class OnDeletePenyakitKeluarga extends AsesmenAwalIgdEvent {}

class OnSelectionAnamnesa extends AsesmenAwalIgdEvent {
  final String value;
  OnSelectionAnamnesa({
    required this.value,
  });
}

class OnChangedDetailAnamnesa extends AsesmenAwalIgdEvent {
  final String value;
  OnChangedDetailAnamnesa({
    required this.value,
  });
}

class OnSavePenyakitKeluargaEvent extends AsesmenAwalIgdEvent {
  final String noRM;
  final String penyakitKeluarga;
  final String userID;
  final String noReg;
  final String person;
  final String tanggal;
  OnSavePenyakitKeluargaEvent({
    required this.noRM,
    required this.penyakitKeluarga,
    required this.userID,
    required this.noReg,
    required this.person,
    required this.tanggal,
  });
}

class OnSaveAsesmenAwalIGDEvent extends AsesmenAwalIgdEvent {
  final String noReg;
  final String noRm;
  final String tanggal;
  final String person;
  final String devicesID;
  final String pelayanan;
  final String info;
  final String infoDetail;
  final String caraMasuk;
  final String asalMasuk;
  final String fungsional;
  final String keluhanUtama;
  final String penyakitSekarang;
  final String penyakitDahulu;
  final String riwayatDahulu;
  final String reaksiAlergi;
  OnSaveAsesmenAwalIGDEvent(
   { required this.noReg,
    required this.noRm,
    required this.tanggal,
    required this.person,
    required this.devicesID,
    required this.pelayanan,
    required this.info,
    required this.infoDetail,
    required this.caraMasuk,
    required this.asalMasuk,
    required this.fungsional,
    required this.keluhanUtama,
    required this.penyakitSekarang,
    required this.penyakitDahulu,
    required this.riwayatDahulu,
    required this.reaksiAlergi,}
  );
}
