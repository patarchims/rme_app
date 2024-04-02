part of 'triase_bloc.dart';

@freezed
class TriaseState with _$TriaseState {
  const factory TriaseState({
    // =======================================  SKRINING NYERI
    required SkriningNyeriModel skriningNyeri,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        saveSkriningNyeri,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        getSkriningNyeri,
    required bool isLoadingGetSkriningNyeri,
    required bool isLoadingSaveSkriningNyeri,
    // ======================================= END  SKRINING NYERI

    required bool isLoading,
    // ========================= SKALA NYERI
    required bool isLoadingSaveSkalaTriase,
    required bool isLoadingGetSkalaTriase,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        savefailOrSuccessSkalaTriaseResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        getfailOrSuccessSkalaTriaseResult,

    // =========================== SKALA FLACC
    required double skalaFlaccWajah,
    required double skalaFlaccKaki,
    required double skalaFlaccAktifitas,
    required double skalaFlaccMenangis,
    required double skalaFlaccBersuara,

    // ============================ SKALA
    required double skalaNyeriValue,
    required double skalaTriaseValue,
    required String profokatifStr,
    required String qualityStr,
    required String radiationStr,
    required String severityStr,
    required String timeStr,

    // ============================
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        getfailOrSuccessResultSkala,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        savefailOrSuccessResultSkala,

    // ============== ============== RIWAYAT ALERGI
    required String keluhanUtama,
    required String statusAlergi,
    required String statusAlergiDetail,
    required bool isLoadingGetRiwayatAlergi,
    required bool isLoadingSaveRiwyatAlergi,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        savefailOrSuccessResultRiwayatAlergi,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        getfailOrSuccessResultRiwayatAlergi,
    // =============== ==============
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        getfailOrSuccessResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        saveOrSuccessResult,
  }) = _TriaseState;

  factory TriaseState.initial() => TriaseState(
      getSkriningNyeri: none(),
      isLoadingGetSkriningNyeri: false,
      isLoadingSaveSkriningNyeri: false,
      saveSkriningNyeri: none(),
      skriningNyeri: SkriningNyeriModel(
          skalaNyeri: 0,
          frekuensiNyeri: "",
          lamaNyeri: "",
          nyeriMenjalar: "",
          manjalarDetail: "",
          kualitasNyeri: "",
          nyeriPemicu: "",
          nyeriPengurang: ""),
      isLoading: false,
      getfailOrSuccessResult: none(),
      getfailOrSuccessResultRiwayatAlergi: none(),
      getfailOrSuccessResultSkala: none(),
      getfailOrSuccessSkalaTriaseResult: none(),
      isLoadingGetRiwayatAlergi: false,
      isLoadingGetSkalaTriase: false,
      isLoadingSaveRiwyatAlergi: false,
      isLoadingSaveSkalaTriase: false,
      keluhanUtama: "",
      profokatifStr: "",
      qualityStr: "",
      radiationStr: "",
      saveOrSuccessResult: none(),
      savefailOrSuccessResultRiwayatAlergi: none(),
      savefailOrSuccessResultSkala: none(),
      savefailOrSuccessSkalaTriaseResult: none(),
      severityStr: "",
      skalaFlaccAktifitas: 0,
      skalaFlaccBersuara: 0,
      skalaFlaccKaki: 0,
      skalaFlaccMenangis: 0,
      skalaFlaccWajah: 0,
      skalaNyeriValue: 0,
      skalaTriaseValue: 0,
      statusAlergi: "",
      statusAlergiDetail: "",
      timeStr: "");
}
