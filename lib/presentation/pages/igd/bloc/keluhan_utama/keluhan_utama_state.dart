part of 'keluhan_utama_bloc.dart';

enum KeluhanUtamaStatus {
  initial,
  loading,
  loaded,
  error,
  onSelected,
  onSave,
  isLoadingGet,
  isLoadingSave,
  isLoadedSave,
  isLoadingSaveKeluarga,
  loadedKelurga
}

class KeluhanUtamaState extends Equatable {
  final KeluhanUtamaDokterIgd keluhanUtamaDokterIgd;
  final KeluhanUtamaStatus status;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResultFailure;
  const KeluhanUtamaState({
    required this.keluhanUtamaDokterIgd,
    required this.status,
    required this.saveResultFailure,
  });
  @override
  List<Object?> get props => [
        status,
        keluhanUtamaDokterIgd,
        saveResultFailure,
      ];

  static KeluhanUtamaState initial() => KeluhanUtamaState(
        saveResultFailure: none(),
        keluhanUtamaDokterIgd: KeluhanUtamaDokterIgd(
            riwayatTerdahulu: [],
            riwayatKeluarga: [],
            asesmen: Asesmen(noreg: "", keluhUtama: "", rwtSekarang: "")),
        status: KeluhanUtamaStatus.initial,
      );

  KeluhanUtamaState copyWith({
    KeluhanUtamaDokterIgd? keluhanUtamaDokterIgd,
    KeluhanUtamaStatus? status,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResultFailure,
  }) {
    return KeluhanUtamaState(
      saveResultFailure: saveResultFailure ?? this.saveResultFailure,
      keluhanUtamaDokterIgd:
          keluhanUtamaDokterIgd ?? this.keluhanUtamaDokterIgd,
      status: status ?? this.status,
    );
  }
}
