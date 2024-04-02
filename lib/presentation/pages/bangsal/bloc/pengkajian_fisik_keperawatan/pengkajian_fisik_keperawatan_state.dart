// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pengkajian_fisik_keperawatan_bloc.dart';

enum PengkajianFisikKeperawatanStatus {
  initial,
  loading,
  loaded,
  error,
}

class PengkajianFisikKeperawatanState extends Equatable {
  final PengkajianFisikKeperawatanStatus status;
  const PengkajianFisikKeperawatanState({
    required this.status,
  });
  @override
  List<Object?> get props => [
        status,
      ];

  static PengkajianFisikKeperawatanState initial() =>
      const PengkajianFisikKeperawatanState(
          status: PengkajianFisikKeperawatanStatus.initial);

  PengkajianFisikKeperawatanState copyWith({
    PengkajianFisikKeperawatanStatus? status,
  }) {
    return PengkajianFisikKeperawatanState(
      status: status ?? this.status,
    );
  }
}
