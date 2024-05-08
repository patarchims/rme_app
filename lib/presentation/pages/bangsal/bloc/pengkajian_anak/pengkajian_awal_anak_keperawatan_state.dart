// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pengkajian_awal_anak_keperawatan_bloc.dart';

enum PengkajianAwalAnakStatus {
  initial,
  loading,
  loaded,
  error,
  onSelected,
  isLoadingSave,
  isLoadingGet,
}

class PengkajianAwalAnakKeperawatanState extends Equatable {
  final PengkajianAwalAnakStatus status;

  const PengkajianAwalAnakKeperawatanState({required this.status});

  static PengkajianAwalAnakKeperawatanState initial() =>
      const PengkajianAwalAnakKeperawatanState(
          status: PengkajianAwalAnakStatus.initial);

  @override
  List<Object?> get props => [status];
}
