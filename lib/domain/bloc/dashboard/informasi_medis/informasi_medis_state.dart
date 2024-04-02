part of 'informasi_medis_bloc.dart';

@freezed
class InformasiMedisState with _$InformasiMedisState {
  const factory InformasiMedisState({
    @Default(false) bool isLoading,
    @Default(false) bool isSave,
    @Default(false) bool isFailure,
    @Default(null) MetaModel? metaModel,
    @Default("") selectTerapi,
    @Default("") selectMasalahMedis,
    @Default("") selectPemeriksaanFisik,
    @Default("") selectAnjuran,
    @Default(null) dynamic data,
    @Default([]) List<BankDataModel> masalahMedis,
    @Default([]) List<BankDataModel> terapi,
    @Default(None())
    Option<Either<ApiFailureResult, ApiSuccessResult>> failOrSuccessResult,
  }) = _InformasiMedisState;
}
