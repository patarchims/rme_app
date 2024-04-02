part of 'data_medik_bloc.dart';

@freezed
class DataMedikState with _$DataMedikState {
  const factory DataMedikState({
    required bool isLoading,
    required bool isLoadingGetResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>> getResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult,
  }) = _DataMedikState;
  factory DataMedikState.initial() => DataMedikState(
      getResult: none(),
      isLoadingGetResult: false,
      isLoading: false,
      saveResult: none());
}
