// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pemeriksaan_fisik_perina_bloc.dart';

@immutable
sealed class PemeriksaanFisikPerinaEvent {}

class OnGetPemeriksaanFisikPerina extends PemeriksaanFisikPerinaEvent {
  final String noReg;
  final String person;
  OnGetPemeriksaanFisikPerina({
    required this.noReg,
    required this.person,
  });
}

class OnGetDVitalSingPerina extends PemeriksaanFisikPerinaEvent {
  final String noReg;
  final String person;
  final String pelayanan;
  OnGetDVitalSingPerina({
    required this.noReg,
    required this.person,
    required this.pelayanan,
  });
}

class OnSavePemeriksaanFisikPerina extends PemeriksaanFisikPerinaEvent {
  final FisikPerinaModel fisik;
  final String devicesID;
  final String pelayanan;
  final String person;
  final String noReg;
  OnSavePemeriksaanFisikPerina({
    required this.fisik,
    required this.devicesID,
    required this.pelayanan,
    required this.person,
    required this.noReg,
  });
}

class OnSaveDVitalSignFisikPerina extends PemeriksaanFisikPerinaEvent {
  final VItalSignPerina vitalSign;
  final String devicesID;
  final String kategori;
  final String pelayanan;
  final String person;
  final String noReg;
  OnSaveDVitalSignFisikPerina({
    required this.vitalSign,
    required this.devicesID,
    required this.kategori,
    required this.pelayanan,
    required this.person,
    required this.noReg,
  });
}
