// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pemeriksaan_fisik_icu_bloc.dart';

enum PemeriksaanFisikIcuStatus {
  initial,
  loading,
  loaded,
  error,
  isLoadingGet,
}

class PemeriksaanFisikIcuState extends Equatable {
  final PemeriksaanFisikIcuStatus status;
  const PemeriksaanFisikIcuState({
    required this.status,
  });
  @override
  List<Object?> get props => [status];

  static PemeriksaanFisikIcuState initial() =>
      const PemeriksaanFisikIcuState(status: PemeriksaanFisikIcuStatus.initial);
}
