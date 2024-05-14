// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'asesmen_anak_bloc.dart';

enum AsesmenAnakStatus {
  initial,
  loading,
  loaded,
  error,
  isChanged,
  isLoadingGet,
  isLoadingUpdate,
  isLoadingSave,
  loadedSave,
}

class AsesmenAnakState extends Equatable {
  final AsesmenAnakStatus status;

  const AsesmenAnakState({
    required this.status,
  });

  @override
  List<Object?> get props => [status];

  static AsesmenAnakState initial() => const AsesmenAnakState(
        status: AsesmenAnakStatus.initial,
      );
}
