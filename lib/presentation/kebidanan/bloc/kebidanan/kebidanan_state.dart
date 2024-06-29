part of 'kebidanan_bloc.dart';

enum KebidananStatus {
  initial,
  loading,
  loaded,
  error,
  isLoadedKebidanan,
  isLoadingGetKebidanan,
  isLoadingGetPemeriksaanFisik,

  isLoadingGetVitalSignBidan,
  isLoadedVitalSignBidan,
  isLoadingSaveVitalSignBidan,

  // riwayat kebidanan
  isLoadingRiwayatKebidanan,
  isLoadedRiwayatKebidanan,

  isLoadingGetRiwayatKebidanan,
  isLoadedGetRiwayatKebidanan,

  loadeSelection,
  isLoadingPengkajianFungsional,
  loadedPengkajianFungsional,

  isLoadingSavePengkajianFungsional,
  isLoadedSavePengkajianFungsional,

  // SAVE PEMERIKSAAN FISIK KEBIDANAN
  isLoadingPemeriksaanFisikKebidanan,
  loadedPemeriksaanFisikKebidanan,
}

class KebidananState extends Equatable {
  final KebidananStatus kebidananStatus;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> getResult;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult;
  final PengkajianFungsional pengkajianFungsional;
  final PemeriksaanFisikLainnya pemeriksaanFisikLainnya;
  final List<RiwayatPengobatanDirumahModel> riwayaPengobatan;
  final VitalSignBidanModel vitalSignBidanModel;
  final PemeriksaanFisikResponseModel pemeriksaanFisik;
  final List<KehamilanKebidanModel> kebidanModel;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveVitalSignResult;
  final Option<Either<ApiFailureResult, ApiSuccessResult>>
      saveRiwayatKebidananResult;
  final Option<Either<ApiFailureResult, ApiSuccessResult>>
      saveResultPengkajianFungsionalResult;
  final Option<Either<ApiFailureResult, ApiSuccessResult>>
      savePemeriksaanFisikResult;

  const KebidananState({
    required this.pemeriksaanFisikLainnya,
    required this.pengkajianFungsional,
    required this.savePemeriksaanFisikResult,
    required this.saveResultPengkajianFungsionalResult,
    required this.vitalSignBidanModel,
    required this.pemeriksaanFisik,
    required this.kebidanModel,
    required this.kebidananStatus,
    required this.getResult,
    required this.saveResult,
    required this.riwayaPengobatan,
    required this.saveVitalSignResult,
    required this.saveRiwayatKebidananResult,
  });

  @override
  List<Object?> get props => [
        pemeriksaanFisikLainnya,
        saveResultPengkajianFungsionalResult,
        savePemeriksaanFisikResult,
        pengkajianFungsional,
        pemeriksaanFisik,
        kebidananStatus,
        vitalSignBidanModel,
        getResult,
        saveResult,
        riwayaPengobatan,
        saveVitalSignResult,
        kebidanModel,
      ];

  static KebidananState initial() => KebidananState(
      pemeriksaanFisikLainnya: PemeriksaanFisikLainnya(
          kepala: "",
          mata: "",
          telinga: "",
          mulut: "",
          mucosaMulut: "",
          gigi: "",
          hidung: "",
          tenggorokan: "",
          payudara: "",
          leherDanBahu: "",
          abdomen: "",
          nutrisiDanHidrasi: ""),
      savePemeriksaanFisikResult: const None(),
      saveResultPengkajianFungsionalResult: const None(),
      pengkajianFungsional: PengkajianFungsional(
          keterangan: "",
          nilaiF10: 0,
          nilaiF1: 0,
          nilaiF2: 0,
          nilaiF3: 0,
          nilaiF4: 0,
          nilaiF5: 0,
          nilaiF6: 0,
          nilaiF7: 0,
          nilaiF8: 0,
          nilaiF9: 0,
          noreg: "",
          f1: "",
          f2: "",
          f3: "",
          f4: "",
          f5: "",
          f6: "",
          f7: "",
          f8: "",
          f9: "",
          f10: "",
          nilai: 0),
      pemeriksaanFisik: PemeriksaanFisikResponseModel(
          nutrisiDanHidrasi: "",
          abdomen: "",
          mucosaMulut: "",
          insertDttm: "",
          updDttm: "",
          device: "",
          userId: "",
          kategori: "",
          person: "",
          kdBagian: "",
          noreg: "",
          kepala: "",
          mata: "",
          telinga: "",
          mulut: "",
          gigi: "",
          hidung: "",
          tenggorokan: "",
          payudara: "",
          leherDanBahu: ""),
      kebidanModel: const [],
      saveRiwayatKebidananResult: none(),
      saveVitalSignResult: none(),
      kebidananStatus: KebidananStatus.initial,
      riwayaPengobatan: const [],
      vitalSignBidanModel: VitalSignBidanModel(
          akral: "",
          pupil: "",
          kesadaran: "",
          tfu: "",
          ddj: "",
          tekananDarah: "",
          nadi: "",
          pernapasan: "",
          suhu: "",
          tinggiBadan: "",
          beratBadan: "",
          gcsE: "",
          gcsV: "",
          gcsM: ""),
      getResult: none(),
      saveResult: none());

  KebidananState copyWith({
    KebidananStatus? kebidananStatus,
    PemeriksaanFisikLainnya? pemeriksaanFisikLainnya,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? getResult,
    Option<Either<ApiFailureResult, ApiSuccessResult>>?
        savePemeriksaanFisikResult,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResult,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveVitalSignResult,
    Option<Either<ApiFailureResult, ApiSuccessResult>>?
        saveRiwayatKebidananResult,
    List<RiwayatPengobatanDirumahModel>? riwayaPengobatan,
    VitalSignBidanModel? vitalSignBidanModel,
    List<KehamilanKebidanModel>? kebidanModel,
    PemeriksaanFisikResponseModel? pemeriksaanFisik,
    PengkajianFungsional? pengkajianFungsional,
    Option<Either<ApiFailureResult, ApiSuccessResult>>?
        saveResultPengkajianFungsionalResult,
  }) {
    return KebidananState(
        pemeriksaanFisikLainnya:
            pemeriksaanFisikLainnya ?? this.pemeriksaanFisikLainnya,
        savePemeriksaanFisikResult:
            savePemeriksaanFisikResult ?? this.savePemeriksaanFisikResult,
        saveResultPengkajianFungsionalResult:
            saveResultPengkajianFungsionalResult ??
                this.saveResultPengkajianFungsionalResult,
        pengkajianFungsional: pengkajianFungsional ?? this.pengkajianFungsional,
        pemeriksaanFisik: pemeriksaanFisik ?? this.pemeriksaanFisik,
        kebidanModel: kebidanModel ?? this.kebidanModel,
        saveRiwayatKebidananResult:
            saveRiwayatKebidananResult ?? this.saveRiwayatKebidananResult,
        vitalSignBidanModel: vitalSignBidanModel ?? this.vitalSignBidanModel,
        saveVitalSignResult: saveVitalSignResult ?? this.saveVitalSignResult,
        kebidananStatus: kebidananStatus ?? this.kebidananStatus,
        riwayaPengobatan: riwayaPengobatan ?? this.riwayaPengobatan,
        getResult: getResult ?? this.getResult,
        saveResult: saveResult ?? this.saveResult);
  }
}
