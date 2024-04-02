part of 'asesmen_igd_bloc.dart';

@freezed
class AsesmenIgdState with _$AsesmenIgdState {
  const factory AsesmenIgdState({
    // ================================ TINDAK LANJUT
    required TindakLanjutIgdModel tindakLanjutIGDModel,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        saveTindakLanjutIGDResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        getTindakLanjutIGDResult,
    required bool isLoadingGetTindakLanjut,
    required bool isLoadingSaveTindakLanjut,
    // ================================= SKRINING NYERI

    // =============================== RIWAYAT KEHAMILAN
    required RiwayatKehamilanModel riwayatKehamilanModel,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        saveRiwayatKehamilanResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        getRiwayatKehamilanResult,
    required bool isLoadingGetRiwayatKehamilan,
    required bool isLoadingSaveRiwayatKehamilan,
    //================================ END RIWAYAT KEHAMILAN

    // ============================== SKRINING RESIKO DEKKUBITUS
    required SkriningResikoDekubitusModel skriningResikoDekubitus,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        saveSkriningResikoDekubitus,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        geSkriningResikoDekubitus,
    required bool isloadingGetResikoDekubitus,
    required bool isLoadingSaveResikoDekubitus,

    // =============================== INFORMASI DAN KELUHAN  =============================== //
    required AsesmenKeluhanIgdModel asemenKeluhanIGDModel,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        saveInformasiKeluhanResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        getInforasiKeluhanResult,
    required bool isLoadingSaveInformasiKeluhan,
    required bool isLoadingGetInformasiKeluhan,

    // ================== RENCANA TINDAK LANJUT =============================== //
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        saveRencanaTindakLanjut,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        getRencanaTindakLanjut,

    // PEMERIKSAAN FISIK IGD PASIEN
    required String kepalaSelectedStr,
    required String kepalaDetailStr,
    required String leherSelectedStr,
    required String leherDetailStr,
    required String dadaDetailStr,
    required String dadaSeletedStr,
    required String abdomenSelectedStr,
    required String abdomenDetailStr,
    required String punggungSelectedStr,
    required String punggungDetailStr,
    required String genetaliaSelectedStr,
    required String genetaliaDetailStr,
    required String ekstremitasSelectedStr,
    required String ekstremitasDetailStr,
    required String lainLainStr,

    // ANAMNESA PASIEN IGD
    required String keluhanUtamaStr,
    required String telaahStr,
    required String riwayatPenyakitDahulurStr,
    required String riwayatPenayakitDalamKeluargaStr,
    required String kesadaranStr,
    required String jenisPelayananStr,

    // =========== TINDAK LANJUT
    // ================= RENCANA TINDAK LANJUT
    required String alasanObnameStr,
    required String prognosisStr,
    required String alasanKonsulStr,
    required String asuhanTerapiStr,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        getFailResultTindakLanjut,

    /// ==================================================
    required bool isloading,
    required bool isLoadingSaveLokalis,
    required bool isLoadingGetLokalis,
    required bool isLoadingGetAnamnesa,
    required bool isLoadingGetRencanaTindakLanjut,
    required bool isLoadingSaveAnamnesa,
    required bool isLoadingGetPemeriksaanFisik,
    required bool isLoadingSavePemeriksaanFisik,
    required bool isLoadingSaveRencanaTindakLanjut,

    // ==================  GIZI
    required List<String> giziSelection,
    required List<GiziModel> giziModel,
    required List<DetailTaripRadiologiModel> detailGizi,
    required bool loadingSaveGizi,
    required Option<Either<ApiFailureResult, ApiSuccessResult>> saveDetailGizi,

    // ==========================
    required List<DokterSpesialisModel> dokterSpesialis,
    required bool isSuccessSpesialis,
    required String failMessageSpesialis,
    required List<KProcedureModel> kProcedure,

    // ================= LABORATORIUM
    required List<String> laborSelection,
    required bool isLoadingSaveInputDetailLabor,
    required List<PemeriksaanDetailLaborModel> detailPemeriksaanLabor,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        saveInputDetailLabor,

    //  ================ FISIO TERAPI
    required List<FisioTerapiModel> fisioTerapiModel,
    required bool loadingSaveFisioterapi,
    required List<String> fisioterapiSelection,
    required List<DetailTaripRadiologiModel> detailFisioterapi,
    required Option<Either<ApiFailureResult, ApiSuccessResult>> saveFisioterapi,

    // ================= Detail Radiologi
    required List<DetailTaripRadiologiModel> detailRadiologi,
    required bool loadingSaveRadiologi,
    required List<KfisioTerapiModel> radiologiModel,
    required List<String> radiologiSelection,
    required Option<Either<ApiFailureResult, ApiSuccessResult>> saveRadiologi,

    // ==================  ==============
    required String dokterSpesialisSelected,
    required String imageLokalis,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        savefailOrSuccessResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        savefailOrSuccessAnamnesaResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        getfailOrSuccessAnamnesaResult,

    //
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        getfailOrSuccessResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        getStatusLokalisResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        saveStatusLokalisResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        getStatusPemeriksaanFisikResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        saveStatusPemeriksaanFisikResult,
  }) = _AsesmenIgdState;

  factory AsesmenIgdState.initial() => AsesmenIgdState(
        prognosisStr: "",
        alasanKonsulStr: "",
        // =========================== TINDAK LANJUT IGD ===================================== //
        getTindakLanjutIGDResult: none(),
        isLoadingGetTindakLanjut: false,
        isLoadingSaveTindakLanjut: false,
        saveTindakLanjutIGDResult: none(),
        tindakLanjutIGDModel: TindakLanjutIgdModel(
            caraKeluar: "",
            jam: "",
            menit: "",
            pulang1: "",
            pulang1Detail: "",
            pulang2: "",
            pulang2Detail: "",
            pulang3: "",
            pulang3Detail: ""),
        // ============================= RIWAYAT KEHAMILAN ========================== //
        getRiwayatKehamilanResult: none(),
        saveRiwayatKehamilanResult: none(),
        isLoadingGetRiwayatKehamilan: false,
        isLoadingSaveRiwayatKehamilan: false,
        riwayatKehamilanModel: RiwayatKehamilanModel(
            kehamilan: false,
            gravida: "",
            para: "",
            abortus: "",
            hpht: "",
            ttp: "",
            leopold1: "",
            leopold2: "",
            leopold3: "",
            leopold4: "",
            ddj: "",
            vt: ""),
        // ============================= END RIWAYAT KEHAMILAN
        isLoadingSaveResikoDekubitus: false,
        isloadingGetResikoDekubitus: false,
        geSkriningResikoDekubitus: none(),
        saveSkriningResikoDekubitus: none(),
        skriningResikoDekubitus: SkriningResikoDekubitusModel(
            dekubitus1: "",
            dekubitus2: "",
            dekubitus3: "",
            dekubitus4: "",
            dekubitusAnak: ""),
        isLoadingGetInformasiKeluhan: false,
        isLoadingSaveInformasiKeluhan: false,
        asemenKeluhanIGDModel: AsesmenKeluhanIgdModel(
          asalMasuk: "",
          asalMasukDetail: "",
          beratBedan: "",
          info: "",
          caraMasuk: "",
          caraMasukDetail: "",
          fungsional: "",
          hasilKaji: "",
          infoDetail: "",
          resikoJatuh1: "",
          resikoJatuh2: "",
          riwayatObat: "",
          riwayatPenyakit: "",
          tinggiBadan: "",
        ),
        getRencanaTindakLanjut: none(),
        getStatusLokalisResult: none(),
        getStatusPemeriksaanFisikResult: none(),
        getfailOrSuccessAnamnesaResult: none(),
        getfailOrSuccessResult: none(),
        giziModel: [],
        giziSelection: [],
        imageLokalis: "images/lokalis/lokalis_default.png",
        jenisPelayananStr: "",
        kProcedure: [],
        keluhanUtamaStr: "",
        kepalaDetailStr: "",
        kepalaSelectedStr: "",
        kesadaranStr: "",
        laborSelection: [],
        lainLainStr: "",
        leherDetailStr: "",
        leherSelectedStr: "",
        punggungDetailStr: "",
        punggungSelectedStr: "",
        radiologiModel: [],
        radiologiSelection: [],
        riwayatPenayakitDalamKeluargaStr: "",
        riwayatPenyakitDahulurStr: "",
        saveDetailGizi: none(),
        saveFisioterapi: none(),
        saveInformasiKeluhanResult: none(),
        saveInputDetailLabor: none(),
        saveRadiologi: none(),
        saveRencanaTindakLanjut: none(),
        saveStatusLokalisResult: none(),
        saveStatusPemeriksaanFisikResult: none(),
        savefailOrSuccessAnamnesaResult: none(),
        savefailOrSuccessResult: none(),
        telaahStr: "",
        isLoadingGetAnamnesa: false,
        isLoadingGetLokalis: false,
        isLoadingGetPemeriksaanFisik: false,
        isLoadingGetRencanaTindakLanjut: false,
        isLoadingSaveAnamnesa: false,
        isLoadingSaveInputDetailLabor: false,
        isLoadingSaveLokalis: false,
        isLoadingSavePemeriksaanFisik: false,
        isLoadingSaveRencanaTindakLanjut: false,
        isSuccessSpesialis: false,
        isloading: false,
        loadingSaveFisioterapi: false,
        loadingSaveGizi: false,
        loadingSaveRadiologi: false,
        abdomenDetailStr: "",
        abdomenSelectedStr: "",
        alasanObnameStr: "",
        asuhanTerapiStr: "",
        dadaDetailStr: "",
        dadaSeletedStr: "",
        detailFisioterapi: [],
        detailGizi: [],
        detailPemeriksaanLabor: [],
        detailRadiologi: [],
        dokterSpesialis: [],
        dokterSpesialisSelected: "",
        ekstremitasDetailStr: "",
        ekstremitasSelectedStr: "",
        failMessageSpesialis: "",
        fisioTerapiModel: [],
        fisioterapiSelection: [],
        genetaliaDetailStr: "",
        genetaliaSelectedStr: "",
        getFailResultTindakLanjut: none(),
        getInforasiKeluhanResult: none(),
      );
}
