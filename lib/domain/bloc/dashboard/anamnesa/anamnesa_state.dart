part of 'anamnesa_bloc.dart';

@freezed
class AnamnesaState with _$AnamnesaState {
  const factory AnamnesaState({
    required bool isLoading,
    required bool anamnesaLoading,
    required String selectKeluhan,
    required String selectRiwayat,
    required String selectRiwayatKeluarga,
    required List<BankDataModel> keluhanUtama,
    required List<BankDataModel> riwayatSekarang,
    required List<BankDataModel> riwayatKeluarga,
    required Option<Either<ApiFailureResult, ApiSuccessResult>> getResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult,
  }) = _AnamnesaState;

  factory AnamnesaState.initial() => AnamnesaState(
      getResult: none(),
      anamnesaLoading: false,
      isLoading: false,
      saveResult: none(),
      keluhanUtama: [],
      riwayatKeluarga: [],
      riwayatSekarang: [],
      selectKeluhan: "",
      selectRiwayat: "",
      selectRiwayatKeluarga: "");
}
