part of 'hasil_penunjang_bloc.dart';

@freezed
class HasilPenunjangState with _$HasilPenunjangState {
  const factory HasilPenunjangState({
    @Default(false) bool isLoadingSave,
    @Default(false) bool isLoadingLabor,
    @Default(false) bool isLoadingRadiologi,
    @Default(false) bool isLoadingFisioterapy,
    @Default(false) bool isLoadingGizi,
    @Default(None())
    Option<Either<ApiFailureResult, ApiSuccessResult>> getOrSuccessResultLabor,
    @Default(None())
    Option<Either<ApiFailureResult, ApiSuccessResult>>
        getOrSuccessResultLaborOldDB,
    @Default(None())
    Option<Either<ApiFailureResult, ApiSuccessResult>>
        getOrSuccessResultRadiologi,
    @Default(None())
    Option<Either<ApiFailureResult, ApiSuccessResult>>
        getOrSuccessResultRadiologiOldDB,
    @Default(None())
    Option<Either<ApiFailureResult, ApiSuccessResult>>
        getOrSuccessResultFisioterapy,
    @Default(None())
    Option<Either<ApiFailureResult, ApiSuccessResult>>
        getOrSuccessResultFisioterapyOldDB,
    @Default(None())
    Option<Either<ApiFailureResult, ApiSuccessResult>> getOrSuccessResultGizi,
    @Default(None())
    Option<Either<ApiFailureResult, ApiSuccessResult>>
        getOrSuccessResultGiziOldDB,
  }) = _HasilPenunjangState;
}
