// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'riwayat_keperawatan_bloc.dart';

enum RiwayatKeperawatanStatus {
  initial,
  loading,
  loaded,
  error,
  isLoadingGet,
  isLoadingSave,
  isLoaded,
}

class RiwayatKeperawatanState extends Equatable {
  final RiwayatKeperawatanStatus status;
  const RiwayatKeperawatanState({
    required this.status,
  });
  @override
  List<Object?> get props => [
        status,
      ];

  static RiwayatKeperawatanState initial() =>
      const RiwayatKeperawatanState(status: RiwayatKeperawatanStatus.initial);
}
