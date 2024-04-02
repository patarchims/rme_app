part of 'cppt_bloc.dart';

@freezed
class CpptState with _$CpptState {
  const factory CpptState({
    required bool isLoadingCPPT,
    required bool isLoadingSaveCPPT,
    required Option<Either<ApiFailureResult, ApiSuccessResult>> getResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        saveResultFailure,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        updateResultFailure,
  }) = _CpptState;

  factory CpptState.initial() => CpptState(
        isLoadingCPPT: false,
        isLoadingSaveCPPT: false,
        saveResultFailure: none(),
        updateResultFailure: none(),
        getResult: none(),
      );
}
