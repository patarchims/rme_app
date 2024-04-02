part of 'rawat_jalan_bloc.dart';

@freezed
class RawatJalanState with _$RawatJalanState {
  const factory RawatJalanState({
    required bool loading,
    required String masalahMedisStr,
    required String terapiStr,
    required List<BankDataModel> bankData,
    required List<DiagnosaIcdModel> diagnosa,
    required List<DiagnosaIcdModel> selectedDiagnosa,
    required Option<Either<ApiFailureResult, ApiSuccessResult>> getResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult,
  }) = _RawatJalanState;
  factory RawatJalanState.initial() => RawatJalanState(
      selectedDiagnosa: <DiagnosaIcdModel>[],
      diagnosa: <DiagnosaIcdModel>[],
      masalahMedisStr: "",
      terapiStr: "",
      loading: false,
      bankData: <BankDataModel>[],
      getResult: none(),
      saveResult: none());
}
