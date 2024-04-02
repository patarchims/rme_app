part of 'resiko_jatuh_dewasa_bloc.dart';

@immutable
sealed class ResikoJatuhDewasaEvent {}

class OnGetIntervensiResikoDewasa extends ResikoJatuhDewasaEvent {}

class OnCheckIntervensiResikoJatuhDewasa extends ResikoJatuhDewasaEvent {
  final int faktorIndex;
  final int resikoJatuhIndex;
  final ResikoJatuh resikoJatuh;
  OnCheckIntervensiResikoJatuhDewasa({
    required this.faktorIndex,
    required this.resikoJatuhIndex,
    required this.resikoJatuh,
  });
}

class OnSaveResikoJatuhDewasaEvent extends ResikoJatuhDewasaEvent {
  final List<ResikoJatuhPasienModel> resikoJatuh;
  final String noreg;
  final String person;
  final String kategori;
  final String deviceID;
  final int skor;
  final String jenis;
  final String pelayanan;
  OnSaveResikoJatuhDewasaEvent({
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
