part of 'pemeriksaan_fisik_bloc.dart';

@freezed
class PemeriksaanFisikState with _$PemeriksaanFisikState {
  const factory PemeriksaanFisikState({
    // ====================== PEMERIKSAAN FISIK ANAK
    required PemeriksaanFisikAnakModel pemeriksaanFisikAnak,
    required bool isLoadingGetPemeriksaanFisikAnak,
    required bool isLoadingSavePemeriksaanFisikAnak,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        getPemeriksaanFisikAnakResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        savePemeriksaanFisikAnakResult,

    // =========================== TANDA  VITAL DAN GANGGUAN PERILAKU
    required GangguanPerilakuModel ganguanPerilaku,
    required bool isLoadingGetGangguanPerilaku,
    required bool isLoadingSaveGangguanPerilaku,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        getGangguanPerilakuSaveResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        saveGangguanPerilakuSaveResult,

    // =========================== PEMERIKSAAN FISIK
    required List<String> mataSelection,
    required List<String> telingaSelection,
    required List<String> hidungSelection,
    required List<String> tenggorakanSelection,
    required List<String> mulutSelection,
    required List<String> gigiSelection,
    required List<String> leherSelection,
    required List<String> dadaSelection,
    required List<String> jantungSelection,
    required List<String> paruSelection,
    required List<String> perutSelection,
    required List<String> abdomenSelection,
    required List<String> punggungSelection,
    required List<String> genetaliaSelection,
    required List<String> ekstremitasSelection,

    // ======================== VITAL SIGN
    required VitalSignBangsalModel vitalSignBangsalModel,
    required KeadaanUmumModel keadaanUmum,
    // =================== KEADAAN UMUM =============
    required bool isLoadingGetKeadaanUmum,
    required bool isLoadingSaveKeadaanUmum,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        getKeadaanUmumResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        saveKeadaanUmumResult,
    required bool isLoadingGetVitalSign,
    required bool isLoadingSaveVitalSign,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        getVitalSignBangsalResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        saveVitalSIgnBangsalResult,

    // ======================== PEMERIKSAAN FISIK BANGSAL MODEL
    required bool isLoadingGetPemeriksaanFisikBangsal,
    required bool isLoadingSavePemeriksaaanFisikBangsal,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        getAsesmenPemeriksaanFisikBangsalResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        saveAsesmenPemeriksaanFisikBangsalResult,
    required PemeriksaanFisikBangsalModel pemeriksaanFisikBangsalModel,
    required PemeriksaanFisikIgdModel pemeriksaanFisikIgdModel,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        getAsesmenPemeriksaanFisikResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        saveAsesmenPemeriksaanFisikResult,
    required bool isLoadingSavePemeriksaanFisikIgd,
    required bool isLoadingGetPemeriksaanFisikIgd,
  }) = _PemeriksaanFisikState;

  factory PemeriksaanFisikState.initial() => PemeriksaanFisikState(
        getPemeriksaanFisikAnakResult: none(),
        isLoadingGetPemeriksaanFisikAnak: false,
        isLoadingSavePemeriksaanFisikAnak: false,
        savePemeriksaanFisikAnakResult: none(),
        pemeriksaanFisikAnak: PemeriksaanFisikAnakModel(
            mata: "",
            mulut: "",
            gigi: "",
            thyroid: "",
            paru: "",
            jantung: "",
            dindingDada: "",
            dindingdadaRetEpigastrium: "",
            dindingDadaRetSuprastermal: "",
            dindingDadaRetraksi: "",
            hepar: "",
            heparDetail: "",
            tugorKulit: "",
            limpa: "",
            limpaDetail: "",
            ginjal: "",
            ginjalDetail: "",
            genetalia: "",
            ouf: "",
            ekstremitas: ""),
        getKeadaanUmumResult: none(),
        saveKeadaanUmumResult: none(),
        isLoadingGetKeadaanUmum: false,
        isLoadingSaveKeadaanUmum: false,
        keadaanUmum: KeadaanUmumModel(
            keadaanUmum: "", kesadaran: "", kesadaranDetail: ""),
        getGangguanPerilakuSaveResult: none(),
        isLoadingGetGangguanPerilaku: false,
        isLoadingSaveGangguanPerilaku: false,
        saveGangguanPerilakuSaveResult: none(),
        ganguanPerilaku: GangguanPerilakuModel(
            tekananDarah2: "",
            jalanNafas: "",
            tekananDarah: "",
            pernafasan: "",
            pupilKiri: "",
            pupilKanan: "",
            nadi: "",
            spo2: "",
            cahayaKanan: "",
            cahayaKiri: "",
            suhu: "",
            akral: "",
            gcsE: "",
            gcsM: "",
            gcsV: "",
            gangguan: "",
            gangguanDetail: ""),
        // =================================== PEMERIKSASAN FISIK
        abdomenSelection: [],
        dadaSelection: [],
        ekstremitasSelection: [],
        genetaliaSelection: [],
        gigiSelection: [],
        jantungSelection: [],
        leherSelection: [],
        mulutSelection: [],
        paruSelection: [],
        perutSelection: [],
        punggungSelection: [],
        hidungSelection: [],
        mataSelection: [],
        telingaSelection: [],
        tenggorakanSelection: [],
        // =================================== VITA SIGN
        getVitalSignBangsalResult: none(),
        saveVitalSIgnBangsalResult: none(),
        isLoadingGetVitalSign: false,
        isLoadingSaveVitalSign: false,
        vitalSignBangsalModel: VitalSignBangsalModel(
            tekananDarah: "",
            nadi: "",
            pernapasan: "",
            suhu: "",
            tinggiBadan: "",
            beratBadan: ""),

        getAsesmenPemeriksaanFisikBangsalResult: none(),
        saveAsesmenPemeriksaanFisikBangsalResult: none(),
        isLoadingGetPemeriksaanFisikBangsal: false,
        isLoadingSavePemeriksaaanFisikBangsal: false,
        pemeriksaanFisikBangsalModel: PemeriksaanFisikBangsalModel(
            dindingDada: "",
            dindingPerut: "",
            gigi: "",
            hati: "",
            leherlainnya: "",
            lien: "",
            mata: "",
            peristaltikUsus: "",
            suaraJantung: "",
            tht: "",
            thyroid: "",
            pemeriksaanFisik: "",
            kepala: "",
            leher: "",
            dada: "",
            abdomen: "",
            punggung: "",
            genetalia: "",
            ekstremitas: "",
            lainLain: ""),
        isLoadingGetPemeriksaanFisikIgd: false,
        isLoadingSavePemeriksaanFisikIgd: false,
        pemeriksaanFisikIgdModel: PemeriksaanFisikIgdModel(
            mataDetail: "",
            abdomenDetail: "",
            dindingDada: "",
            dindingPerut: "",
            genetalia: "",
            gigi: "",
            ginjal: "",
            hati: "",
            inferior: "",
            kulit: "",
            leherLainnya: "",
            lien: "",
            mata: "",
            mulut: "",
            peristatikUsus: "",
            suaraJantung: "",
            suaraParu: "",
            superior: "",
            tht: "",
            thyroid: ""),
        getAsesmenPemeriksaanFisikResult: none(),
        saveAsesmenPemeriksaanFisikResult: none(),
      );
}
