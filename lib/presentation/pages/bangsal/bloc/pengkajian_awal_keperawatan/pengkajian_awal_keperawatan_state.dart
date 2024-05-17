part of 'pengkajian_awal_keperawatan_bloc.dart';

enum PengkajianAwalKeperawatanStatus {
  initial,
  loading,
  loaded,
  error,
  onSelected,
  isLoadingSave,
  isLoadingGet,
  //======//
  isLoadingGetAsesmenAnak,
  isLoadedAsesmenAnak,
  isLoadingSaveAsesmenAnak,
}

class PengkajianAwalKeperawatanState extends Equatable {
  final PengkajianKeperawatanResponseModel pengkajianKeperawatanResponseModel;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResultFailure;
  final Option<Either<ApiFailureResult, ApiSuccessResult>>
      saveResultAsesmenAnakFailure;
  final PengkajianAwalKeperawatanStatus status;
  final PenkajianAnakRepository pengkajianAnak;

  const PengkajianAwalKeperawatanState({
    required this.status,
    required this.pengkajianAnak,
    required this.pengkajianKeperawatanResponseModel,
    required this.saveResultFailure,
    required this.saveResultAsesmenAnakFailure,
  });

  @override
  List<Object?> get props => [
        status,
        pengkajianKeperawatanResponseModel,
        saveResultFailure,
        saveResultAsesmenAnakFailure,
        pengkajianAnak,
      ];

  static PengkajianAwalKeperawatanState initial() =>
      PengkajianAwalKeperawatanState(
        pengkajianAnak: PenkajianAnakRepository(
            riwayatPenyakitKeluarga: [],
            riwayatTerdahulu: [],
            pengkajianAnak: PengkajianAnak(
                noreg: "",
                person: "",
                kdDpjp: "",
                jenpel: "",
                jenpelDetail: "",
                keluhanUtama: "",
                rwtPenyakit: "",
                reaksiAlergi: "",
                rwtPenyakitDahulu: "")),
        saveResultFailure: none(),
        pengkajianKeperawatanResponseModel: PengkajianKeperawatanResponseModel(
            riwayatTerdahulu: [],
            riwayatPenyakitKeluarga: [],
            pengkajian: Pengkajian(
                riwayatPenyakitDahulu: "",
                detailJenpel: "",
                noreg: "",
                person: "",
                dpjp: "",
                jenpel: "",
                keluhanUtama: "",
                rwytPenyakit: "",
                reaksiAlergi: "")),
        status: PengkajianAwalKeperawatanStatus.initial,
        saveResultAsesmenAnakFailure: none(),
      );

  PengkajianAwalKeperawatanState copyWith({
    PengkajianKeperawatanResponseModel? pengkajianKeperawatanResponseModel,
    PengkajianAwalKeperawatanStatus? status,
    PenkajianAnakRepository? pengkajianAnak,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResultFailure,
    Option<Either<ApiFailureResult, ApiSuccessResult>>?
        saveResultAsesmenAnakFailure,
  }) {
    return PengkajianAwalKeperawatanState(
        pengkajianAnak: pengkajianAnak ?? this.pengkajianAnak,
        saveResultFailure: saveResultFailure ?? this.saveResultFailure,
        pengkajianKeperawatanResponseModel:
            pengkajianKeperawatanResponseModel ??
                this.pengkajianKeperawatanResponseModel,
        status: status ?? this.status,
        saveResultAsesmenAnakFailure:
            saveResultAsesmenAnakFailure ?? this.saveResultAsesmenAnakFailure);
  }
}
