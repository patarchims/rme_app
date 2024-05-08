// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'asesmen_intensive_bloc.dart';

@immutable
sealed class AsesmenIntensiveEvent {}

class OnGetRiwayatKeperawatanIntensive extends AsesmenIntensiveEvent {
  final String noReg;
  final String person;
  final String noRM;
  OnGetRiwayatKeperawatanIntensive({
    required this.noReg,
    required this.person,
    required this.noRM,
  });
}

class OnSaveAsesmenIntensiveEvent extends AsesmenIntensiveEvent {
  final String noReg;
  final String kdDPJP;
  final String noRM;
  final String pelayanan;
  final String deviceID;
  final String person;
  final String asesmen;
  final String caraMasuk;
  final String keluhanUtama;
  final String dari;
  final String penyakitSekarang;
  final String penyakitDahulu;
  final String reaksiYangMuncul;
  final String transfusiDarah;
  final String riwayatMerokok;
  final String minumKeras;
  final String alcoholMempegaruhil;
  OnSaveAsesmenIntensiveEvent({
    required this.noReg,
    required this.kdDPJP,
    required this.noRM,
    required this.pelayanan,
    required this.deviceID,
    required this.person,
    required this.asesmen,
    required this.caraMasuk,
    required this.keluhanUtama,
    required this.dari,
    required this.penyakitSekarang,
    required this.penyakitDahulu,
    required this.reaksiYangMuncul,
    required this.transfusiDarah,
    required this.riwayatMerokok,
    required this.minumKeras,
    required this.alcoholMempegaruhil,
  });
}
