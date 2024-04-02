// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'reassesmen_resiko_jatuh_bloc.dart';

@immutable
sealed class ReassesmenResikoJatuhEvent {}

class OnSaveReAssesmenResikoJatuh extends ReassesmenResikoJatuhEvent {
  final List<ResikoJatuhPasienModel> resikoJatuh;
  final String noreg;
  final String person;
  final String kategori;
  final String deviceID;
  final int skor;
  final String jenis;
  final String pelayanan;
  OnSaveReAssesmenResikoJatuh({
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

class OnCheclistReAsesmenResikoJatuh extends ReassesmenResikoJatuhEvent {
  final int faktorIndex;
  final int resikoJatuhIndex;
  final ResikoJatuh resikoJatuh;
  final int? totalResiko;
  OnCheclistReAsesmenResikoJatuh({
    required this.faktorIndex,
    required this.resikoJatuhIndex,
    required this.resikoJatuh,
    this.totalResiko,
  });

  OnCheclistReAsesmenResikoJatuh copyWith({
    int? faktorIndex,
    int? resikoJatuhIndex,
    ResikoJatuh? resikoJatuh,
    int? totalResiko,
  }) {
    return OnCheclistReAsesmenResikoJatuh(
      faktorIndex: faktorIndex ?? this.faktorIndex,
      resikoJatuhIndex: resikoJatuhIndex ?? this.resikoJatuhIndex,
      resikoJatuh: resikoJatuh ?? this.resikoJatuh,
      totalResiko: totalResiko ?? this.totalResiko,
    );
  }
}

class OnGetReAsesmenResikoJatuh extends ReassesmenResikoJatuhEvent {}
