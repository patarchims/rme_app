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
