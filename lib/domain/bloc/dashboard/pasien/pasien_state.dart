part of 'pasien_bloc.dart';

@freezed
class PasienState with _$PasienState {
  const factory PasienState({
    AntreanPasienModel? selectedPasien,
    required bool loadingPasien,
    required bool loadingDetailPasien,
    required bool loadigSaveAnatomi,
    required bool loadingSkrining,
    required bool loadingGetSkrining,
    required String normSelected,
    required String keterangan,
    required bool loadingGetData,
    required bool loading,
    required bool loadingDetailRiwayatPasien,
    required List<DetailProfilPasienModel> detailRiwayatPasien,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        failOrSuccessResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        failOrSuccessResultAnatomi,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        detailPasienResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        kVitalSignResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>> skriningResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        getSkriningResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>> getResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>> getDetailPasien,
    required Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>> saveOdontogram,
    required List<AntreanPasienModel> listPasienModel,
    required List<DetailProfilPasienModel> detailProfilPasienModel,
    SkirningModel? skriningModel,
  }) = _PasienState;

  factory PasienState.initial() => PasienState(
      detailProfilPasienModel: [],
      loadingDetailRiwayatPasien: false,
      detailRiwayatPasien: [],
      getDetailPasien: none(),
      selectedPasien: null,
      skriningModel: null,
      saveOdontogram: none(),
      loading: false,
      saveResult: none(),
      loadingGetData: false,
      getResult: none(),
      loadingSkrining: false,
      loadingGetSkrining: false,
      getSkriningResult: none(),
      normSelected: "",
      listPasienModel: <AntreanPasienModel>[],
      keterangan: "",
      detailPasienResult: none(),
      failOrSuccessResultAnatomi: none(),
      loadigSaveAnatomi: false,
      failOrSuccessResult: none(),
      kVitalSignResult: none(),
      loadingDetailPasien: false,
      skriningResult: none(),
      loadingPasien: false);
}
