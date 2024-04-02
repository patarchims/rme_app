// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tanda_vital_keperawatan_bloc.dart';

enum TandaVitalKeperawatanStatus {
  initial,
  loading,
  loaded,
  error,
  isChanged,
  isLoadingGet,
  isLoadingSave,
  loadedSave,
}

class TandaVitalKeperawatanState extends Equatable {
  final TandaVitalKeperawatanStatus status;
  final VitalSignKeperawatanModel vitalSignKeperawatanModel;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResultFailure;
  const TandaVitalKeperawatanState({
    required this.status,
    required this.vitalSignKeperawatanModel,
    required this.saveResultFailure,
  });
  @override
  List<Object?> get props =>
      [status, vitalSignKeperawatanModel, saveResultFailure];

  static TandaVitalKeperawatanState initial() => TandaVitalKeperawatanState(
        saveResultFailure: none(),
        vitalSignKeperawatanModel: VitalSignKeperawatanModel(
            gcsE: "",
            gcsV: "",
            gcsM: "",
            td: "",
            beratBadan: "",
            pernafasan: "",
            spo2: "",
            nadi: "",
            suhu: "",
            tinggiBadan: ""),
        status: TandaVitalKeperawatanStatus.initial,
      );

  TandaVitalKeperawatanState copyWith({
    TandaVitalKeperawatanStatus? status,
    VitalSignKeperawatanModel? vitalSignKeperawatanModel,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResultFailure,
  }) {
    return TandaVitalKeperawatanState(
      status: status ?? this.status,
      vitalSignKeperawatanModel:
          vitalSignKeperawatanModel ?? this.vitalSignKeperawatanModel,
      saveResultFailure: saveResultFailure ?? this.saveResultFailure,
    );
  }
}
