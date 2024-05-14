// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pengkajian_fisik_anak_bloc.dart';

@immutable
sealed class PengkajianFisikAnakEvent {}

class OnGetPengkajianFisikAnakEvent extends PengkajianFisikAnakEvent {
  final String noReg;
  final String person;
  OnGetPengkajianFisikAnakEvent({
    required this.noReg,
    required this.person,
  });
}

class OnSavePengkajianFisikAnakEvent extends PengkajianFisikAnakEvent {
  final String devicesID;
  final String pelayanan;
  final String person;
  final String noReg;
  final PemeriksaanFisikAnakModelRepository pemeriksaanFisik;
  OnSavePengkajianFisikAnakEvent({
    required this.devicesID,
    required this.pelayanan,
    required this.person,
    required this.noReg,
    required this.pemeriksaanFisik,
  });
}
