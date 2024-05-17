// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pengkajian_awal_keperawatan_bloc.dart';

@immutable
sealed class PengkajianAwalKeperawatanEvent {}

class OnChangedJenisAnamnesa extends PengkajianAwalKeperawatanEvent {
  final String value;
  OnChangedJenisAnamnesa({
    required this.value,
  });
}

class OnChangedJenisAnamnesAnak extends PengkajianAwalKeperawatanEvent {
  final String value;
  OnChangedJenisAnamnesAnak({
    required this.value,
  });
}

class OnSaveAssesmenAnakEvent extends PengkajianAwalKeperawatanEvent {
  final String noReg;
  final String noRM;
  final String person;
  final String pelayanan;
  final String devicesID;
  final String dpjp;
  final String jenpel;
  final String jenpenDetail;
  final String keluhanUtama;
  final String riwayatPenyakit;
  final String riwayatPenyakitDahulu;
  final String tanggal;
  final String reaksiAlergi;

  OnSaveAssesmenAnakEvent({
    required this.noReg,
    required this.noRM,
    required this.person,
    required this.pelayanan,
    required this.devicesID,
    required this.dpjp,
    required this.jenpel,
    required this.jenpenDetail,
    required this.keluhanUtama,
    required this.riwayatPenyakitDahulu,
    required this.riwayatPenyakit,
    required this.tanggal,
    required this.reaksiAlergi,
  });
}

class OnGetAsesmenAnakEvent extends PengkajianAwalKeperawatanEvent {
  final String noReg;
  final String noRM;
  final String person;
  final String tanggal;
  OnGetAsesmenAnakEvent({
    required this.noReg,
    required this.noRM,
    required this.person,
    required this.tanggal,
  });
}

class OnSaveRiwayatPenyakitKeluarga extends PengkajianAwalKeperawatanEvent {
  // TAMBAHKAN RIWAYAT PENYAKIT KELUARGA
  final String noRM;
  final String penyakitKeluarga;
  final String userID;
  final String noReg;
  final String person;
  final String tanggal;
  OnSaveRiwayatPenyakitKeluarga({
    required this.noRM,
    required this.tanggal,
    required this.noReg,
    required this.person,
    required this.penyakitKeluarga,
    required this.userID,
  });
}

class OnChangedRiwayatPenyakitDahulu extends PengkajianAwalKeperawatanEvent {
  final String value;
  OnChangedRiwayatPenyakitDahulu({
    required this.value,
  });
}

class OnChangedRiwayatPenyakitDahuluAnak
    extends PengkajianAwalKeperawatanEvent {
  final String value;
  OnChangedRiwayatPenyakitDahuluAnak({
    required this.value,
  });
}

class OnGetPengkajianAwalKeperawatanEvent
    extends PengkajianAwalKeperawatanEvent {
  final String noReg;
  final String noRM;
  final String person;
  final String tanggal;
  OnGetPengkajianAwalKeperawatanEvent({
    required this.noReg,
    required this.tanggal,
    required this.noRM,
    required this.person,
  });
}

class OnSavePengkajianAwalKeperawatan extends PengkajianAwalKeperawatanEvent {
  final String noreg;
  final String noRM;
  final String person;
  final String dpjp;
  final String pelayanan;
  final String deviceID;
  final String jenPel;
  final Pengkajian pengkajian;
  OnSavePengkajianAwalKeperawatan({
    required this.noreg,
    required this.dpjp,
    required this.noRM,
    required this.person,
    required this.pelayanan,
    required this.deviceID,
    required this.jenPel,
    required this.pengkajian,
  });
}

class OnChangedKeluhanUtama extends PengkajianAwalKeperawatanEvent {
  final String value;
  OnChangedKeluhanUtama({
    required this.value,
  });
}

class OnChangedKeluhanUtamaAnak extends PengkajianAwalKeperawatanEvent {
  final String value;
  OnChangedKeluhanUtamaAnak({
    required this.value,
  });
}

class OnChangedRiwayatPenyakitSekarang extends PengkajianAwalKeperawatanEvent {
  final String value;
  OnChangedRiwayatPenyakitSekarang({
    required this.value,
  });
}

class OnChangedRiwayatPenyakitSekarangAnak
    extends PengkajianAwalKeperawatanEvent {
  final String value;
  OnChangedRiwayatPenyakitSekarangAnak({
    required this.value,
  });
}

class OnChangedDetailJenisAnamnesa extends PengkajianAwalKeperawatanEvent {
  final String value;
  OnChangedDetailJenisAnamnesa({
    required this.value,
  });
}

class OnChangedDetailJenisAnamnesaAnak extends PengkajianAwalKeperawatanEvent {
  final String value;
  OnChangedDetailJenisAnamnesaAnak({
    required this.value,
  });
}

class OnChangedReaksiAlergi extends PengkajianAwalKeperawatanEvent {
  final String value;
  OnChangedReaksiAlergi({
    required this.value,
  });
}
class OnChangedReaksiAlergiAnak extends PengkajianAwalKeperawatanEvent {
  final String value;
  OnChangedReaksiAlergiAnak({
    required this.value,
  });
}
