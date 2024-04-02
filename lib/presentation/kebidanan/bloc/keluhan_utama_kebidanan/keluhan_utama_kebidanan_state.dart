// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'keluhan_utama_kebidanan_bloc.dart';

enum KeluhanUtamaKebidananStatus {
  initial,
  loading,
  loaded,
  error,
  isLoadedKebidanan,
  isLoadingGetKebidanan,

  isloadingSaveData,
  isLoadedSaveData,
  isSavePenyakitKeluarga,

  isLoadingGetData,
  isLoadedGetData,

  onChanged
}

class KeluhanUtamaKebidananState extends Equatable {
  final KeluhanUtamaKebidananStatus status;
  final AsesmenKebidananResponseModel asesmenKebidananResponseModel;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult;
  const KeluhanUtamaKebidananState({
    required this.status,
    required this.saveResult,
    required this.asesmenKebidananResponseModel,
  });
  @override
  List<Object?> get props => [status, asesmenKebidananResponseModel];

  static KeluhanUtamaKebidananState initial() => KeluhanUtamaKebidananState(
      saveResult: none(),
      status: KeluhanUtamaKebidananStatus.initial,
      asesmenKebidananResponseModel: AsesmenKebidananResponseModel(
          riwayatPenyakitKeluarga: [],
          riwayatTerdahulu: [],
          asesmen: Asesmen(
              rwytDahulu: "",
              noreg: "",
              keluhanUtama: "",
              rwytPenyakit: "",
              rwytMenstruasi: "",
              keluhanMenyertai: "",
              siklusHaid: "",
              rwytPenikahan: "")));

  KeluhanUtamaKebidananState copyWith({
    KeluhanUtamaKebidananStatus? status,
    AsesmenKebidananResponseModel? asesmenKebidananResponseModel,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResult,
  }) {
    return KeluhanUtamaKebidananState(
      saveResult: saveResult ?? this.saveResult,
      status: status ?? this.status,
      asesmenKebidananResponseModel:
          asesmenKebidananResponseModel ?? this.asesmenKebidananResponseModel,
    );
  }
}
