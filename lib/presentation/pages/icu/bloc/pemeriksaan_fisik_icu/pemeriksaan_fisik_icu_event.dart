// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pemeriksaan_fisik_icu_bloc.dart';

@immutable
sealed class PemeriksaanFisikIcuEvent {}

class OnGetPemeriksaanFisikICU extends PemeriksaanFisikIcuEvent {
  final String noReg;
  final String person;
  OnGetPemeriksaanFisikICU({
    required this.noReg,
    required this.person,
  });
}

// ON GET PENGKAJIAN PERSISTEM ICU
class OnGetPengkajianPersistemICU extends PemeriksaanFisikIcuEvent {
  final String noReg;
  final String person;
  final String noRM;
  final String tanggal;
  OnGetPengkajianPersistemICU({
    required this.noReg,
    required this.person,
    required this.noRM,
    required this.tanggal,
  });
}

class OnSavePengkajianPersistemICU extends PemeriksaanFisikIcuEvent {
  final String noReg;
  final String person;
  final String deviceID;
  final String pelayanan;
  final String kodeDokter;
  final PengkajianPersistemIcuModel pengkajianPersistemIcuModel;
  OnSavePengkajianPersistemICU({
    required this.pengkajianPersistemIcuModel,
    required this.noReg,
    required this.person,
    required this.deviceID,
    required this.pelayanan,
    required this.kodeDokter,
  });
}

class OnSavePemeriksaanFisikICU extends PemeriksaanFisikIcuEvent {
  final String devicesID;
  final String pelayanan;
  final String noReg;
  final String person;
  final PemeriksaanFisikIcuModel pemeriksaanFisikModel;
  OnSavePemeriksaanFisikICU({
    required this.devicesID,
    required this.pelayanan,
    required this.noReg,
    required this.person,
    required this.pemeriksaanFisikModel,
  });
}
