part of 'odontogram_bloc.dart';

@freezed
class OdontogramState with _$OdontogramState {
  const factory OdontogramState({
    required bool isLoading,
    required Option<Either<ApiFailureResult, ApiSuccessResult>> getResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult,
  }) = _OdontogramState;
  factory OdontogramState.initial() =>
      OdontogramState(isLoading: false, getResult: none(), saveResult: none());
}
