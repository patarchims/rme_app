part of 'pengkajian_awal_keperawatan_bloc.dart';

enum PengkajianAwalKeperawatanStatus {
  initial,
  loading,
  loaded,
  error,
  onSelected,
  isLoadingSave,
  isLoadingGet,
}

class PengkajianAwalKeperawatanState extends Equatable {
  final PengkajianKeperawatanResponseModel pengkajianKeperawatanResponseModel;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResultFailure;
  final PengkajianAwalKeperawatanStatus status;

  const PengkajianAwalKeperawatanState({
    required this.status,
    required this.pengkajianKeperawatanResponseModel,
    required this.saveResultFailure,
  });

  @override
  List<Object?> get props =>
      [status, pengkajianKeperawatanResponseModel, saveResultFailure];

  static PengkajianAwalKeperawatanState initial() =>
      PengkajianAwalKeperawatanState(
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
      );

  PengkajianAwalKeperawatanState copyWith({
    PengkajianKeperawatanResponseModel? pengkajianKeperawatanResponseModel,
    PengkajianAwalKeperawatanStatus? status,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResultFailure,
  }) {
    return PengkajianAwalKeperawatanState(
      saveResultFailure: saveResultFailure ?? this.saveResultFailure,
      pengkajianKeperawatanResponseModel: pengkajianKeperawatanResponseModel ??
          this.pengkajianKeperawatanResponseModel,
      status: status ?? this.status,
    );
  }
}
