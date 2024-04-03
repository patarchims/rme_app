// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pemeriksaan_fisik_icu_bloc.dart';

enum PemeriksaanFisikIcuStatus {
  initial,
  loading,
  loaded,
  error,
  isLoadingGet,
  isLoadingSave,
}

class PemeriksaanFisikIcuState extends Equatable {
  final PemeriksaanFisikIcuModel fisikModel;
  final PemeriksaanFisikIcuStatus status;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult;
  const PemeriksaanFisikIcuState({
    required this.status,
    required this.fisikModel,
    required this.saveResult,
  });
  @override
  List<Object?> get props => [status, fisikModel, saveResult];

  static PemeriksaanFisikIcuState initial() => PemeriksaanFisikIcuState(
      saveResult: none(),
      status: PemeriksaanFisikIcuStatus.initial,
      fisikModel: PemeriksaanFisikIcuModel(
        dada: "",
        ekstremitas: "",
        gcsE: "",
        gcsM: "",
        gcsV: "",
        gigi: "",
        hidung: "",
        integumen: "",
        jantung: "",
        kepala: "",
        leher: "",
        lidah: "",
        mata: "",
        mulut: "",
        rambut: "",
        respirasi: "",
        telinga: "",
        tenggorokan: "",
        wajah: "",
        kesadaran: "",
      ));

  PemeriksaanFisikIcuState copyWith({
    PemeriksaanFisikIcuModel? fisikModel,
    PemeriksaanFisikIcuStatus? status,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResult,
  }) {
    return PemeriksaanFisikIcuState(
      saveResult: saveResult ?? this.saveResult,
      fisikModel: fisikModel ?? this.fisikModel,
      status: status ?? this.status,
    );
  }
}
