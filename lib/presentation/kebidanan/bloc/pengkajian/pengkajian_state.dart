// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pengkajian_bloc.dart';

enum PenkajianStatus {
  initial,
  loading,
  loaded,
  error,
  isLoadedKebidanan,
  isLoadingGetKebidanan,
}

class PengkajianState extends Equatable {
  final PenkajianStatus status;
  const PengkajianState({
    required this.status,
  });
  @override
  List<Object?> get props => [];

  static PengkajianState initial() =>
      const PengkajianState(status: PenkajianStatus.initial);
}
