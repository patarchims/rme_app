part of 'asesmen_dokter_bloc.dart';

@freezed
class AsesmenDokterState with _$AsesmenDokterState {
  const factory AsesmenDokterState({
    required bool isLoadingSaveAsesmen,
    required bool isLoadingGetAsesmen,
    required AsesmenDokterModel asesmentDokter,
    required Option<Either<ApiFailureResult, ApiSuccessResult>> getResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult,
  }) = _AsesmenDokterState;

  factory AsesmenDokterState.initial() => AsesmenDokterState(
      getResult: none(),
      asesmentDokter: AsesmenDokterModel(
          keluhanTambahan: "",
          jenpel: "",
          keluhanUtama: "",
          telaah: "",
          masalahMedis: "",
          riwayatSekarang: "",
          riwayatDulu: "",
          riwayatObat: "",
          riwayatKeluarga: "",
          riwayatAlergi: "",
          riwayatDetail: "",
          anamnesa: ""),
      isLoadingGetAsesmen: false,
      isLoadingSaveAsesmen: false,
      saveResult: none());
}
