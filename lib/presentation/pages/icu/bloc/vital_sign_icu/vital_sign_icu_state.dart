part of 'vital_sign_icu_bloc.dart';

enum VitalSignIcuStatus {
  initial,
  loading,
  loaded,
  error,
  isLoadingGet,
  isLoadingSave,
  isLoaded,
  isChanged,
}

class VitalSignIcuState extends Equatable {
  final VitalSignIcuStatus status;
  final VitalSignIcuModel vitalSignIcu;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult;
  const VitalSignIcuState({
    required this.status,
    required this.saveResult,
    required this.vitalSignIcu,
  });

  @override
  List<Object?> get props => [status, vitalSignIcu];

  static VitalSignIcuState initial() => VitalSignIcuState(
      saveResult: none(),
      status: VitalSignIcuStatus.initial,
      vitalSignIcu: VitalSignIcuModel(
          tekananDarah: "",
          nadi: "",
          beratBadan: "",
          suhu: "",
          pernapasan: "",
          tinggiBadan: ""));

  VitalSignIcuState copyWith({
    VitalSignIcuStatus? status,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResult,
    VitalSignIcuModel? vitalSignIcu,
  }) {
    return VitalSignIcuState(
      saveResult: saveResult ?? this.saveResult,
      status: status ?? this.status,
      vitalSignIcu: vitalSignIcu ?? this.vitalSignIcu,
    );
  }
}
