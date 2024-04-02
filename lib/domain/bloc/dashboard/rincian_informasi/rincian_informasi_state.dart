part of 'rincian_informasi_bloc.dart';

@freezed
class RincianInformasiState with _$RincianInformasiState {
  const factory RincianInformasiState({
    @Default(false) bool isLoading,
    @Default(false) bool isSave,
    @Default("") String aKerjaValue,
    @Default("") String aBandingValue,
    @Default("") String dasarDiagnosisValue,
    @Default("") String indikasiTindakanValue,
    @Default("") String tataCaraValue,
    @Default("") String tujuanValue,
    @Default("") String risikoValue,
    @Default("") String pronosisValue,
    @Default("") String alternatifValue,
    @Default("") String tidakDilakukanTindakanValue,
    @Default("") String lainLainValue,
    @Default([]) List<BankDataModel> bankData,
    @Default([]) List<DiagnosaIcdModel> diagnosa,
    @Default(None())
    Option<Either<ApiFailureResult, ApiSuccessResult>> getfailOrSuccessResult,
    @Default(None())
    Option<Either<ApiFailureResult, ApiSuccessResult>> failOrSuccessResult,
  }) = _RincianInformasiState;
}
