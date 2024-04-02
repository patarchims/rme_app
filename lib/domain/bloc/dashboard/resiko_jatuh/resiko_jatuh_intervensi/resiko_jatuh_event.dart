// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'resiko_jatuh_bloc.dart';

@immutable
sealed class ResikoJatuhEvent {}

class OnCheclistResikoJatuh extends ResikoJatuhEvent {
  final int invervensiIndex;
  final int subIntervensiIndex;
  final SubIntervensi subIntervensi;
  OnCheclistResikoJatuh({
    required this.invervensiIndex,
    required this.subIntervensiIndex,
    required this.subIntervensi,
  });
}

class OnClearCheckListResikoJatuh extends ResikoJatuhEvent {}

// ===================== //
class OnSaveIntervensiResikoJatuh extends ResikoJatuhEvent {
  final String shift;
  final String noReg;
  final String person;
  final String kategori;
  final String deviceID;

  final String pelayanan;
  final List<ResikoJatuhPasienModel> resikoJatuh;
  OnSaveIntervensiResikoJatuh({
    required this.shift,
    required this.noReg,
    required this.person,
    required this.kategori,
    required this.deviceID,
    required this.pelayanan,
    required this.resikoJatuh,
  });
}

class OnChangeShiftResikoJatuh extends ResikoJatuhEvent {
  final String value;
  OnChangeShiftResikoJatuh({
    required this.value,
  });
}

class OnCheckIntervensiResikoJatuh extends ResikoJatuhEvent {
  final int faktorIndex;
  final int resikoJatuhIndex;
  final ResikoJatuh resikoJatuh;
  OnCheckIntervensiResikoJatuh({
    required this.faktorIndex,
    required this.resikoJatuhIndex,
    required this.resikoJatuh,
  });
}

class OnGetIntervensiResiko extends ResikoJatuhEvent {}
