part of 'asesmen_anak_bloc.dart';

enum AsesmenAnakStatus {
  initial,
  loading,
  loaded,
  error,
  isChanged,
  isLoadingGet,
  isLoadingUpdate,
  isLoadingSave,
  loadedSave,
}

class AsesmenAnakState extends Equatable {
  final AsesmenAnakStatus status;
  final PenkajianAnakRepository pengkajianAnak;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResultFailure;

  const AsesmenAnakState({
    required this.status,
    required this.pengkajianAnak,
    required this.saveResultFailure,
  });

  @override
  List<Object?> get props => [status, pengkajianAnak, saveResultFailure];

  static AsesmenAnakState initial() => AsesmenAnakState(
      saveResultFailure: none(),
      status: AsesmenAnakStatus.initial,
      pengkajianAnak: PenkajianAnakRepository(
          riwayatPenyakitKeluarga: [],
          riwayatTerdahulu: [],
          pengkajianAnak: PengkajianAnak(
              rwtImunisasi: "",
              rwtKelahiran: "",
              noreg: "",
              person: "",
              kdDpjp: "",
              jenpel: "",
              jenpelDetail: "",
              keluhanUtama: "",
              rwtPenyakit: "",
              reaksiAlergi: "",
              rwtPenyakitDahulu: "")));

  AsesmenAnakState copyWith({
    AsesmenAnakStatus? status,
    PenkajianAnakRepository? pengkajianAnak,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResultFailure,
  }) {
    return AsesmenAnakState(
      status: status ?? this.status,
      pengkajianAnak: pengkajianAnak ?? this.pengkajianAnak,
      saveResultFailure: saveResultFailure ?? this.saveResultFailure,
    );
  }
}
