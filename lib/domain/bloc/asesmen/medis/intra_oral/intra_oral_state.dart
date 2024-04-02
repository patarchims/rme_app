part of 'intra_oral_bloc.dart';

@freezed
class IntraOralState with _$IntraOralState {
  const factory IntraOralState({
    required bool isLoading,
    required bool isLoadingGetResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>> getResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult,
  }) = _IntraOralState;

  factory IntraOralState.initial() => IntraOralState(
      isLoading: false,
      isLoadingGetResult: false,
      getResult: none(),
      saveResult: none());
}
