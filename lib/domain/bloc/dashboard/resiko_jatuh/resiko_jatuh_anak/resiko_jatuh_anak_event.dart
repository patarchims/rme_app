// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'resiko_jatuh_anak_bloc.dart';

@immutable
sealed class ResikoJatuhAnakEvent {}

class OnCheclistResikoJatuhAnak extends ResikoJatuhAnakEvent {
  final int faktorIndex;
  final int resikoJatuhIndex;
  final ResikoJatuh resikoJatuh;
  OnCheclistResikoJatuhAnak({
    required this.faktorIndex,
    required this.resikoJatuhIndex,
    required this.resikoJatuh,
  });
}

class OnGetResikoJatuhAnak extends ResikoJatuhAnakEvent {}

class OnSaveResikoJatuhAnak extends ResikoJatuhAnakEvent {
  final List<ResikoJatuhPasienModel> resikoJatuh;
  final String noreg;
  final String person;
  final String kategori;
  final String deviceID;
  final int skor;
  final String jenis;
  final String pelayanan;
  OnSaveResikoJatuhAnak({
    required this.resikoJatuh,
    required this.noreg,
    required this.person,
    required this.kategori,
    required this.deviceID,
    required this.skor,
    required this.jenis,
    required this.pelayanan,
  });
}
