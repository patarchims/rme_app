part of 'asesmen_intensive_bloc.dart';

enum AsesmenIntensiveStatus {
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

class AsesmenIntensiveState extends Equatable {
  final AsesmenIntensiveIcuModel asesmenIntensiveIcuModel;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResultFailure;
  final AsesmenIntensiveStatus status;

  const AsesmenIntensiveState({
    required this.asesmenIntensiveIcuModel,
    required this.saveResultFailure,
    required this.status,
  });

  @override
  List<Object?> get props => [
        status,
        asesmenIntensiveIcuModel,
        saveResultFailure,
      ];

  static AsesmenIntensiveState initial() => AsesmenIntensiveState(
        status: AsesmenIntensiveStatus.initial,
        saveResultFailure: none(),
        asesmenIntensiveIcuModel: AsesmenIntensiveIcuModel(
          alcoholMempengaruhi: "",
          asesmen: "",
          caraMasuk: "",
          dari: "",
          keluhanUtama: "",
          minumanKeras: "",
          penyakitKeluarga: [],
          riwayat: [],
          penyakitSekarang: "",
          riwayatAlergi: "",
          riwayatMerokok: "",
          transfusiDarah: "",
          yangMuncul: "",
        ),
      );

  AsesmenIntensiveState copyWith({
    AsesmenIntensiveIcuModel? asesmenIntensiveIcuModel,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResultFailure,
    AsesmenIntensiveStatus? status,
  }) {
    return AsesmenIntensiveState(
      saveResultFailure: saveResultFailure ?? this.saveResultFailure,
      asesmenIntensiveIcuModel:
          asesmenIntensiveIcuModel ?? this.asesmenIntensiveIcuModel,
      status: status ?? this.status,
    );
  }
}
