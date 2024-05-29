part of 'asesmen_igd_bloc.dart';

enum AsesmenIgdStatus {
  initial,
  loading,
  loaded,
  error,

  isLodingGetData,
  isLodingGetDiagnosaBanding,
  isLoadingSave,

  isChanged
}

class AsesmenIgdAwalState extends Equatable {
  final PengkajianAwalIgdRepository pengkajianWalIGD;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResultFailure;
  final AsesmenIgdStatus status;
  const AsesmenIgdAwalState({
    required this.status,
    required this.pengkajianWalIGD,
    required this.saveResultFailure,
  });

  @override
  List<Object?> get props => [
        status,
        saveResultFailure,
        pengkajianWalIGD,
      ];

  static AsesmenIgdAwalState initial() => AsesmenIgdAwalState(
      saveResultFailure: none(),
      status: AsesmenIgdStatus.initial,
      pengkajianWalIGD: PengkajianAwalIgdRepository(
        pengkajian: PengkajianIGD(
            keluhanUtama: "",
            riwayatPenyakitSekarang: "",
            riwayatPenyakitDahulu: "",
            info: "",
            infoDetail: "",
            caraMasuk: "",
            asalMasuk: "",
            fungsiAktivitas: "",
            reaksiAlergi: ""),
        riwayatPenyakitKeluarga: [],
        riwayatTerdahulu: [],
      ));

  AsesmenIgdAwalState copyWith({
    PengkajianAwalIgdRepository? pengkajianWalIGD,
    AsesmenIgdStatus? status,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResultFailure,
  }) {
    return AsesmenIgdAwalState(
      saveResultFailure: saveResultFailure ?? this.saveResultFailure,
      pengkajianWalIGD: pengkajianWalIGD ?? this.pengkajianWalIGD,
      status: status ?? this.status,
    );
  }
}
