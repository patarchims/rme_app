// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pengkajian_fisik_anak_bloc.dart';

enum PengkajianFisikAnakStatus {
  initial,
  loading,
  loaded,
  error,
  isLoadingGet,
  isLoadingSave,
}

class PengkajianFisikAnakState extends Equatable {
  final PemeriksaanFisikAnakModelRepository pemeriksaanFisikAnakModel;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResultFailure;
  final PengkajianFisikAnakStatus status;

  const PengkajianFisikAnakState({
    required this.status,
    required this.saveResultFailure,
    required this.pemeriksaanFisikAnakModel,
  });

  @override
  List<Object?> get props =>
      [status, pemeriksaanFisikAnakModel, saveResultFailure];

  static PengkajianFisikAnakState initial() => PengkajianFisikAnakState(
      saveResultFailure: none(),
      status: PengkajianFisikAnakStatus.initial,
      pemeriksaanFisikAnakModel: PemeriksaanFisikAnakModelRepository(
          peristaltik: "",
          abdomen: "",
          dada: "",
          gcsE: "",
          gcsM: "",
          gcsV: "",
          hidung: "",
          leherDanBahu: "",
          mata: "",
          mulut: "",
          nutrisiDanHidrasi: "",
          punggung: "",
          telinga: ""));

  PengkajianFisikAnakState copyWith({
    PemeriksaanFisikAnakModelRepository? pemeriksaanFisikAnakModel,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResultFailure,
    PengkajianFisikAnakStatus? status,
  }) {
    return PengkajianFisikAnakState(
      saveResultFailure: saveResultFailure ?? this.saveResultFailure,
      pemeriksaanFisikAnakModel:
          pemeriksaanFisikAnakModel ?? this.pemeriksaanFisikAnakModel,
      status: status ?? this.status,
    );
  }
}
