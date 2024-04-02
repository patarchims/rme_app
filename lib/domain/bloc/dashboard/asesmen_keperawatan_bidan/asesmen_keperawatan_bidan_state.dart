part of 'asesmen_keperawatan_bidan_bloc.dart';

enum PilihDiagnosaKeperawatan { diagnosa, keluaran, intervensi, selesai }

@freezed
class AsesmenKeperawatanBidanState with _$AsesmenKeperawatanBidanState {
  const factory AsesmenKeperawatanBidanState({
    //
    @Default(PilihDiagnosaKeperawatan.diagnosa)
    PilihDiagnosaKeperawatan pilihDiagnosaKeperawatan,
    @Default(false) bool isLoadingSave,
    @Default(false) bool isLoadingGet,
    @Default(false) bool isLoadingGetSIKI,

    // ASESMEN KEPERAWATAN
    @Default(false) bool isLoadingGetAsesmenKeperawatan,
    @Default(false) bool isLoadingSaveAsesmenKeperawatan,
    @Default(None())
    Option<Either<ApiFailureResult, ApiSuccessResult>>
        getResultAsesmenKeperawatan,
    @Default(None())
    Option<Either<ApiFailureResult, ApiSuccessResult>>
        saveResultAsesmenKeperawatan,

    // GET ASUHAN KEPERAWATAN
    @Default(false) bool isLoadingAsuhanKeperawatan,
    @Default(false) bool isLoadingSaveAsuhanKeperawatan,
    @Default(false) bool isDiagnosa,
    @Default(None())
    Option<Either<ApiFailureResult, ApiSuccessResult>>
        getFailResultAsuhanKeperawatan,
    @Default(None())
    Option<Either<ApiFailureResult, ApiSuccessResult>>
        saveResultAsuhanKeperawatan,

    // ============================= PILIH INTERVENSI MODEL
    @Default([]) List<IntervensiSelectionModel> intervensiSelectionModel,

    // SIMPAN LIST OF INTERVENSI MODEL
    @Default([]) List<IntervensiModel> intervesiModel,
    // LIST DESKRIPSI SIKI
    @Default([]) List<DeskripsisSikiModel> deskripsiSiki,

    // ============================== SELECTION SIKI
    @Default(false) bool isLoadingSelectionSIKI,
    // SIMPAN SIKI DISINI
    @Default(null) SikiModel? selectionSIKI,

    // ============================== CARI MASALAH KEPERAWATAN
    @Default(false) bool isLoadingCariSDKI,
    @Default(false) bool isLoadingIntervensi,
    @Default("") String selectedKeluaran,
    // SIMPAN SDKI DISINI
    @Default(null) SDKIModel? sdkiModel,

    // =============================
    @Default(None())
    Option<Either<ApiFailureResult, ApiSuccessResult>> getFailOrSuccessCariSiki,
    @Default(None())
    Option<Either<ApiFailureResult, ApiSuccessResult>>
        getFailOrScuccessCariIntervensi,
    @Default(None())
    Option<Either<ApiFailureResult, ApiSuccessResult>> getfailOrSuccessCariSDKI,
    @Default(None())
    Option<Either<ApiFailureResult, ApiSuccessResult>> getfailOrSuccessResult,
    @Default(None())
    Option<Either<ApiFailureResult, ApiSuccessResult>> saveOrSuccessResult,
  }) = _AsesmenKeperawatanBidanState;
}
